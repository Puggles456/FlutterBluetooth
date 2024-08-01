import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import '../display_device_options_text.dart';
import '/flutter_flow/flutter_flow_theme.dart';

class DataCollectionStatusWidget extends StatefulWidget {
  bool isExpanded;
  double padding;
  String surveyStatus;
  int vehicleCount;
  String surveyStart;
  String memory;

  DataCollectionStatusWidget(
      {required this.isExpanded,
      required this.padding,
      required this.surveyStatus,
      required this.vehicleCount,
      required this.surveyStart,
      required this.memory});

  @override
  _DataCollectionStatusWidgetState createState() =>
      _DataCollectionStatusWidgetState();
}

class _DataCollectionStatusWidgetState
    extends State<DataCollectionStatusWidget> {
  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      setState(() {});
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
                  //DisplayDeviceOptionsText(text1: "Vehicle Count:", text2: widget.surveyStatus,width: 160,),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        "Vehicle Count",
                        style: FlutterFlowTheme.of(context).bodyLarge.override(
                              fontFamily: 'Montserrat',
                              color: FlutterFlowTheme.of(context).primaryText,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                    ],
                  ),
                  Container(padding: const EdgeInsets.only(bottom: 4.0)),
                  Container(
                       padding: const EdgeInsets.all(4.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          color: Color.fromARGB(255, 34, 35, 35),
                          
                        ),
                        child: Center(
                          child: Column(
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
                                'Total',
                                style: FlutterFlowTheme.of(context)
                                    .bodyLarge
                                    .override(
                                      fontFamily: 'Montserrat',
                                      fontSize: 20.0,
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
                  Container(padding: const EdgeInsets.only(bottom: 8.0)),
                  DisplayDeviceOptionsText(
                    text1: "Survey Start:",
                    text2: widget.surveyStatus,
                    width: 220,
                  ),
                  Container(padding: const EdgeInsets.only(bottom: 8.0)),
                  DisplayDeviceOptionsText(
                    text1: "Duration of Operation:",
                    text2: widget.surveyStart,
                    width: 220,
                  ),
                  Container(padding: const EdgeInsets.only(bottom: 8.0)),
                  DisplayDeviceOptionsText(
                    text1: "Memory Used",
                    text2: widget.memory,
                    width: 220,
                  ),
                   Container(padding: const EdgeInsets.only(bottom: 4.0))
                  // Add more details here
                ],
              )
            : Container(),
      ),
    );
  }
}
