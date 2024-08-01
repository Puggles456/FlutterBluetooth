import 'package:flutter/widgets.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'survey_schedule_widget_day.dart';
import 'survey_schedule_mode.dart';
import 'survey_schedule_section_widget.dart';

class SurveyScheduleWidget extends StatefulWidget {
  bool isExpanded;
  double padding;
  String startTime1;
  String startTime2;
  String startTime3;
  String startTime4;
  String stopTime1;
  String stopTime2;
  String stopTime3;
  String stopTime4;

  SurveyScheduleWidget(
      {required this.isExpanded,
      required this.padding,
      required this.startTime1,
      required this.startTime2,
      required this.startTime3,
      required this.startTime4,
      required this.stopTime1,
      required this.stopTime2,
      required this.stopTime3,
      required this.stopTime4});

  @override
  _SurveyScheduleWidgetState createState() => _SurveyScheduleWidgetState();
}

class _SurveyScheduleWidgetState extends State<SurveyScheduleWidget> {
  int choice = 0;
  bool box1 = false;
  bool box2 = false;
  bool box3 = false;
  bool box4 = false;

  void onTap(int index) {
    setState(() {
      choice = index;
    });
  }

  void onBox1() {
    setState(() {
      box1 = !box1;
    });
  }

  void onBox2() {
    setState(() {
      box2 = !box2;
    });
  }

  void onBox3() {
    setState(() {
      box3 = !box3;
    });
  }

  void onBox4() {
    setState(() {
      box4 = !box4;
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      SurveyScheduleWidgetDay(title: "MON"),
                      Container(padding: const EdgeInsets.only(right: 4.0)),
                      SurveyScheduleWidgetDay(title: "TUE"),
                      Container(padding: const EdgeInsets.only(right: 4.0)),
                      SurveyScheduleWidgetDay(title: "WED"),
                      Container(padding: const EdgeInsets.only(right: 4.0)),
                      SurveyScheduleWidgetDay(title: "THU"),
                      Container(padding: const EdgeInsets.only(right: 4.0)),
                      SurveyScheduleWidgetDay(title: "FRI"),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    mainAxisAlignment: MainAxisAlignment.center,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      SurveyScheduleWidgetDay(title: "SAT"),
                      Container(padding: const EdgeInsets.only(right: 4.0)),
                      SurveyScheduleWidgetDay(title: "SUN"),
                    ],
                  ),
                  Container(padding: const EdgeInsets.only(top: 8.0)),
                  Text(
                    'Operational Hours',
                    style: FlutterFlowTheme.of(context).bodyLarge.override(
                          fontFamily: 'Montserrat',
                          color: FlutterFlowTheme.of(context).primaryText,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w600,
                        ),
                  ),

                  Container(padding: const EdgeInsets.only(top: 8.0)),

                  
                  // Add more details here
                  SurveyScheduleSectionWidget(
                      title: "1",
                      onPressed: onBox1,
                      box: box1,
                      startTime1: widget.startTime1,
                      stopTime1: widget.stopTime1),
                  Container(padding: const EdgeInsets.only(top: 16.0)),
                  SurveyScheduleSectionWidget(
                      title: "2",
                      onPressed: onBox2,
                      box: box2,
                      startTime1: widget.startTime2,
                      stopTime1: widget.stopTime2),

                  Container(padding: const EdgeInsets.only(top: 16.0)),
                  SurveyScheduleSectionWidget(
                      title: "3",
                      onPressed: onBox3,
                      box: box3,
                      startTime1: widget.startTime3,
                      stopTime1: widget.stopTime3),

                  Container(padding: const EdgeInsets.only(top: 16.0)),
                  SurveyScheduleSectionWidget(
                      title: "4",
                      onPressed: onBox4,
                      box: box4,
                      startTime1: widget.startTime4,
                      stopTime1: widget.stopTime4),

                  Container(padding: const EdgeInsets.only(top: 16)),
                  Row(
                    children: [
                      Text(
                        (box1 || box2 || box3 || box4) ? 'Schedulded Mode' : 'Continuous Mode',
                        style: FlutterFlowTheme.of(context).bodyLarge.override(
                          fontFamily: 'Montserrat',
                          fontSize: 22.0,
                          color: FlutterFlowTheme.of(context).primaryText,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Action to perform on button press
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor:
                          FlutterFlowTheme.of(context).accent1, // Text color
                    ),
                    child: const Text(
                      'Save To Device',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              )
            : Container(),
      ),
    );
  }
}
