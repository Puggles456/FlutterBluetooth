import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'display_received_data_model.dart';
export 'display_received_data_model.dart';
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
  late StreamSubscription<String> _dataSubscription;
  final StreamController<String> _dataStreamController = StreamController<String>.broadcast();

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
        setState(() {
          _model.data = data;
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
              _model.data,
              '-',
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
