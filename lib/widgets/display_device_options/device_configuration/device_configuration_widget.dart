import 'package:flutter/material.dart';
import '/flutter_flow/flutter_flow_theme.dart';

class DeviceConfigurationWidget extends StatefulWidget {
  bool isExpanded;
  double padding;

  DeviceConfigurationWidget({required this.isExpanded, required this.padding});

  @override
  _DeviceConfigurationWidgetState createState() =>
      _DeviceConfigurationWidgetState();
}

class _DeviceConfigurationWidgetState extends State<DeviceConfigurationWidget> {
  double opacity = 1.0;

  void tapDown() {
    setState(() {
      opacity = 0.5;
    });
  }
  void tapUp(){
      Future.delayed(Duration(milliseconds: 100)).then((_) {
        setState(() {
          opacity = 1.0;
        });
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
              ? Center(
                  child: GestureDetector(
                  onTapDown: (details) => tapDown(),
                  onTapUp: (details) => tapUp(),  
                  child: Opacity(
                    opacity: opacity,
                    child: Container(
                        padding: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          color: const Color.fromARGB(255, 49, 50, 50),
                          border: Border.all(
                            color: const Color.fromARGB(
                                133, 255, 255, 255), // Border color
                            width: 1.0, // Border width
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'Reset To Factory Defaults',
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
                        )),
                  ),
                ))
              : Container()),
    );
  }
}
