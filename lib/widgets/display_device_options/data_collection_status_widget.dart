import '/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';


class DataCollectionStatusWidget extends StatefulWidget {

  bool isExpanded;
  double padding;

  DataCollectionStatusWidget({required this.isExpanded, required this.padding});
  
  @override
  _DataCollectionStatusWidgetState createState() => _DataCollectionStatusWidgetState();
}

class _DataCollectionStatusWidgetState extends State<DataCollectionStatusWidget> {
 
  


  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      setState(() {
       
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
                color: Color.fromARGB(255, 49, 50, 50), // Background color
                borderRadius: BorderRadius.circular(12.0), // Border radius
              ),
               padding:  EdgeInsets.all(widget.padding),
              child: widget.isExpanded
              
                  ? Column(
                      children: [
                        //SizedBox(height: 16.0), // Add vertical spacing
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [

                                Text(
                                  'Survey Status',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyLarge
                                      .override(
                                        fontFamily: 'Montserrat',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                    
                          ],
                        ),
                        Container(padding: EdgeInsets.only(bottom: 4.0)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                                Text(
                                  'Vehicle Count',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyLarge
                                      .override(
                                        fontFamily: 'Montserrat',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
          
                          ],
                        ),
                        Container(padding: EdgeInsets.only(bottom: 4.0)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                                Text(
                                  'Survey Start',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyLarge
                                      .override(
                                        fontFamily: 'Montserrat',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
              
                          ],
                        ),
                        Container(padding: EdgeInsets.only(bottom: 4.0)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                                Text(
                                  'Survey Memory',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyLarge
                                      .override(
                                        fontFamily: 'Montserrat',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                          ],
                        ),
                        // Add more details here
                      ],
                    )
                  : Container(),
            ),
          );
  }
}