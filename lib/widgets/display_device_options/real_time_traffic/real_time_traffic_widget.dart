import '/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import '../display_device_options_text.dart';

class realTimeTrafficWidget extends StatefulWidget {
  bool isExpanded;
  double padding;
  int peakSpeed;
  String direction;
  String distanceTracked;

  realTimeTrafficWidget({required this.isExpanded, required this.padding, required this.peakSpeed, required this.direction, required this.distanceTracked});

  @override
  _realTimeTrafficWidgetState createState() => _realTimeTrafficWidgetState();
}

class _realTimeTrafficWidgetState extends State<realTimeTrafficWidget> {
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        "Last Vehicle",
                        style: FlutterFlowTheme.of(context).bodyLarge.override(
                              fontFamily: 'Montserrat',
                              color: FlutterFlowTheme.of(context).primaryText,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                      
                    ],
                  ),
                  Container(padding: const EdgeInsets.only(bottom: 4.0)),
                  DisplayDeviceOptionsText(text1: "Peak Speed:", text2: widget.peakSpeed.toString(), width: 200),
                  Container(padding: const EdgeInsets.only(bottom: 4.0)),
                  DisplayDeviceOptionsText(text1: "Direction:", text2: widget.direction, width: 200),
                  Container(padding: const EdgeInsets.only(bottom: 4.0)),
                  DisplayDeviceOptionsText(text1: "Distance Tracked:", text2: widget.distanceTracked, width: 200),
                  // Add more details here
                ],
              )
            : Container(),
      ),
    );
  }
}
