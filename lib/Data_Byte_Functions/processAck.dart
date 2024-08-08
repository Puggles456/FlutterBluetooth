import 'dart:typed_data';
import 'payload.dart';

void processAck(Uint8List currentData, Uint8List _data) {
  Uint8List? payload = getPayloadDataArray(currentData, 0, 0, _data);

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
