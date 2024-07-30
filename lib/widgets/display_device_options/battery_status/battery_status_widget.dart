import '/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';

class BatteryStatusWidget extends StatefulWidget {
  bool isExpanded;
  double padding;
  double days;

  BatteryStatusWidget(
      {required this.isExpanded, required this.padding, required this.days});

  @override
  _BatteryStatusWidgetState createState() => _BatteryStatusWidgetState();
}

class _BatteryStatusWidgetState extends State<BatteryStatusWidget> {
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
                    crossAxisAlignment: CrossAxisAlignment.center,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Container(
                        width: 100,
                        height: 90,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          color: Color.fromARGB(255, 34, 35, 35),
                          border: Border.all(
                            color: Color.fromARGB(255, 80, 81, 81), // Border color
                            width: 2.0, // Border width
                          ),
                        ),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            
                            children: [
                              Text(
                                '0',
                                style: FlutterFlowTheme.of(context)
                                    .bodyLarge
                                    .override(
                                      fontFamily: 'Montserrat',
                                      fontSize: 24.0,
                                      color:
                                          FlutterFlowTheme.of(context).primaryText,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                              Text(
                                '%',
                                style: FlutterFlowTheme.of(context)
                                    .bodyLarge
                                    .override(
                                      fontFamily: 'Montserrat',
                                      fontSize: 12.0,
                                      color:
                                          FlutterFlowTheme.of(context).primaryText,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(padding: const EdgeInsets.only(right: 8.0)),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${widget.days} days',
                            style: FlutterFlowTheme.of(context).bodyLarge.override(
                                  fontFamily: 'Montserrat',
                                  fontSize: 24.0,
                                  color: FlutterFlowTheme.of(context).primaryText,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                          Text(
                            'Time to Empty',
                            style: FlutterFlowTheme.of(context).bodyLarge.override(
                                  fontFamily: 'Montserrat',
                                  fontSize: 12.0,
                                  color: FlutterFlowTheme.of(context).primaryText,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                        ],
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
