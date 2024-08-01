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
    final services = await device.discoverServices();
    print("Services discovered: ${services.length}");

    for (BluetoothService service in services) {
      if (service.uuid == Guid(serviceUuid)) {
        print("Service found: ${service.uuid}");
        for (String charUuid in characteristicUuids) {
          for (BluetoothCharacteristic characteristic in service.characteristics) {
            if (characteristic.uuid == Guid(charUuid)) {
              print("Characteristic found: ${characteristic.uuid}");
              if (characteristic.properties.notify) {
                print("Characteristic supports notify");
                await characteristic.setNotifyValue(true);
                
                // Set notify descriptor if available
                for (BluetoothDescriptor descriptor in characteristic.descriptors) {
                  if (descriptor.uuid == Guid('00002902-0000-1000-8000-00805f9b34fb')) {
                    await descriptor.write([0x01, 0x00]);
                    print("Notify descriptor set");
                  }
                }

                characteristic.value.listen((value) {
                  print("LISTENING");
                  final data = Uint8List.fromList(value);
                  print("Data received: $data");
                  dataStreamController.add(data);
                });
              } else {
                print("Characteristic does not support notify");
              }
            }
          }
        }
      }
    }
  } catch (e) {
    debugPrint("Error: ${e.toString()}");
  }
}
