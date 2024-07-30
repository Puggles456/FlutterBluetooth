import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import '../display_device_options_text.dart';

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
                  DisplayDeviceOptionsText(text1: "Survey Status:", text2: widget.surveyStatus,width: 160,),
                  Container(padding: const EdgeInsets.only(bottom: 4.0)),
                  DisplayDeviceOptionsText(text1: "Vehicle Count:", text2: widget.vehicleCount.toString(), width: 160,),
                  Container(padding: const EdgeInsets.only(bottom: 4.0)),
                  DisplayDeviceOptionsText(text1: "Survey Start:", text2: widget.surveyStart, width: 160,),
                  Container(padding: const EdgeInsets.only(bottom: 4.0)),
                  DisplayDeviceOptionsText(text1: "Memory:", text2: widget.memory, width: 160,),
                  // Add more details here
                ],
              )
            : Container(),
      ),
    );
  }
}
