import '/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class SurveyScheduleWidget extends StatefulWidget {
  bool isExpanded;
  double padding;

  SurveyScheduleWidget({required this.isExpanded, required this.padding});

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
          color: Color.fromARGB(255, 49, 50, 50), // Background color
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
                      ElevatedButton(
                        onPressed: () {
                          // Action to perform on button press
                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: FlutterFlowTheme.of(context)
                              .accent1, // Text color
                        ),
                        child: Text('MON'),
                      ),
                      Container(padding: EdgeInsets.only(right: 4.0)),
                      ElevatedButton(
                        onPressed: () {
                          // Action to perform on button press
                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: FlutterFlowTheme.of(context)
                              .accent1, // Text color
                        ),
                        child: Text('TUE'),
                      ),
                      Container(padding: EdgeInsets.only(right: 4.0)),
                      ElevatedButton(
                        onPressed: () {
                          // Action to perform on button press
                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: FlutterFlowTheme.of(context)
                              .accent1, // Text color
                        ),
                        child: Text('WED'),
                      ),
                      Container(padding: EdgeInsets.only(right: 4.0)),
                      ElevatedButton(
                        onPressed: () {
                          // Action to perform on button press
                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: FlutterFlowTheme.of(context)
                              .accent1, // Text color
                        ),
                        child: Text('THU'),
                      ),
                      Container(padding: EdgeInsets.only(right: 4.0)),
                      ElevatedButton(
                        onPressed: () {
                          // Action to perform on button press
                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: FlutterFlowTheme.of(context)
                              .accent1, // Text color
                        ),
                        child: Text('FRI'),
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    mainAxisAlignment: MainAxisAlignment.center,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          // Action to perform on button press
                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: FlutterFlowTheme.of(context)
                              .accent1, // Text color
                        ),
                        child: Text('SAT'),
                      ),
                      Container(padding: EdgeInsets.only(right: 4.0)),
                      ElevatedButton(
                        onPressed: () {
                          // Action to perform on button press
                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: FlutterFlowTheme.of(context)
                              .accent1, // Text color
                        ),
                        child: Text('SUN'),
                      ),
                    ],
                  ),
                  Container(padding: EdgeInsets.only(top: 8.0)),
                  Text(
                    'Operational Hours',
                    style: FlutterFlowTheme.of(context).bodyLarge.override(
                          fontFamily: 'Montserrat',
                          color: FlutterFlowTheme.of(context).primaryText,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w600,
                        ),
                  ),

                  Container(padding: EdgeInsets.only(top: 8.0)),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                          onTap: () => onTap(0),
                          child: Visibility(
                            visible: choice != 0,
                            child: const Icon(
                              Icons.radio_button_unchecked,
                              color: Colors.white,
                              size: 24.0,
                            ),
                          )),
                      Visibility(
                        visible: choice == 0,
                        child: const Icon(
                          Icons.radio_button_checked,
                          color: Colors.blue,
                          size: 24.0,
                        ),
                      ),
                      Container(padding: EdgeInsets.only(right: 8.0)),
                      Text(
                        'Continuous Mode',
                        style: FlutterFlowTheme.of(context).bodyLarge.override(
                              fontFamily: 'Montserrat',
                              color: FlutterFlowTheme.of(context).primaryText,
                              fontSize: 14.0,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                    ],
                  ),
                  Container(padding: EdgeInsets.only(top: 4.0)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                          onTap: () => onTap(1),
                          child: Visibility(
                            visible: choice != 1,
                            child: const Icon(
                              Icons.radio_button_unchecked,
                              color: Colors.white,
                              size: 24.0,
                            ),
                          )),
                      Visibility(
                        visible: choice == 1,
                        child: const Icon(
                          Icons.radio_button_checked,
                          color: Colors.blue,
                          size: 24.0,
                        ),
                      ),
                      Container(padding: EdgeInsets.only(right: 16.0)),
                      Text(
                        'Scheduled Mode',
                        style: FlutterFlowTheme.of(context).bodyLarge.override(
                              fontFamily: 'Montserrat',
                              color: FlutterFlowTheme.of(context).primaryText,
                              fontSize: 14.0,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                    ],
                  ),
                  Container(padding: EdgeInsets.only(top: 16.0)),

                  // Add more details here
                  Row(
                    children: [
                      Text(
                        '1',
                        style: FlutterFlowTheme.of(context).bodyLarge.override(
                              fontFamily: 'Montserrat',
                              color: FlutterFlowTheme.of(context).primaryText,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                      Container(padding: EdgeInsets.only(right: 19.0)),
                      GestureDetector(
                          onTap: () => onBox1(),
                          child: Visibility(
                            visible: !box1,
                            child: const Icon(
                              Icons.check_box_outline_blank,
                              color: Colors.grey,
                              size: 24.0,
                            ),
                          )),
                      GestureDetector(
                        onTap: () => onBox1(),
                        child: Visibility(
                          visible: box1,
                          child: const Icon(
                            Icons.check_box,
                            color: Colors.blue,
                            size: 24.0,
                          ),
                        ),
                      ),
                      Container(padding: EdgeInsets.only(right: 4.0)),
                      SizedBox(
                        width: 70, // Adjust the width as needed
                        child: Text(
                          !box1 ? 'Enable' : 'Disable',
                          style: FlutterFlowTheme.of(context)
                              .bodyLarge
                              .override(
                                fontFamily: 'Montserrat',
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontWeight: FontWeight.w600,
                              ),
                        ),
                      ),
                      Container(padding: EdgeInsets.only(right: 16.0)),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Start Time:',
                            style: FlutterFlowTheme.of(context)
                                .bodyLarge
                                .override(
                                  fontFamily: 'Montserrat',
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                          Text(
                            'Stop Time:',
                            style: FlutterFlowTheme.of(context)
                                .bodyLarge
                                .override(
                                  fontFamily: 'Montserrat',
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Container(padding: EdgeInsets.only(top: 16.0)),
                  Row(
                    children: [
                      Text(
                        '2',
                        style: FlutterFlowTheme.of(context).bodyLarge.override(
                              fontFamily: 'Montserrat',
                              color: FlutterFlowTheme.of(context).primaryText,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                      Container(padding: EdgeInsets.only(right: 16.0)),
                      GestureDetector(
                          onTap: () => onBox2(),
                          child: Visibility(
                            visible: !box2,
                            child: const Icon(
                              Icons.check_box_outline_blank,
                              color: Colors.grey,
                              size: 24.0,
                            ),
                          )),
                      GestureDetector(
                        onTap: () => onBox2(),
                        child: Visibility(
                          visible: box2,
                          child: const Icon(
                            Icons.check_box,
                            color: Colors.blue,
                            size: 24.0,
                          ),
                        ),
                      ),
                      Container(padding: const EdgeInsets.only(right: 4.0)),
                      SizedBox(
                        width: 70, // Adjust the width as needed
                        child: Text(
                          !box2 ? 'Enable' : 'Disable',
                          style: FlutterFlowTheme.of(context)
                              .bodyLarge
                              .override(
                                fontFamily: 'Montserrat',
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontWeight: FontWeight.w600,
                              ),
                        ),
                      ),
                      Container(padding: EdgeInsets.only(right: 16.0)),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Start Time:',
                            style: FlutterFlowTheme.of(context)
                                .bodyLarge
                                .override(
                                  fontFamily: 'Montserrat',
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                          Text(
                            'Stop Time:',
                            style: FlutterFlowTheme.of(context)
                                .bodyLarge
                                .override(
                                  fontFamily: 'Montserrat',
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                        ],
                      ),
                    ],
                  ),
                
                 Container(padding: EdgeInsets.only(top: 16.0)),
                  Row(
                    children: [
                      Text(
                        '3',
                        style: FlutterFlowTheme.of(context).bodyLarge.override(
                              fontFamily: 'Montserrat',
                              color: FlutterFlowTheme.of(context).primaryText,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                      Container(padding: EdgeInsets.only(right: 16.0)),
                      GestureDetector(
                          onTap: () => onBox3(),
                          child: Visibility(
                            visible: !box3,
                            child: const Icon(
                              Icons.check_box_outline_blank,
                              color: Colors.grey,
                              size: 24.0,
                            ),
                          )),
                      GestureDetector(
                        onTap: () => onBox3(),
                        child: Visibility(
                          visible: box3,
                          child: const Icon(
                            Icons.check_box,
                            color: Colors.blue,
                            size: 24.0,
                          ),
                        ),
                      ),
                      Container(padding: EdgeInsets.only(right: 4.0)),
                      SizedBox(
                        width: 70, // Adjust the width as needed
                        child: Text(
                          !box3 ? 'Enable' : 'Disable',
                          style: FlutterFlowTheme.of(context)
                              .bodyLarge
                              .override(
                                fontFamily: 'Montserrat',
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontWeight: FontWeight.w600,
                              ),
                        ),
                      ),
                      Container(padding: EdgeInsets.only(right: 16.0)),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Start Time:',
                            style: FlutterFlowTheme.of(context)
                                .bodyLarge
                                .override(
                                  fontFamily: 'Montserrat',
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                          Text(
                            'Stop Time:',
                            style: FlutterFlowTheme.of(context)
                                .bodyLarge
                                .override(
                                  fontFamily: 'Montserrat',
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Container(padding: EdgeInsets.only(top: 16.0)),
                  Row(
                    children: [
                      Text(
                        '4',
                        style: FlutterFlowTheme.of(context).bodyLarge.override(
                              fontFamily: 'Montserrat',
                              color: FlutterFlowTheme.of(context).primaryText,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                      Container(padding: EdgeInsets.only(right: 15.0)),
                      GestureDetector(
                        onTap: () => onBox4(),
                        child: Visibility(
                          visible: !box4,
                          child: const Icon(
                            Icons.check_box_outline_blank,
                            color: Colors.grey,
                            size: 24.0,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => onBox4(),
                        child: Visibility(
                          visible: box4,
                          child: const Icon(
                            Icons.check_box,
                            color: Colors.blue,
                            size: 24.0,
                          ),
                        ),
                      ),
                      Container(padding: EdgeInsets.only(right: 4.0)),
                      SizedBox(
                        width: 70, // Adjust the width as needed
                        child: Text(
                          !box4 ? 'Enable' : 'Disable',
                          style: FlutterFlowTheme.of(context)
                              .bodyLarge
                              .override(
                                fontFamily: 'Montserrat',
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontWeight: FontWeight.w600,
                              ),
                        ),
                      ),
                      Container(padding: EdgeInsets.only(right: 16)),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Start Time:',
                            style: FlutterFlowTheme.of(context)
                                .bodyLarge
                                .override(
                                  fontFamily: 'Montserrat',
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                          Text(
                            'Stop Time:',
                            style: FlutterFlowTheme.of(context)
                                .bodyLarge
                                .override(
                                  fontFamily: 'Montserrat',
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              )
            : Container(),
      ),
    );
  }
}
