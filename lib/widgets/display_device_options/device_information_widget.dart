import '/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class DeviceInformationWidget extends StatefulWidget {
  bool isExpanded;
  double padding;

  DeviceInformationWidget({required this.isExpanded, required this.padding});

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
          color: Color.fromARGB(255, 49, 50, 50), // Background color
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
                            child: Text(
                              'Radar Processor',
                              style: FlutterFlowTheme.of(context)
                                  .bodyLarge
                                  .override(
                                    fontFamily: 'Montserrat',
                                    color: choice == 1
                                        ? FlutterFlowTheme.of(context).primaryText
                                        : Colors.grey,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                          ),
                          Visibility(
                              visible: choice == 1,
                              child: Container(
                                height: 1.0,
                                color: Colors.yellow,
                                width: 143.0,
                              ),
                            )
                        ],
                      ),
                      Column(
                        children: [
                          GestureDetector(
                            onTap: () => onTap(2),
                            child: Text(
                              '4G',
                              style: FlutterFlowTheme.of(context)
                                  .bodyLarge
                                  .override(
                                    fontFamily: 'Montserrat',
                                    color: choice == 2
                                        ? FlutterFlowTheme.of(context).primaryText
                                        : Colors.grey,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                          ),
                          Visibility(
                              visible: choice == 2,
                              child: Container(
                                height: 1.0,
                                color: Colors.yellow,
                                width: 23.0,
                              ),
                            )
                        ],
                      ),
                    ],
                  ),
                  Container(padding: EdgeInsets.only(top: 10.0)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Serial Number:',
                        style: FlutterFlowTheme.of(context).bodyLarge.override(
                              fontFamily: 'Montserrat',
                              color: FlutterFlowTheme.of(context).primaryText,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                      Container(padding: EdgeInsets.only(right: 71.0)),
                      Text(
                        '[PlaceHolder]',
                        style: FlutterFlowTheme.of(context).bodyLarge.override(
                              fontFamily: 'Montserrat',
                              color: FlutterFlowTheme.of(context).primaryText,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                    ],
                  ),
                  Container(padding: EdgeInsets.only(top: 4.0)),
                  Row(
                    children: [
                      Text(
                        'Hardware Version:',
                        style: FlutterFlowTheme.of(context).bodyLarge.override(
                              fontFamily: 'Montserrat',
                              color: FlutterFlowTheme.of(context).primaryText,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w600,
                            ),
                      
                      ),
                      Container(padding: EdgeInsets.only(right: 40.0)),
                      Text(
                        '[PlaceHolder]',
                        style: FlutterFlowTheme.of(context).bodyLarge.override(
                              fontFamily: 'Montserrat',
                              color: FlutterFlowTheme.of(context).primaryText,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                    ],
                  ),
                  Container(padding: EdgeInsets.only(top: 4.0)),
                  Row(
                    children: [
                      Text(
                        'Firmware Version:',
                        style: FlutterFlowTheme.of(context).bodyLarge.override(
                              fontFamily: 'Montserrat',
                              color: FlutterFlowTheme.of(context).primaryText,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                      Container(padding: EdgeInsets.only(right: 42.0)),
                      Text(
                        '[PlaceHolder]',
                        style: FlutterFlowTheme.of(context).bodyLarge.override(
                              fontFamily: 'Montserrat',
                              color: FlutterFlowTheme.of(context).primaryText,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                    ],
                  ),
                  // Add more details here
                ],
              )
            : Container(),
      ),
    );
  }
}
