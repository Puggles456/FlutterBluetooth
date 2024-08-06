// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import 'TDCBleManager.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
import 'dart:async';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

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
    // await device.connect();
    final services = await device.discoverServices();

    for (BluetoothService service in services) {
      if (service.uuid == Guid(serviceUuid)) {
        for (BluetoothCharacteristic characteristic in service.characteristics) {
          if (characteristic.uuid == Guid(characteristicNotifyUuid) &&
              characteristic.properties.notify) {
            print("LISTENING TO DATA");
            await characteristic.setNotifyValue(true);
            characteristic.value.listen((value) {
              // Convert the data to Uint8List
              final data = Uint8List.fromList(value);
              dataStreamController.add(data);

              // Log data in hex format
              String hexString = data.map((byte) {
                return byte.toRadixString(16).padLeft(2, '0');
              }).join(' ');
              print('TDCBleManager data: $hexString');

              // Process the data
              TDCReceiveMessage.getInstance().loadData(data);

              // Call the data callback if it's set
              if (dataCallBack != null) {
                dataCallBack!(data);
              }
            });
          }
        }
      }
    }
  } catch (e) {
    debugPrint("PROBLEM " + e.toString());
  }
}