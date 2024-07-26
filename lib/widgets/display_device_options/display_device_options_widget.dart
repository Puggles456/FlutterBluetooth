import 'package:flutter/material.dart';
import 'display_device_options_model.dart';
export 'display_device_options_model.dart';
import 'data_collection_status/data_collection_status_widget.dart';
import 'device_status/device_status_widget.dart';
import 'real_time_traffic/real_time_traffic_widget.dart';
import 'battery_status/battery_status_widget.dart';
import 'survey_schedule/survey_schedule_widget.dart';
import 'device_information/device_information_widget.dart';
import 'display_device_options_row_widget.dart';

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
  double paddingValue = 0.0;
  double paddingValue2 = 0.0;
  double paddingValue3 = 0.0;
  double paddingValue4 = 0.0;
  double paddingValue5 = 0.0;
  double paddingValue6 = 0.0;
  double paddingValue7 = 0.0;
  double paddingValue8 = 0.0;

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

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView(
      children: [
        DisplayDeviceOptionsRowWidget(
            title: "Data Collection Status",
            onTap: _toggleExpanded,
            icon: Icons.bar_chart),
        DataCollectionStatusWidget(
          isExpanded: _isExpanded,
          padding: paddingValue,
          surveyStatus: "[Placeholder]",
          vehicleCount: 0,
          surveyStart: "[Placeholder]",
          memory: "[Placeholder]",
        ),

        DisplayDeviceOptionsRowWidget(
            title: "Real Time Traffic",
            onTap: _toggleExpanded2,
            icon: Icons.tv),

        realTimeTrafficWidget(
            isExpanded: _isExpanded2,
            padding: paddingValue2,
            peakSpeed: 0,
            direction: "[Placeholder]",
            distanceTracked: "[Placeholder]"),

        DisplayDeviceOptionsRowWidget(
            title: "Device Status", onTap: _toggleExpanded3, icon: Icons.tv),

        deviceStatusWidget(
          isExpanded: _isExpanded3,
          padding: paddingValue3,
          date: "[Date Placeholder]",
          location: "[Placeholder]",
          latitude: "[Placeholder]",
          longitude: "[Placeholder]",
          facingDirection: "[Placeholder]",
        ),
        DisplayDeviceOptionsRowWidget(
            title: "Battery Status",
            onTap: _toggleExpanded4,
            icon: Icons.battery_1_bar),
        BatteryStatusWidget(
          isExpanded: _isExpanded4,
          padding: paddingValue4,
          days: 0.0,
        ),
        DisplayDeviceOptionsRowWidget(
            title: "Survey Schedule",
            onTap: _toggleExpanded5,
            icon: Icons.schedule),
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
        DisplayDeviceOptionsRowWidget(
            title: "Device Configuration",
            onTap: _toggleExpanded6,
            icon: Icons.settings),
        DisplayDeviceOptionsRowWidget(
            title: "Device Information",
            onTap: _toggleExpanded7,
            icon: Icons.book),
        DeviceInformationWidget(
            isExpanded: _isExpanded7,
            padding: paddingValue7,
            serialNumber: "[Placeholder]",
            firmwareVersion: "[Placeholder]",
            hardwareVersion: "[Placeholder]"),
        DisplayDeviceOptionsRowWidget(
            title: "About", onTap: _toggleExpanded8, icon: Icons.info),
        // Add more Row widgets here if needed
      ],
    ));
  }
}
