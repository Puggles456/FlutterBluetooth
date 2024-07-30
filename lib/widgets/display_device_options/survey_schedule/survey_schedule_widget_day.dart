import 'package:flutter/material.dart';
import '/flutter_flow/flutter_flow_theme.dart';

class SurveyScheduleWidgetDay extends StatefulWidget {
  final String title;
 

  SurveyScheduleWidgetDay(
      {required this.title});

  @override
  State<StatefulWidget> createState() {
    return _SurveyScheduleWidgetDay();
  }
}

class _SurveyScheduleWidgetDay extends State<SurveyScheduleWidgetDay> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // Action to perform on button press
      },
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: FlutterFlowTheme.of(context).accent1, // Text color
      ),
      child: Text(widget.title),
    );
  }
}
