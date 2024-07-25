import '/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'display_device_options_model.dart';
export 'display_device_options_model.dart';
import 'data_collection_status_widget.dart';
import 'device_status_widget.dart';
import 'real_time_traffic_widget.dart';

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
  double paddingValue = 0.0;
  double paddingValue2 = 0.0;
  double paddingValue3 = 0.0;

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


  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 1.0, 0.0, 0.0),
      child: Column(
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
          DataCollectionStatusWidget(isExpanded: _isExpanded, padding: paddingValue),

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
          realTimeTrafficWidget(isExpanded: _isExpanded2, padding: paddingValue2),
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
          Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: GestureDetector(
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
          Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: GestureDetector(
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
          GestureDetector(
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
      ),
    );
  }
}
