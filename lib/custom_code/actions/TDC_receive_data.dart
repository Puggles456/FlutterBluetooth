import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import 'TDCBleManager.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'ack.dart';
import 'SubSystem_Id_t.dart';
import 'TDCCommandId.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
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
    var hasWriteCharacteristic = false;

    final services = await device.discoverServices();
    for (BluetoothService service in services) {
      if (service.uuid == Guid(serviceUuid)) {
        // Check for write characteristic
        for (BluetoothCharacteristic characteristic in service.characteristics) {
          final isWrite = characteristic.properties.write;
          if (isWrite && characteristic.uuid == Guid(characteristicWriteUuid)) {
            debugPrint('Found write characteristic: ${characteristic.uuid}');
            hasWriteCharacteristic = true;

            // Send the command
            await sendCommand(characteristic);

            break; // Exit loop once the write characteristic is found
          }
        }

        // Set up notifications
        for (BluetoothCharacteristic characteristic in service.characteristics) {
          if (characteristic.uuid == Guid(characteristicNotifyUuid) &&
              characteristic.properties.notify) {
            debugPrint("LISTENING TO DATA");
            await characteristic.setNotifyValue(true);

            characteristic.value.listen((value) {
              if (!dataStreamController.isClosed) {
                final data = Uint8List.fromList(value);
                dataStreamController.add(data);

                if (dataCallBack != null) {
                  dataCallBack(data);
                }
              } else {
                debugPrint('StreamController is closed, cannot add new data.');
              }
              //return;
            });
          }
        }
      }
    }
  } catch (e) {
    debugPrint("PROBLEM " + e.toString());
  }
}

Future<void> sendCommand(BluetoothCharacteristic characteristic) async {
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
