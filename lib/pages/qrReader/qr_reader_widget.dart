import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:test/backend/schema/structs/index.dart';
import 'package:test/flutter_flow/flutter_flow_icon_button.dart';
import 'package:test/flutter_flow/flutter_flow_theme.dart';
import 'package:test/flutter_flow/flutter_flow_util.dart';

class QRViewExample extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _QRViewExampleState();
}

class _QRViewExampleState extends State<QRViewExample> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  String? qrText;

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('QR Code Scanner'),
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          iconTheme:
              IconThemeData(color: FlutterFlowTheme.of(context).primaryText),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
             context.safePop();
            
            },
          )),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 5,
            child: QRView(
              key: qrKey,
              onQRViewCreated: _onQRViewCreated,
              overlay: QrScannerOverlayShape(
                borderColor: Colors.red,
                borderRadius: 10,
                borderLength: 30,
                borderWidth: 10,
                cutOutSize: 300,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              color: FlutterFlowTheme.of(context).primaryBackground,
              child: Center(
                child: (qrText != null)
                    ? Text(
                        'Scan result: $qrText',
                        style: FlutterFlowTheme.of(context).bodyLarge.override(
                              fontFamily: 'Montserrat',
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w500,
                            ),
                      )
                    : Text(
                        'Scan a code',
                        style: FlutterFlowTheme.of(context).bodyLarge.override(
                              fontFamily: 'Montserrat',
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
              ),
            ),
          )
        ],
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
       
        qrText = scanData.code;
        BTDeviceStruct device = BTDeviceStruct();

        try {
          final Map<String, dynamic> data = json.decode(qrText!);
          device.name = data['deviceName'];
          device.id = data['deviceId'];
        } catch (e) {
          print('Error decoding QR code data: $e');
        }
      });
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
