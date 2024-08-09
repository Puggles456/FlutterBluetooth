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
import 'package:provider/provider.dart';
import '../../Data_Byte_Manager.dart';
import 'package:hex/hex.dart';

Future<void> TDC_receive_data(
  BuildContext context,
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

          String hexString = data
              .map((byte) => byte.toRadixString(16).padLeft(2, '0'))
              .join(' ');
          print('hex string of data: $hexString');

          dataStreamController.add(data);

          if (dataCallBack != null) {
            dataCallBack(data);
          }
        } else {
          debugPrint('StreamController is closed, cannot add new data.');
        }
      });
    }
    if (writeCharacteristic != null && check == 0) {
        await sendCommand(writeCharacteristic, context);
        await sendInitInfo(writeCharacteristic);
       
        
    }
    print("OUTSIDE LOGIC");
  } catch (e) {
    debugPrint("PROBLEM " + e.toString());
  }
}

Future<void> sendCommand(BluetoothCharacteristic characteristic, BuildContext context) async {
  Uint8List list = Uint8List.fromList([0x01, 0x00]);
  final dataByteManager = Provider.of<DataByteManager>(context, listen: false);
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

    String hexString = commandData
        .map((byte) => byte.toRadixString(16).padLeft(2, '0'))
        .join(' ');
    print('Command string of data: $hexString');

    // Send the command
    dataByteManager.setData(commandData);
    await characteristic.write(commandData);
    debugPrint("Command sent successfully");
  } catch (e) {
    debugPrint("Failed to send command: ${e.toString()}");
  }
}
Future<void> sendInitInfo(BluetoothCharacteristic characteristic) async {
  // First command with a 500ms delay
  await Future.delayed(Duration(milliseconds: 500));
  final commandData1 = ACFormatPacketProtocol.formatMessage(
    TDCCommandID.SystemInfo,
    null,
    ACFormatPacketProtocol.READ,
    SubSystem_ID_t.subSysController,
    SubSystem_ID_t.subSysApplication,
    0,
    1,
    1,
    false, // Assuming isPMG is false for this example
  );
  await characteristic.write(commandData1);
  debugPrint("SystemInfo Command sent successfully");

  // Second command with a 200ms delay after the first one
  await Future.delayed(Duration(milliseconds: 200));
  final commandData2 = ACFormatPacketProtocol.formatMessage(
    TDCCommandID.WriteParameter,
    null,
    ACFormatPacketProtocol.READ,
    SubSystem_ID_t.subSysController,
    SubSystem_ID_t.subSysApplication,
    0,
    1,
    1,
    false, // Assuming isPMG is false for this example
  );
  await characteristic.write(commandData2);
  debugPrint("WriteParameter Command sent successfully");

  // Third command with a 200ms delay after the second one
  await Future.delayed(Duration(milliseconds: 200));
  final commandData3 = ACFormatPacketProtocol.formatMessage(
    TDCCommandID.PowerMonitor,
    null,
    ACFormatPacketProtocol.READ,
    SubSystem_ID_t.subSysController,
    SubSystem_ID_t.subSysApplication,
    0,
    1,
    1,
    false, // Assuming isPMG is false for this example
  );
  await characteristic.write(commandData3);
  debugPrint("PowerMonitor Command sent successfully");
}
