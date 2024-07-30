import 'package:flutter/material.dart';
import '/flutter_flow/flutter_flow_theme.dart';

class DisplayDeviceOptionsText extends StatefulWidget {
  String text1;
  String text2;
  double width;

  DisplayDeviceOptionsText({required this.text1, required this.text2, required this.width});

  @override
  _DisplayDeviceOptionsTextState createState() =>
      _DisplayDeviceOptionsTextState();
}

class _DisplayDeviceOptionsTextState extends State<DisplayDeviceOptionsText> {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
      children: [
        SizedBox(
          width: widget.width, // Adjust the width as needed
          child: Text(
            widget.text1,
            style: FlutterFlowTheme.of(context).bodyLarge.override(
                  fontFamily: 'Montserrat',
                  color: FlutterFlowTheme.of(context).primaryText,
                  fontWeight: FontWeight.w600,
                ),
          ),
        ),
        Text(
          widget.text2, // Add the survey status
          style: FlutterFlowTheme.of(context).bodyLarge.override(
                fontFamily: 'Montserrat',
                color: FlutterFlowTheme.of(context).primaryText,
                fontWeight: FontWeight.w600,
              ),
        )
      ],
    );
  }
}
