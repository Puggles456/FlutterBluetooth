import 'dart:ffi';
import 'dart:typed_data';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '/custom_code/actions/TDCCommandId.dart';

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
        print("COOOOOLLL BEANS");
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
            processAck(currentData);
            break;
        }
      }
    }
  }

  void processAck(Uint8List currentData) {
    Uint8List? payload = getPayloadDataArray(currentData, 0, 0);

    //Uint8List d = {payload?[3]} as Uint8List;

   // String hexString = d[0].toRadixString(16).toUpperCase().padLeft(2, '0');

    //print("ACK: $hexString");

    int ackCode = payload![3];
    switch (ackCode) {
      case 0x00:
        print("Success");
        break;

      case 0x11:
        print("File Not Found");
        break;

      case 0x13:
        print("Failed to Send Message");
        break;

      case 0x15:
        print("Animation Read Not Yet Supported");
        break;

      case 0x18:
        print("Animation Exceeds Max Num Cells");
        break;

      case 0x19:
        print("Invalid Payload Size");
        break;

      case 0x1A:
        print("Animation Num Cells NE Num Packets");
        break;

      case 0x1B:
        print("Packet Already Written");
        break;

      case 0x23:
        print("Signature Mismatch");
        break;

      case 0x25:
        print("Invalid Transport");
        break;

      case 0x34:
        print("Major Version Mismatch");
        break;

      case 0x35:
        print("Incremental Version Mismatch");
        break;

      case 0x55:
        print("CRC Mismatch");
        break;

      case 0x89:
        print("Screen Size Mismatch");
        break;

      case 0x94:
        print("Type Mismatch");
        break;

      case 0x95:
        print("Invalid Filename");
        break;

      case 0x96:
        print("Invalid Filename Length");
        break;

      case 0x97:
        print("Filename Size Mismatch");
        break;

      case 0x98:
        print("Invalid Filename Extension");
        break;

      case 0x99:
        print("Page Already Exists");
        break;

      case 0x9C:
        print("Packet Format Error");
        break;

      case 0x9D:
        print("Out Of Page Storage Space");
        break;

      case 0xA5:
        print("Page Not Open");
        break;

      case 0xB6:
        print("Resource Disabled");
        break;

      case 0xC4:
        print("Config Locked");
        break;

      case 0xC5:
        print("Invalid Password Command");
        break;

      case 0xC6:
        print("Incorrect Password");
        break;

      case 0xC7:
        print("Encrypt/Decrypt Failure");
        break;

      case 0xD0:
        print("Command Not Supported");
        break;

      case 0xD1:
        print("Firmware Package Prep Failed");
        break;

      case 0xF0:
        print("Internal Invalid Page Address");
        break;

      case 0xF1:
        print("Internal Failed SPI Mutex");
        break;

      case 0xF2:
        print("Internal Unknown Failure");
        break;

      case 0xF5:
        print("Unknown Command");
        break;

      case 0xF6:
        print("Unknown SubCommand");
        break;

      case 0xF9:
        print("Attempt to Delete Blank Block");
        break;

      case 0xFA:
        print("EEPROM Read Failed");
        break;

      case 0xFB:
        print("EEPROM Write Failed");
        break;

      case 0xFC:
        print("Alternate Process Target");
        break;

      case 0xFD:
        print("Hash Mismatch");
        break;

      case 0xFE:
        print("Flag Timeout");
        break;

      // Optionally handle default case
      default:
        print(
            "Unknown Error Code: 0x${ackCode.toRadixString(16).toUpperCase().padLeft(2, '0')}");
        break;
    }
  }

  Uint8List? getPayloadDataArray(Uint8List bytes, int payloadByteIdx, int len) {
    if (len == 0) {
      len = getPayloadLength() - payloadByteIdx;
    }

    // First make sure the index and len are valid
    if (payloadByteIdx + len > getPayloadLength()) {
      return null;
    }

    Uint8List payload = Uint8List(len);

    // Copy the bytes
    for (int i = 0; i < len; i++) {
      payload[i] = bytes[PAYLOAD_START_BYTE_IDX + payloadByteIdx + i];
    }

    return payload;
  }

  int getPayloadLength() {
    int payloadLength =
        _data[PAYLOAD_LENGTH_IDX] + (_data[PAYLOAD_LENGTH_IDX + 1] << 8);
    return payloadLength;
  }
}
