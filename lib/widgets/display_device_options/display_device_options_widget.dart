import '/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'display_device_options_model.dart';
export 'display_device_options_model.dart';
import 'data_collection_status_widget.dart';
import 'device_status_widget.dart';
import 'real_time_traffic_widget.dart';
import 'battery_status_widget.dart';
import 'survey_schedule_widget.dart';
import 'device_information_widget.dart';

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
    // TODO: implement build

    return 
    Expanded(
      child:ListView(
        children: [
          Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: GestureDetector(
                onTap: () => _toggleExpanded(),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(right: 8.0),
                          child: Icon(
                            Icons.bar_chart,
                            color: Colors.white,
                            size: 24.0,
                          ),
                        ),
                        Text(
                          'Data Collection Status',
                          style: FlutterFlowTheme.of(context)
                              .bodyLarge
                              .override(
                                fontFamily: 'Montserrat',
                                color: FlutterFlowTheme.of(context).primaryText,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w600,
                              ),
                        ),
                      ],
                    ),
                    const Icon(
                      Icons.arrow_drop_down,
                      color: Colors.white,
                      size: 24.0,
                    ),
                  ],
                ),
              )),
          DataCollectionStatusWidget(
              isExpanded: _isExpanded, padding: paddingValue),

          Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: GestureDetector(
                onTap: () => _toggleExpanded2(),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(right: 8.0),
                          child: Icon(
                            Icons.tv,
                            color: Colors.white,
                            size: 24.0,
                          ),
                        ),
                        Text(
                          'Real Time Traffic',
                          style: FlutterFlowTheme.of(context)
                              .bodyLarge
                              .override(
                                fontFamily: 'Montserrat',
                                color: FlutterFlowTheme.of(context).primaryText,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w600,
                              ),
                        ),
                      ],
                    ),
                    const Icon(
                      Icons.arrow_drop_down,
                      color: Colors.white,
                      size: 24.0,
                    ),
                  ],
                ),
              )),
          realTimeTrafficWidget(
              isExpanded: _isExpanded2, padding: paddingValue2),
          Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: GestureDetector(
                onTap: () => _toggleExpanded3(),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(right: 8.0),
                          child: Icon(
                            Icons.tv,
                            color: Colors.white,
                            size: 24.0,
                          ),
                        ),
                        Text(
                          'Device Status',
                          style: FlutterFlowTheme.of(context)
                              .bodyLarge
                              .override(
                                fontFamily: 'Montserrat',
                                color: FlutterFlowTheme.of(context).primaryText,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w600,
                              ),
                        ),
                      ],
                    ),
                    const Icon(
                      Icons.arrow_drop_down,
                      color: Colors.white,
                      size: 24.0,
                    ),
                  ],
                ),
              )),

          deviceStatusWidget(isExpanded: _isExpanded3, padding: paddingValue3),
          Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: GestureDetector(
                onTap: () => _toggleExpanded4(),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(right: 8.0),
                          child: Icon(
                            Icons.battery_1_bar,
                            color: Colors.white,
                            size: 24.0,
                          ),
                        ),
                        Text(
                          'Battery Status',
                          style: FlutterFlowTheme.of(context)
                              .bodyLarge
                              .override(
                                fontFamily: 'Montserrat',
                                color: FlutterFlowTheme.of(context).primaryText,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w600,
                              ),
                        ),
                      ],
                    ),
                    const Icon(
                      Icons.arrow_drop_down,
                      color: Colors.white,
                      size: 24.0,
                    ),
                  ],
                ),
              )),
          BatteryStatusWidget(isExpanded: _isExpanded4, padding: paddingValue4),
          Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: GestureDetector(
                onTap: () => _toggleExpanded5(),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(right: 8.0),
                          child: Icon(
                            Icons.shuffle,
                            color: Colors.white,
                            size: 24.0,
                          ),
                        ),
                        Text(
                          'Survey Schedule',
                          style: FlutterFlowTheme.of(context)
                              .bodyLarge
                              .override(
                                fontFamily: 'Montserrat',
                                color: FlutterFlowTheme.of(context).primaryText,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w600,
                              ),
                        ),
                      ],
                    ),
                    const Icon(
                      Icons.arrow_drop_down,
                      color: Colors.white,
                      size: 24.0,
                    ),
                  ],
                ),
              )),
          SurveyScheduleWidget(isExpanded: _isExpanded5, padding: paddingValue5),
          Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: GestureDetector(
                onTap: () => _toggleExpanded6(),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(right: 8.0),
                          child: Icon(
                            Icons.settings,
                            color: Colors.white,
                            size: 24.0,
                          ),
                        ),
                        Text(
                          'Device Configuration',
                          style: FlutterFlowTheme.of(context)
                              .bodyLarge
                              .override(
                                fontFamily: 'Montserrat',
                                color: FlutterFlowTheme.of(context).primaryText,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w600,
                              ),
                        ),
                      ],
                    ),
                    const Icon(
                      Icons.arrow_drop_down,
                      color: Colors.white,
                      size: 24.0,
                    ),
                  ],
                ),
              )),
          Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: GestureDetector(
                onTap: () => _toggleExpanded7(),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(right: 8.0),
                          child: Icon(
                            Icons.book,
                            color: Colors.white,
                            size: 24.0,
                          ),
                        ),
                        Text(
                          'Device Information',
                          style: FlutterFlowTheme.of(context)
                              .bodyLarge
                              .override(
                                fontFamily: 'Montserrat',
                                color: FlutterFlowTheme.of(context).primaryText,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w600,
                              ),
                        ),
                      ],
                    ),
                    const Icon(
                      Icons.arrow_drop_down,
                      color: Colors.white,
                      size: 24.0,
                    ),
                  ],
                ),
              )),
          DeviceInformationWidget(isExpanded: _isExpanded7, padding: paddingValue7),
          GestureDetector(
            onTap: () => _toggleExpanded8(),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(right: 8.0),
                      child: Icon(
                        Icons.info,
                        color: Colors.white,
                        size: 24.0,
                      ),
                    ),
                    Text(
                      'About',
                      style: FlutterFlowTheme.of(context).bodyLarge.override(
                            fontFamily: 'Montserrat',
                            color: FlutterFlowTheme.of(context).primaryText,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ],
                ),
                const Icon(
                  Icons.arrow_drop_down,
                  color: Colors.white,
                  size: 24.0,
                ),
              ],
            ),
          )
          // Add more Row widgets here if needed
        ],
      )
    );
  }
}
