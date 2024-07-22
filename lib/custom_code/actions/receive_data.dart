// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
import 'dart:async';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter_blue_plus/flutter_blue_plus.dart';

Future<void> receiveData(
  BTDeviceStruct deviceInfo,
  String serviceUuid,
  String characteristicUuid,
  StreamController<String> dataStreamController,
) async {
  try {
    final device = BluetoothDevice.fromId(deviceInfo.id);
    //await device.connect();
    final services = await device.discoverServices();

    for (BluetoothService service in services) {
      if (service.uuid == Guid(serviceUuid)) {
        for (BluetoothCharacteristic characteristic in service.characteristics) {
          if (characteristic.uuid == Guid(characteristicUuid)) {
            if (characteristic.properties.notify) {
              print("LISTENING TO DATA");
              await characteristic.setNotifyValue(true);
              characteristic.value.listen((value) {
                final data = String.fromCharCodes(value);
                dataStreamController.add(data);
              });
            }
          }
        }
      }
    }
  } catch (e) {
    debugPrint("PROBLEM " + e.toString());
  }
}