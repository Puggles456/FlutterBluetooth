import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'dart:typed_data';

import 'dart:convert';


class TDCReceiveMessage {
  static final TDCReceiveMessage _instance = TDCReceiveMessage._internal();

  factory TDCReceiveMessage() {
    return _instance;
  }

  TDCReceiveMessage._internal();

  static TDCReceiveMessage getInstance() {
    return _instance;
  }

  void loadData(Uint8List data) {
    // Implement your data processing here
    print("Processing data: $data");
  }
}

