import 'dart:typed_data';
import 'package:flutter/material.dart';

class DataByteManager extends ChangeNotifier {

  Uint8List _data = Uint8List(0); 
  Uint8List get data => _data;

  void setData(Uint8List data) {
    _data = data;
    notifyListeners();
  }
}
