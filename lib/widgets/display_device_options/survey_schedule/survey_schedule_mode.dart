import 'package:flutter/material.dart';
import '/flutter_flow/flutter_flow_theme.dart';

class SurveyScheduleMode extends StatefulWidget {
  final String title;
  int choice;
  int ownChoice;
  Function(int) onPressed;

  SurveyScheduleMode(
      {required this.title,
      required this.onPressed,
      required this.choice,
      required this.ownChoice});

  @override
  State<StatefulWidget> createState() {
    return _SurveyScheduleMode();
  }
}

class _SurveyScheduleMode extends State<SurveyScheduleMode> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
            onTap: () => widget.onPressed(widget.ownChoice),
            child: Visibility(
              visible: widget.choice != widget.ownChoice,
              child: const Icon(
                Icons.radio_button_unchecked,
                color: Colors.white,
                size: 24.0,
              ),
            )),
        Visibility(
          visible: widget.choice == widget.ownChoice,
          child: const Icon(
            Icons.radio_button_checked,
            color: Colors.blue,
            size: 24.0,
          ),
        ),
        Container(padding: const EdgeInsets.only(right: 8.0)),
        SizedBox(
          width: 140,
          child: Text(
            widget.title,
            textAlign: TextAlign.end,
            style: FlutterFlowTheme.of(context).bodyLarge.override(
              fontFamily: 'Montserrat',
              color: FlutterFlowTheme.of(context).primaryText,
              fontSize: 14.0,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
