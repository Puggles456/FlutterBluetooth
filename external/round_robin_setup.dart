import 'package:flutter/material.dart';
import 'dart:async';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('BLE File Transfer')),
        body: Center(
          child: ElevatedButton(
            onPressed: () async {
              final device = BTDeviceStruct(id: 'device_id'); // replace with your device ID
              final serviceUuid = '00001234-0000-1000-8000-00805f9b34fb';
              final characteristicUuids = [
                '00002345-0000-1000-8000-00805f9b34fb',
                '00003456-0000-1000-8000-00805f9b34fb',
                '00004567-0000-1000-8000-00805f9b34fb',
              ];

              // Replace with your data to send
              final data = List<int>.generate(1024, (index) => index % 256);

              // Send data
              await sendData(device, serviceUuid, characteristicUuids, data);

              // Receive data
              final dataStreamController = StreamController<Uint8List>();
              receiveData(device, serviceUuid, characteristicUuids, dataStreamController);
              dataStreamController.stream.listen((data) {
                print('Received data: $data');
              });
            },
            child: Text('Send and Receive Data'),
          ),
        ),
      ),
    );
  }
}
