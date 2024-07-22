import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'display_received_data_model.dart';
export 'display_received_data_model.dart';
import 'dart:typed_data';
import 'dart:async';

class DisplayReceivedDataWidget extends StatefulWidget {
  const DisplayReceivedDataWidget({
    super.key,
    this.device,
  });

  final BTDeviceStruct? device;
  

  @override
  State<DisplayReceivedDataWidget> createState() =>
      _DisplayReceivedDataWidgetState();
}

class _DisplayReceivedDataWidgetState extends State<DisplayReceivedDataWidget> {
  late DisplayReceivedDataModel _model;
  late StreamSubscription<Uint8List> _dataSubscription;
  final StreamController<Uint8List> _dataStreamController = StreamController<Uint8List>.broadcast();
  //final StreamController<Uint8List> _dataStreamController = StreamController<Uint8List>().broadcast();
  int totalUncompressedSize = 0;
  double _speed = 0.0;
  int _totalSize = 0;
  int _uncompressedSize = 0;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DisplayReceivedDataModel());

    if (widget.device != null) {
      // Start receiving data
      actions.receiveData(
        widget.device!,
        '6E400001-B5A3-F393-E0A9-E50E24DCCA9E', // Replace with your service UUID
        '6E400003-B5A3-F393-E0A9-E50E24DCCA9E', // Replace with your characteristic UUID
        _dataStreamController
      );

      // Listen to the data stream and update state
      _dataSubscription = _dataStreamController.stream.listen((data) {
         final hexString = dataToHexString(data);
        final uncompressedData = parseCompressedData(data);
        final uncompressedSize = uncompressedData.length;
       
       
        setState(() {
           _totalSize += uncompressedData.length;
          int temp = (_totalSize / 1024).toInt();
          _model.data = temp.toString();
        });
      });
    }
  }

  @override
  void dispose() {
    _model.maybeDispose();
    _dataSubscription.cancel();
    _dataStreamController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Received data',
          style: FlutterFlowTheme.of(context).titleMedium.override(
                fontFamily: 'Montserrat',
                color: FlutterFlowTheme.of(context).primaryText,
                letterSpacing: 0.0,
                fontWeight: FontWeight.w600,
              ),
        ),
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
          child: Text(
            valueOrDefault<String>(
              "Total data Size: ${_model.data} KB",
              'Total Data Size: ',
            ),
            style: FlutterFlowTheme.of(context).bodyLarge.override(
                  fontFamily: 'Montserrat',
                  letterSpacing: 0.0,
                  lineHeight: 1.4,
                ),
          ),
        ),
      ],
    );
  }
   
}
 String dataToHexString(Uint8List data) {
    return data.map((byte) => byte.toRadixString(16).padLeft(2, '0')).join();
  }
Uint8List hexStringToByteArray(String hexString) {
  final bytes = <int>[];
  for (int i = 0; i < hexString.length; i += 2) {
    final byte = int.parse(hexString.substring(i, i + 2), radix: 16);
    bytes.add(byte);
  }
  return Uint8List.fromList(bytes);
}
Uint8List parseCompressedData(Uint8List compressedData) {
  const entrySize = 14; // Size of the compressed entry
  final numberOfEntries = compressedData.length ~/ entrySize;
  final buffer = BytesBuilder();

  for (int i = 0; i < numberOfEntries; i++) {
    final compressedEntry = compressedData.sublist(i * entrySize, (i + 1) * entrySize);
    final reconstructedEntry = reconstructEntry(compressedEntry);
    buffer.add(reconstructedEntry);
  }

  return buffer.toBytes();
}

Uint8List reconstructEntry(Uint8List compressedEntry) {
  final buffer = BytesBuilder();

  // Fill static values
  final recordSize = ByteData(2)..setUint16(0, 0x20, Endian.little);
  buffer.add(recordSize.buffer.asUint8List()); // Record Size
  buffer.add([0x04]); // Record Type
  final recordNumber = ByteData(2)..setUint16(0, 0x00, Endian.little);
  buffer.add(recordNumber.buffer.asUint8List()); // Record Number
  buffer.add([0x02]); // Sensor ID

  // Epoch timestamp
  final epochTime = ByteData.sublistView(compressedEntry, 0, 4).getUint32(0, Endian.little) * 1000;
  final dateTime = DateTime.fromMillisecondsSinceEpoch(epochTime, isUtc: true);
  buffer.add([dateTime.year - 2000]);
  buffer.add([dateTime.month]);
  buffer.add([dateTime.day]);
  buffer.add([dateTime.hour]);
  buffer.add([dateTime.minute]);
  buffer.add([dateTime.second]);

  buffer.add([0x00]); // Empty byte
  buffer.add([compressedEntry[4]]); // Target Duration

  final directionAndClass = compressedEntry[5];
  buffer.add([directionAndClass & 0x01]); // Target Direction
  buffer.add([(directionAndClass & 0x06) >> 1]); // Track Type
  buffer.add([(directionAndClass & 0xF8) >> 3]); // Target Class

  buffer.add(ByteData.sublistView(compressedEntry, 6, 8).buffer.asUint16List(0, 1).buffer.asUint8List()); // Average Speed
  buffer.add(ByteData.sublistView(compressedEntry, 8, 10).buffer.asUint16List(0, 1).buffer.asUint8List()); // Peak Speed
  buffer.add(ByteData.sublistView(compressedEntry, 10, 12).buffer.asUint16List(0, 1).buffer.asUint8List()); // Last Speed

  buffer.add([compressedEntry[12]]); // Target Strength
  buffer.add([0x00]); // Lane
  buffer.add([compressedEntry[13]]); // Event Code
  buffer.add([0x00]); // Quality Measure
  buffer.add([0x00]); // Empty Byte

  // CRC placeholder (You may need to calculate the actual CRC)
  final byteData = ByteData(2)..setUint16(0, 0x0000, Endian.little);
  buffer.add(byteData.buffer.asUint8List());
 

  return buffer.toBytes();
}
