import 'package:flutter/material.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '../display_device_options_text.dart';

class AboutWidget extends StatefulWidget {
  bool isExpanded;
  double padding;
  String SD;
  String version;

  AboutWidget(
      {required this.isExpanded,
      required this.padding,
      required this.version,
      required this.SD});

  @override
  _AboutWidgetState createState() => _AboutWidgetState();
}

class _AboutWidgetState extends State<AboutWidget> {
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
                    DisplayDeviceOptionsText(
                      text1: "SD:",
                      text2: widget.SD,
                      width: 100,
                    ),
                    Container(padding: const EdgeInsets.only(bottom: 4.0)),
                    DisplayDeviceOptionsText(
                      text1: "Version:",
                      text2: widget.version,
                      width: 100,
                    ),
                  ],
                )
              : Container()),
    );
  }
}
