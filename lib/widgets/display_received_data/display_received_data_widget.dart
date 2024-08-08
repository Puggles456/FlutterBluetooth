import 'package:provider/provider.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/actions/TDC_receive_data.dart' as TDC;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'display_received_data_model.dart';
export 'display_received_data_model.dart';
import 'dart:typed_data';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../Data_Byte_Manager.dart';


class DisplayReceivedDataWidget extends StatefulWidget {
  
  DisplayReceivedDataWidget({
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
  final StreamController<Uint8List> _dataStreamController =
      StreamController<Uint8List>.broadcast();

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
    print("INITIALIZING");
    requestPermissions();
   

    //adruino boot loader
    //service uuid: 6E400001-B5A3-F393-E0A9-E50E24DCCA9E
    //characteristic uuid: 6E400003-B5A3-F393-E0A9-E50E24DCCA9E

    //tdc
    //service uuid: 6e400001-b5a3-f393-e0a9-e50e24dcca9e
    //write uuid: 6e400002-b5a3-f393-e0a9-e50e24dcca9e
    //notify uuid: 6e400003-b5a3-f393-e0a9-e50e24dcca9e

    if (widget.device != null) {
      // Start receiving data
      /*
      actions.receiveData(
          widget.device!,
          '6E400001-B5A3-F393-E0A9-E50E24DCCA9E', // Replace with your service UUID
          '6E400003-B5A3-F393-E0A9-E50E24DCCA9E', // Replace with your characteristic UUID
          _dataStreamController);
        */

      TDC.TDC_receive_data(
        widget.device!,
        "6e400001-b5a3-f393-e0a9-e50e24dcca9e",
        "6e400002-b5a3-f393-e0a9-e50e24dcca9e",
        "6e400003-b5a3-f393-e0a9-e50e24dcca9e",
        _dataStreamController,
        (data) {
          // Handle received data here
          print("Received data callback: $data");
        },
      );
      // Listen to the data stream and update state
      _dataSubscription = _dataStreamController.stream.listen((data) {
        print("Received data: $data");
        Provider.of<DataByteManager>(context, listen: false).setData(data);
        
        // final hexString = dataToHexString(data);
        //writeBytesToFile(data);
        //final uncompressedData = parseCompressedData(data);
        // final uncompressedSize = uncompressedData.length;

        /*
        setState(() {
           _totalSize += uncompressedSize;
           //_totalSize += data.length;
          int temp = (_totalSize / 1024).toInt();
          _model.data = temp.toString();
        });
        */
      });
    }
  }

  @override
  void dispose() {
    print("LEAVINGGGGG");
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

Uint8List parseCompressedData(Uint8List compressedData) {
  const entrySize = 14; // Size of the compressed entry
  final numberOfEntries = compressedData.length ~/ entrySize;
  final buffer = BytesBuilder();

  for (int i = 0; i < numberOfEntries; i++) {
    final compressedEntry =
        compressedData.sublist(i * entrySize, (i + 1) * entrySize);
    final reconstructedEntry = reconstructEntry(compressedEntry);
    buffer.add(reconstructedEntry);
  }

  return buffer.toBytes();
}

Uint8List reconstructEntry(Uint8List compressedEntry) {
  final buffer = BytesBuilder();

  //print("BUILDING OUR COMPRESSION ENTRY");

  // Fill static values
  buffer.add(Uint8List.fromList([
    0x20, 0x00, // Record Size
    0x04, // Record Type
    0x00, 0x00, // Record Number
    0x02 // Sensor ID
  ]));

  //print("SIZE AFTER ADDING STATIC VALUES 1 ${buffer.length}");

  // Epoch timestamp
  final epochTime =
      ByteData.sublistView(compressedEntry, 0, 4).getUint32(0, Endian.little);
  final dateTime =
      DateTime.fromMillisecondsSinceEpoch(epochTime * 1000, isUtc: true);
  buffer.add([
    dateTime.year - 2000,
    dateTime.month,
    dateTime.day,
    dateTime.hour,
    dateTime.minute,
    dateTime.second
  ]);

  //print("SIZE AFTER ADDING STATIC VALUES 2 ${buffer.length}");

  buffer.add([0x00]); // Empty byte
  buffer.add([compressedEntry[4]]); // Target Duration

  // print("SIZE AFTER ADDING STATIC VALUES 3 ${buffer.length}");

  final directionAndClass = compressedEntry[5];
  buffer.add([directionAndClass & 0x01]); // Target Direction
  buffer.add([(directionAndClass >> 1) & 0x03]); // Track Type
  buffer.add([(directionAndClass >> 3) & 0x1F]); // Target Class

  // print("SIZE AFTER ADDING STATIC VALUES 4 ${buffer.length}");

  buffer.add(Uint8List.fromList([0x00, 0x00])); //Contact ID

  // Speed fields
  ByteData byteData = ByteData.sublistView(compressedEntry, 6, 8);
  ByteData byteData2 = ByteData.sublistView(compressedEntry, 8, 10);
  ByteData byteData3 = ByteData.sublistView(compressedEntry, 10, 12);
  int averageSpeed = byteData.getInt16(0, Endian.little);
  int peakSpeed = byteData2.getInt16(0, Endian.little);
  int lastSpeed = byteData3.getInt16(0, Endian.little);

  buffer.add(Uint8List.fromList(
      [averageSpeed & 0xFF, (averageSpeed >> 8) & 0xFF])); // Average Speed

  buffer.add(Uint8List.fromList(
      [peakSpeed & 0xFF, (peakSpeed >> 8) & 0xFF])); // Peak Speed

  buffer.add(Uint8List.fromList(
      [lastSpeed & 0xFF, (lastSpeed >> 8) & 0xFF])); // Last Speed

  //print("SIZE AFTER ADDING STATIC VALUES 5 ${buffer.length}");

  buffer.add([compressedEntry[12]]); // Target Strength
  buffer.add([0x00]); // Lane
  buffer.add([compressedEntry[13]]); // Event Code
  buffer.add([0x00]); // Quality Measure
  buffer.add([0x00]); // Empty Byte

  //print("SIZE AFTER ADDING STATIC VALUES 6 ${buffer.length}");

  // CRC placeholder
  buffer.add(Uint8List.fromList([0x00, 0x00]));

  //print("RECONSTRUCTED SIZE ${buffer.length}");

  return buffer.toBytes();
}

Future<void> requestPermissions() async {
  if (await Permission.storage.request().isGranted) {
    // Permission granted
    print("PERMISSION GRANTED");
  } else {
    // Handle the case when permission is denied
    print('Permission denied');
  }
}

Future<void> writeBytesToFile(Uint8List bytes) async {
  try {
    final directory = await getExternalStorageDirectory();
    print("PATH HERE");
    print(directory!.path);
    final filePath = '${directory.path}/output_file.dat';
    final coolorPath = 'storage/emulated/0/Download/output_file.dat';
    final file = File(coolorPath);
    await file.writeAsBytes(bytes, mode: FileMode.writeOnlyAppend);
    print('File written to $coolorPath');
  } catch (e) {
    print('Error writing to file: $e');
  }
}
