import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import 'TDCBleManager.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'ack.dart';
import 'SubSystem_Id_t.dart';
import 'TDCCommandId.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:async';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

Future<void> TDC_receive_data(
  BTDeviceStruct deviceInfo,
  String serviceUuid,
  String characteristicWriteUuid,
  String characteristicNotifyUuid,
  StreamController<Uint8List> dataStreamController,
  Function(Uint8List)? dataCallBack,
) async {
  try {
    final device = BluetoothDevice.fromId(deviceInfo.id);
    final services = await device.discoverServices();
    int check = 0;

    BluetoothService? targetService;
    BluetoothCharacteristic? writeCharacteristic;
    BluetoothCharacteristic? notifyCharacteristic;

    // Find the target service and characteristics
    for (BluetoothService service in services) {
      if (service.uuid == Guid(serviceUuid)) {
        targetService = service;

        for (BluetoothCharacteristic characteristic
            in service.characteristics) {
          if (characteristic.uuid == Guid(characteristicWriteUuid) &&
              characteristic.properties.write) {
            writeCharacteristic = characteristic;
          }
          if (characteristic.uuid == Guid(characteristicNotifyUuid) &&
              characteristic.properties.notify) {
            notifyCharacteristic = characteristic;
          }
        }
      }
    }

    // Handle write characteristic
    /*
    if (writeCharacteristic != null) {
      debugPrint('Found write characteristic: ${writeCharacteristic.uuid}');
      await sendCommand(writeCharacteristic);
    }
    */

    // Handle notify characteristic
    if (notifyCharacteristic != null) {
      debugPrint("LISTENING TO DATA");
      await notifyCharacteristic.setNotifyValue(true);
      notifyCharacteristic.value.listen((value) {
        if (!dataStreamController.isClosed) {
          check = 1;
          final data = Uint8List.fromList(value);
          dataStreamController.add(data);

          if (dataCallBack != null) {
            dataCallBack(data);
          }
        } else {
          debugPrint('StreamController is closed, cannot add new data.');
        }
      });

      
    }
    if(writeCharacteristic != null && check == 0){
      await sendCommand(writeCharacteristic);
    }
    print("OUTSIDE LOGIC");
  } catch (e) {
    debugPrint("PROBLEM " + e.toString());
  }
}

Future<void> sendCommand(BluetoothCharacteristic characteristic) async {
  Uint8List list = Uint8List.fromList([0x01, 0x00]);
  try {
    // Format the message
    final commandData = ACFormatPacketProtocol.formatMessage(
      TDCCommandID.DeviceSystemInfo,
      null,
      ACFormatPacketProtocol.READ,
      SubSystem_ID_t.subSysController,
      SubSystem_ID_t.subSysApplication,
      0,
      1,
      1,
      false, // Assuming isPMG is false for this example
    );

    // Send the command
    await characteristic.write(commandData);
    debugPrint("Command sent successfully");
  } catch (e) {
    debugPrint("Failed to send command: ${e.toString()}");
  }
}
