import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

Future<void> receiveData(
  BTDeviceStruct deviceInfo,
  String serviceUuid,
  List<String> characteristicUuids,
  StreamController<Uint8List> dataStreamController,
) async {
  try {
    final device = BluetoothDevice.fromId(deviceInfo.id);
    await device.connect();
    final services = await device.discoverServices();

    for (BluetoothService service in services) {
      if (service.uuid == Guid(serviceUuid)) {
        for (String charUuid in characteristicUuids) {
          for (BluetoothCharacteristic characteristic in service.characteristics) {
            if (characteristic.uuid == Guid(charUuid)) {
              if (characteristic.properties.notify) {
                print("LISTENING TO DATA");
                await characteristic.setNotifyValue(true);
                characteristic.value.listen((value) {
                  final data = Uint8List.fromList(value);
                  dataStreamController.add(data);
                });
              }
            }
          }
        }
      }
    }
  } catch (e) {
    debugPrint("PROBLEM " + e.toString());
  }
}

Future<void> sendData(
  BTDeviceStruct deviceInfo,
  String serviceUuid,
  List<String> characteristicUuids,
  List<int> data,
) async {
  try {
    final device = BluetoothDevice.fromId(deviceInfo.id);
    await device.connect();
    final services = await device.discoverServices();

    for (BluetoothService service in services) {
      if (service.uuid == Guid(serviceUuid)) {
        final characteristics = service.characteristics
            .where((c) => characteristicUuids.contains(c.uuid.toString()))
            .toList();

        final chunkSize = 185; // Adjusted to 185 bytes to fit within MTU limitations
        int index = 0;
        int charIndex = 0;

        while (index < data.length) {
          final chunk = data.skip(index).take(chunkSize).toList();
          await characteristics[charIndex].write(chunk, withoutResponse: true);
          index += chunkSize;
          charIndex = (charIndex + 1) % characteristics.length; // Rotate between characteristics
        }
      }
    }
  } catch (e) {
    debugPrint("PROBLEM " + e.toString());
  }
}
