import 'dart:typed_data';

class ACFormatPacketProtocol {
  static int seqNo = 1;
  static const int READ = 1;
  static const int WRITE = 0;

  static Uint8List formatMessage(
    int commandID,
    Uint8List? packetData,
    int type,
    int targetSubsystemID,
    int sourceSubsystemID,
    int seqNo,
    int packetNum,
    int totalPacketNumber,
    bool isPMG,
  ) {
    int msgLen;
    int payloadDataLen;
    
    if (seqNo == 0) {
      seqNo = ACFormatPacketProtocol.seqNo++;
    }
    
    if (packetData != null) {
      msgLen = 10 + packetData.length + 2;
      payloadDataLen = packetData.length;
    } else {
      msgLen = 10 + 0 + 2;
      payloadDataLen = 0;
    }

    // Pad 0 if needed
    if (msgLen % 2 != 0) {
      payloadDataLen++;
      msgLen += 1;
    }

    final msgData = Uint8List(msgLen);

    // Encode header portion (9 bytes)
    msgData[0] = 0x41;
    msgData[1] = 0x43;
    msgData[2] = commandID.toUnsigned(8); // Ensure it's a byte
    msgData[3] = targetSubsystemID.toUnsigned(8);
    
    if (type == READ) {
      msgData[3] += 0x80;
    }
    
    msgData[4] = sourceSubsystemID.toUnsigned(8);
    msgData[5] = seqNo.toUnsigned(8);
    msgData[6] = packetNum.toUnsigned(8);
    msgData[7] = totalPacketNumber.toUnsigned(8);
    msgData[8] = (payloadDataLen & 0xFF).toUnsigned(8); // Payload Length LSB
    msgData[9] = ((payloadDataLen >> 8) & 0xFF).toUnsigned(8); // Payload Length MSB

    // Copy actual payload data (leave pad 0 unchanged)
    if (payloadDataLen > 0 && packetData != null) {
      msgData.setRange(10, 10 + packetData.length, packetData);
    }

    // Calculate Checksum
    int cs = Util.u16ComputeCRC(msgData, 0, msgLen - 2);

    if (!isPMG) {
      msgData[msgLen - 2] = (cs & 0xFF).toUnsigned(8);
      msgData[msgLen - 1] = ((cs >> 8) & 0xFF).toUnsigned(8);
    } else {
      msgData[msgLen - 1] = (cs & 0xFF).toUnsigned(8);
      msgData[msgLen - 2] = ((cs >> 8) & 0xFF).toUnsigned(8);
    }

    return msgData;
  }
}

class Util {
  // Implement this function according to your CRC16-CCITT implementation
  static int u16ComputeCRC(Uint8List data, int start, int length) {
    int crc = 0xFFFF; // Initial CRC value
    for (int i = start; i < start + length; i++) {
      crc ^= (data[i] & 0xFF);
      for (int j = 0; j < 8; j++) {
        if ((crc & 0x01) != 0) {
          crc = (crc >> 1) ^ 0x8408;
        } else {
          crc >>= 1;
        }
      }
    }
    return crc ^ 0xFFFF; // Final XOR value
  }
}
