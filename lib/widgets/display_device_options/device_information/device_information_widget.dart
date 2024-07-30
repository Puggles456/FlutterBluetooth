import '/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import '../display_device_options_text.dart';

class DeviceInformationWidget extends StatefulWidget {
  bool isExpanded;
  double padding;
  String serialNumber;
  String hardwareVersion;
  String firmwareVersion;

  DeviceInformationWidget(
      {required this.isExpanded,
      required this.padding,
      required this.serialNumber,
      required this.hardwareVersion,
      required this.firmwareVersion});

  @override
  _DeviceInformationWidgetState createState() =>
      _DeviceInformationWidgetState();
}

class _DeviceInformationWidgetState extends State<DeviceInformationWidget> {
  int choice = 0;

  void onTap(int index) {
    setState(() {
      choice = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
      duration: const Duration(milliseconds: 300),
      curve: Curves.fastOutSlowIn,
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 49, 50, 50), // Background color
          borderRadius: BorderRadius.circular(12.0), // Border radius
        ),
        padding: EdgeInsets.all(widget.padding),
        child: widget.isExpanded
            ? Column(
                children: [
                  //SizedBox(height: 16.0), // Add vertical spacing

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Column(
                        children: [
                          GestureDetector(
                            onTap: () => onTap(0),
                            child: SizedBox(
                              width: 45.0,
                              child: Text(
                                'Main',
                                style: FlutterFlowTheme.of(context)
                                    .bodyLarge
                                    .override(
                                      fontFamily: 'Montserrat',
                                      color: choice == 0
                                          ? FlutterFlowTheme.of(context)
                                              .primaryText
                                          : Colors.grey,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ),
                          ),
                          Visibility(
                            visible: choice == 0,
                            child: Container(
                              height: 1.0,
                              color: Colors.yellow,
                              width: 45.0,
                            ),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          GestureDetector(
                            onTap: () => onTap(1),
                            child: SizedBox(
                              width: 145.0,
                              child: Text(
                                'Radar Processor',
                                style: FlutterFlowTheme.of(context)
                                    .bodyLarge
                                    .override(
                                      fontFamily: 'Montserrat',
                                      color: choice == 1
                                          ? FlutterFlowTheme.of(context)
                                              .primaryText
                                          : Colors.grey,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ),
                          ),
                          Visibility(
                            visible: choice == 1,
                            child: Container(
                              height: 1.0,
                              color: Colors.yellow,
                              width: 145.0,
                            ),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          GestureDetector(
                            onTap: () => onTap(2),
                            child: SizedBox(
                              width: 26,
                              child: Text(
                                '4G',
                                style: FlutterFlowTheme.of(context)
                                    .bodyLarge
                                    .override(
                                      fontFamily: 'Montserrat',
                                      color: choice == 2
                                          ? FlutterFlowTheme.of(context)
                                              .primaryText
                                          : Colors.grey,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ),
                          ),
                          Visibility(
                            visible: choice == 2,
                            child: Container(
                              height: 1.0,
                              color: Colors.yellow,
                              width: 26.0,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  Visibility(
                    visible: choice == 0,
                    child: Column(
                      children: [
                        Container(padding: const EdgeInsets.only(top: 10.0)),
                        DisplayDeviceOptionsText(
                            text1: "Serial Number:",
                            text2: widget.serialNumber,
                            width: 205),
                        Container(padding: const EdgeInsets.only(top: 4.0)),
                        DisplayDeviceOptionsText(
                            text1: "Hardware Version:",
                            text2: widget.hardwareVersion,
                            width: 205),
                        Container(padding: const EdgeInsets.only(top: 4.0)),
                        DisplayDeviceOptionsText(
                            text1: "Firmware Version:",
                            text2: widget.firmwareVersion,
                            width: 205),
                      ],
                    ),
                  )
                  // Add more details here
                ],
              )
            : Container(),
      ),
    );
  }
}
