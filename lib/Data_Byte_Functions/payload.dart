import 'dart:typed_data';

int PAYLOAD_START_BYTE_IDX = 10;
int PAYLOAD_LENGTH_IDX = 8;

Uint8List? getPayloadDataArray(
    Uint8List bytes, int payloadByteIdx, int len, Uint8List _data) {
  if (len == 0) {
    len = getPayloadLength(_data) - payloadByteIdx;
  }

  // First make sure the index and len are valid
  if (payloadByteIdx + len > getPayloadLength(_data)) {
    return null;
  }

  Uint8List payload = Uint8List(len);

  // Copy the bytes
  for (int i = 0; i < len; i++) {
    payload[i] = bytes[PAYLOAD_START_BYTE_IDX + payloadByteIdx + i];
  }

  return payload;
}

int getPayloadLength(Uint8List _data) {
  int payloadLength =
      _data[PAYLOAD_LENGTH_IDX] + (_data[PAYLOAD_LENGTH_IDX + 1] << 8);
  return payloadLength;
}
