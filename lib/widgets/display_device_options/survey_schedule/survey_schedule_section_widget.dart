import 'package:flutter/material.dart';
import '/flutter_flow/flutter_flow_theme.dart';

class SurveyScheduleSectionWidget extends StatefulWidget {
  final String title;
  Function() onPressed;
  bool box;
  String startTime1;
  String stopTime1;

  SurveyScheduleSectionWidget(
      {required this.title,
      required this.onPressed,
      required this.box,
      required this.startTime1,
      required this.stopTime1});

  @override
  State<StatefulWidget> createState() {
    return _SurveyScheduleSectionWidget();
  }
}

class _SurveyScheduleSectionWidget extends State<SurveyScheduleSectionWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 30,
          child: Text(
            widget.title,
            style: FlutterFlowTheme.of(context).bodyLarge.override(
                  fontFamily: 'Montserrat',
                  color: FlutterFlowTheme.of(context).primaryText,
                  fontWeight: FontWeight.w600,
                ),
          ),
        ),
        GestureDetector(
            onTap: () => widget.onPressed(),
            child: Visibility(
              visible: !widget.box,
              child: const Icon(
                Icons.check_box_outline_blank,
                color: Colors.grey,
                size: 24.0,
              ),
            )),
        GestureDetector(
          onTap: () => widget.onPressed(),
          child: Visibility(
            visible: widget.box,
            child: const Icon(
              Icons.check_box,
              color: Colors.blue,
              size: 24.0,
            ),
          ),
        ),
        Container(padding: const EdgeInsets.only(right: 4.0)),
        SizedBox(
          width: 90, // Adjust the width as needed
          child: Text(
            !widget.box ? 'Enable' : 'Disable',
            style: FlutterFlowTheme.of(context).bodyLarge.override(
                  fontFamily: 'Montserrat',
                  color: FlutterFlowTheme.of(context).primaryText,
                  fontWeight: FontWeight.w600,
                ),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SizedBox(
                  width: 120,
                  child: Text(
                    'Start Time:',
                    style: FlutterFlowTheme.of(context).bodyLarge.override(
                          fontFamily: 'Montserrat',
                          color: FlutterFlowTheme.of(context).primaryText,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ),
                Text(
                  widget.startTime1,
                  style: FlutterFlowTheme.of(context).bodyLarge.override(
                        fontFamily: 'Montserrat',
                        color: FlutterFlowTheme.of(context).primaryText,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ],
            ),
            Row(
              children: [
                SizedBox(
                  width: 120,
                  child: Text(
                    'Stop Time:',
                    style: FlutterFlowTheme.of(context).bodyLarge.override(
                          fontFamily: 'Montserrat',
                          color: FlutterFlowTheme.of(context).primaryText,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ),
                Text(
                  widget.stopTime1,
                  style: FlutterFlowTheme.of(context).bodyLarge.override(
                        fontFamily: 'Montserrat',
                        color: FlutterFlowTheme.of(context).primaryText,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
