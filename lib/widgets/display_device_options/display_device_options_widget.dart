import 'dart:typed_data';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'display_device_options_model.dart';
export 'display_device_options_model.dart';
import 'data_collection_status/data_collection_status_widget.dart';
import 'device_status/device_status_widget.dart';
import 'real_time_traffic/real_time_traffic_widget.dart';
import 'battery_status/battery_status_widget.dart';
import 'survey_schedule/survey_schedule_widget.dart';
import 'device_information/device_information_widget.dart';
import 'display_device_options_row_widget.dart';
import 'device_configuration/device_configuration_widget.dart';
import 'about/about_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '../../Data_Byte_Manager.dart';

class DisplayDeviceOptionsWidget extends StatefulWidget {
  @override
  State<DisplayDeviceOptionsWidget> createState() =>
      _DisplayDeviceOptionsWidgetState();
}

class _DisplayDeviceOptionsWidgetState
    extends State<DisplayDeviceOptionsWidget> {
  late displayDeviceOptionsModal _model;
  bool _isExpanded = false;
  bool _isExpanded2 = false;
  bool _isExpanded3 = false;
  bool _isExpanded4 = false;
  bool _isExpanded5 = false;
  bool _isExpanded6 = false;
  bool _isExpanded7 = false;
  bool _isExpanded8 = false;
  bool _isExpanded9 = false;
  double paddingValue = 0.0;
  double paddingValue2 = 0.0;
  double paddingValue3 = 0.0;
  double paddingValue4 = 0.0;
  double paddingValue5 = 0.0;
  double paddingValue6 = 0.0;
  double paddingValue7 = 0.0;
  double paddingValue8 = 0.0;
  double paddingValue9 = 0.0;

  @override
  void initState() {
    super.initState();
    _model = displayDeviceOptionsModal();
   
  }

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
    
    
  }

  void _toggleExpanded() {
    setState(() {
      _isExpanded = !_isExpanded;
      paddingValue = _isExpanded ? 8.0 : 0.0;
    });
  }

  void _toggleExpanded2() {
    setState(() {
      _isExpanded2 = !_isExpanded2;
      paddingValue2 = _isExpanded2 ? 8.0 : 0.0;
    });
  }

  void _toggleExpanded3() {
    setState(() {
      _isExpanded3 = !_isExpanded3;
      paddingValue3 = _isExpanded3 ? 8.0 : 0.0;
    });
  }

  void _toggleExpanded4() {
    setState(() {
      _isExpanded4 = !_isExpanded4;
      paddingValue4 = _isExpanded4 ? 8.0 : 0.0;
    });
  }

  void _toggleExpanded5() {
    setState(() {
      _isExpanded5 = !_isExpanded5;
      paddingValue5 = _isExpanded5 ? 8.0 : 0.0;
    });
  }

  void _toggleExpanded6() {
    setState(() {
      _isExpanded6 = !_isExpanded6;
      paddingValue6 = _isExpanded6 ? 8.0 : 0.0;
    });
  }

  void _toggleExpanded7() {
    setState(() {
      _isExpanded7 = !_isExpanded7;
      paddingValue7 = _isExpanded7 ? 8.0 : 0.0;
    });
  }

  void _toggleExpanded8() {
    setState(() {
      _isExpanded8 = !_isExpanded8;
      paddingValue8 = _isExpanded8 ? 8.0 : 0.0;
    });
  }

  void _toggleExpanded9() {
    setState(() {
      _isExpanded9 = !_isExpanded9;
      paddingValue9 = _isExpanded9 ? 8.0 : 0.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(child:
        Consumer<DataByteManager>(builder: (context, dataByteManager, _) {
      return ListView(
        children: [
          DisplayDeviceOptionsRowWidget(
              title: "Data Collection Status",
              onTap: _toggleExpanded,
              imagePath: "assets/images/i_collection.png",
              expanded: _isExpanded),
          DataCollectionStatusWidget(
            isExpanded: _isExpanded,
            padding: paddingValue,
            surveyStatus: "[Placeholder]",  
            vehicleCount: 0,
            surveyStart: "[Placeholder]",
            memory: "[Placeholder]",
          ),
          Visibility(
            visible: _isExpanded,
            child: Container(padding: const EdgeInsets.only(bottom: 16.0)),
          ),
          DisplayDeviceOptionsRowWidget(
              title: "Real Time Traffic",
              onTap: _toggleExpanded2,
              imagePath: "assets/images/i_operation.png",
              expanded: _isExpanded2),

          realTimeTrafficWidget(
              isExpanded: _isExpanded2,
              padding: paddingValue2,
              peakSpeed: 0,
              direction: "[Placeholder]",
              distanceTracked: "[Placeholder]"),
          Visibility(
            visible: _isExpanded2,
            child: Container(padding: const EdgeInsets.only(bottom: 16.0)),
          ),

          DisplayDeviceOptionsRowWidget(
            title: "Device Status",
            onTap: _toggleExpanded3,
            imagePath: "assets/images/i_status.png",
            expanded: _isExpanded3,
          ),

          deviceStatusWidget(
            isExpanded: _isExpanded3,
            padding: paddingValue3,
            date: DateTime.now(),
            location: "[Placeholder]",
            latitude: "[Placeholder]",
            longitude: "[Placeholder]",
            facingDirection: "[Placeholder]",
          ),

          Visibility(
            visible: _isExpanded3,
            child: Container(padding: const EdgeInsets.only(bottom: 16.0)),
          ),
          DisplayDeviceOptionsRowWidget(
              title: "Battery Status",
              onTap: _toggleExpanded4,
              imagePath: "assets/images/battery.png",
              expanded: _isExpanded4),
          BatteryStatusWidget(
            isExpanded: _isExpanded4,
            padding: paddingValue4,
            days: 0.0,
          ),
          Visibility(
            visible: _isExpanded4,
            child: Container(padding: const EdgeInsets.only(bottom: 16.0)),
          ),
          DisplayDeviceOptionsRowWidget(
            title: "Device Configuration",
            onTap: _toggleExpanded6,
            imagePath: "assets/images/i_setting.png",
            expanded: _isExpanded6,
          ),
          DeviceConfigurationWidget(
            isExpanded: _isExpanded6,
            padding: paddingValue6,
          ),
          Visibility(
            visible: _isExpanded6,
            child: Container(padding: const EdgeInsets.only(bottom: 16.0)),
          ),
          DisplayDeviceOptionsRowWidget(
            title: "Survey Schedule",
            onTap: _toggleExpanded5,
            imagePath: "assets/images/i_configuration.png",
            expanded: _isExpanded5,
          ),
          SurveyScheduleWidget(
            isExpanded: _isExpanded5,
            padding: paddingValue5,
            startTime1: "[00:00]",
            startTime2: "[00:00]",
            startTime3: "[00:00]",
            startTime4: "[00:00]",
            stopTime1: "[00:00]",
            stopTime2: "[00:00]",
            stopTime3: "[00:00]",
            stopTime4: "[00:00]",
          ),
          Visibility(
            visible: _isExpanded5,
            child: Container(padding: const EdgeInsets.only(bottom: 16.0)),
          ),
          DisplayDeviceOptionsRowWidget(
              title: "Device Information",
              onTap: _toggleExpanded7,
              imagePath: "assets/images/i_information.png",
              expanded: _isExpanded7),
          DeviceInformationWidget(
              isExpanded: _isExpanded7,
              padding: paddingValue7,
              serialNumber: "[Placeholder]",
              firmwareVersion: "[Placeholder]",
              hardwareVersion: "[Placeholder]"),
          Visibility(
            visible: _isExpanded7,
            child: Container(padding: const EdgeInsets.only(bottom: 16.0)),
          ),
          DisplayDeviceOptionsRowWidget(
              title: "Diagnostic",
              onTap: () => _showModal(context),
              imagePath: "assets/images/i_test.png",
              expanded: _isExpanded9),

          DisplayDeviceOptionsRowWidget(
              title: "About",
              onTap: _toggleExpanded8,
              imagePath: "assets/images/i_about.png",
              expanded: _isExpanded8),
          AboutWidget(
            isExpanded: _isExpanded8,
            padding: paddingValue8,
            SD: "TDC 2",
            version: "1.0",
          )
          // Add more Row widgets here if needed
        ],
      );
    }));
  }

  void _showModal(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            "Password authentication\nis required to use this\nfeature.",
            style: FlutterFlowTheme.of(context).bodyLarge.override(
                fontFamily: 'Montserrat',
                color: FlutterFlowTheme.of(context).primaryText,
                fontWeight: FontWeight.w600,
                fontSize: 20.0),
          ),
          content: TextFormField(
            autofocus: false,
            obscureText: false,
            decoration: InputDecoration(
              hintText: 'Please enter password',
              hintStyle: FlutterFlowTheme.of(context).labelLarge.override(
                    fontFamily: 'Montserrat',
                    letterSpacing: 0.0,
                  ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                    width: 1.0, color: Color.fromARGB(133, 255, 255, 255)),
                borderRadius: BorderRadius.circular(10.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                    width: 1.0, color: Color.fromARGB(133, 255, 255, 255)),
                borderRadius: BorderRadius.circular(10.0),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: FlutterFlowTheme.of(context).error,
                  width: 2.0,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: FlutterFlowTheme.of(context).error,
                  width: 2.0,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              filled: true,
              fillColor: const Color.fromARGB(255, 49, 50, 50),
            ),
            style: FlutterFlowTheme.of(context).bodyLarge.override(
                  fontFamily: 'Montserrat',
                  letterSpacing: 0.0,
                ),
            cursorColor: FlutterFlowTheme.of(context).primaryText,
          ),
          backgroundColor: const Color.fromARGB(255, 49, 50, 50),
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    side: const BorderSide(
                        width: 1.0, color: Color.fromARGB(133, 255, 255, 255)),
                    backgroundColor:
                        Color.fromARGB(170, 46, 48, 48), // Text color
                  ),
                  child: Text("Cancel"),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor:
                        FlutterFlowTheme.of(context).accent1, // Text color
                  ),
                  child: Text("Confirm"),
                )
              ],
            ),
          ],
        );
      },
    );
  }
}
