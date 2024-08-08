import 'dart:ffi';
import 'dart:typed_data';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '/custom_code/actions/TDCCommandId.dart';
import '/Data_Byte_Functions/processAck.dart';


class DataByteManager extends ChangeNotifier {
  Uint8List _data = Uint8List(0);
  Uint8List get data => _data;
  int DATE_FIRST = 0x41;
  int DATE_LAST = 0x43;
  int dataType = -1;
  int PAYLOAD_START_BYTE_IDX = 10;
  int PAYLOAD_LENGTH_IDX = 8;

  void setData(Uint8List data) {
    _data = data;
    process();
    notifyListeners();
  }

  Uint8List getData() {
    return _data;
  }

  void process() {
    for (int i = 0; i < _data.length; i++) {
      if (_data[i] == DATE_FIRST && _data[i + 1] == DATE_LAST) {
    
        dataType = data[i + 2] & 0xFF;

        int length = _data.length - i;
        Uint8List currentData = Uint8List(length);
        currentData = data.sublist(i, data.length);

        int id = TDCCommandID.DownloadData;

        switch (dataType) {
          case TDCCommandID.WriteParameter:
            print("CASE 1");
            break;

          case TDCCommandID.DeviceSystemInfo:
            print("CASE 2");
            break;

          case TDCCommandID.WriteDateTime:
            print("CASE 3");
            break;

          case TDCCommandID.SystemInfo:
            print("CASE 4");
            break;

          case TDCCommandID.GPSDataMagnetometer:
            print("CASE 5");
            break;

          case TDCCommandID.GPSCommand:
            print("CASE 6");
            break;

          case TDCCommandID.PowerMonitor:
            print("CASE 7");
            break;

          case TDCCommandID.Ack:
            processAck(currentData,_data);
            break;
        }
      }
    }
  }


}
