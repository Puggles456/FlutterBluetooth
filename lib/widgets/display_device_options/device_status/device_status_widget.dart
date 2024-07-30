import '/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';

class deviceStatusWidget extends StatefulWidget {
  bool isExpanded;
  double padding;
  String date;
  String location;
  String latitude;
  String longitude;
  String facingDirection;

  deviceStatusWidget({required this.isExpanded, required this.padding, required this.date, required this.location, required this.latitude, required this.longitude, required this.facingDirection});

  @override
  _deviceStatusWidgetState createState() => _deviceStatusWidgetState();
}

class _deviceStatusWidgetState extends State<deviceStatusWidget> {
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
                      Text(
                        widget.date,
                        style: FlutterFlowTheme.of(context).bodyLarge.override(
                              fontFamily: 'Montserrat',
                              color: FlutterFlowTheme.of(context).primaryText,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                      Image.asset(
                      "assets/images/i_battery.png", // Load the image from assets
                      color: Colors.white,
                      width: 24.0,
                      height: 24.0,
                      )
                    ],
                  ),
                  Container(padding: const EdgeInsets.only(bottom: 8.0)),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Container(padding: const EdgeInsets.only(right: 16.0)),
                      SizedBox(
                        width: 200, // Adjust the width as needed
                        child: Text(
                          "Location:",
                          style: FlutterFlowTheme.of(context)
                              .bodyLarge
                              .override(
                                fontFamily: 'Montserrat',
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontWeight: FontWeight.w600,
                              ),
                        ),
                        
                      ),
                      Text(
                          widget.location, // Add the survey status
                          style: FlutterFlowTheme.of(context)
                              .bodyLarge
                              .override(
                                fontFamily: 'Montserrat',
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontWeight: FontWeight.w600,
                              ),
                      )
                    ],
                  ),
                  Container(padding: const EdgeInsets.only(bottom: 4.0)),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,

                    children: [
                      Container(padding: const EdgeInsets.only(right: 16.0)),
                      SizedBox(
                        width: 200, // Adjust the width as needed
                        child: Text(
                          "Latitude:",
                          style: FlutterFlowTheme.of(context)
                              .bodyLarge
                              .override(
                                fontFamily: 'Montserrat',
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontWeight: FontWeight.w600,
                              ),
                        ),
                        
                      ),
                      Text(
                          widget.latitude, // Add the survey status
                          style: FlutterFlowTheme.of(context)
                              .bodyLarge
                              .override(
                                fontFamily: 'Montserrat',
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontWeight: FontWeight.w600,
                              ),
                      )
                    ],
                  ),
                  Container(padding: const EdgeInsets.only(bottom: 4.0)),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Container(padding: const EdgeInsets.only(right: 16.0)),
                      SizedBox(
                        width: 200, // Adjust the width as needed
                        child: Text(
                          "Longitude:",
                          style: FlutterFlowTheme.of(context)
                              .bodyLarge
                              .override(
                                fontFamily: 'Montserrat',
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontWeight: FontWeight.w600,
                              ),
                        ),
                        
                      ),
                      Text(
                          widget.longitude, // Add the survey status
                          style: FlutterFlowTheme.of(context)
                              .bodyLarge
                              .override(
                                fontFamily: 'Montserrat',
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontWeight: FontWeight.w600,
                              ),
                      )
                    ],
                  ),
                  Container(padding: const EdgeInsets.only(bottom: 4.0)),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Container(padding: const EdgeInsets.only(right: 16.0)),
                      SizedBox(
                        width: 200, // Adjust the width as needed
                        child: Text(
                          "Facing Direction:",
                          style: FlutterFlowTheme.of(context)
                              .bodyLarge
                              .override(
                                fontFamily: 'Montserrat',
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontWeight: FontWeight.w600,
                              ),
                        ),
                        
                      ),
                      Text(
                          widget.facingDirection, // Add the survey status
                          style: FlutterFlowTheme.of(context)
                              .bodyLarge
                              .override(
                                fontFamily: 'Montserrat',
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontWeight: FontWeight.w600,
                              ),
                      )
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
