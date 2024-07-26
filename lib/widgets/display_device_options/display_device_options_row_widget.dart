import 'package:flutter/material.dart';
import '/flutter_flow/flutter_flow_theme.dart';

class DisplayDeviceOptionsRowWidget extends StatefulWidget{

  final String title;
  final void Function()? onTap;
  final IconData icon;

  DisplayDeviceOptionsRowWidget({required this.title, required this.onTap, required this.icon});

  @override
  State<StatefulWidget> createState() {
    return _DisplayDeviceOptionsRowWidget();
  }
}

class _DisplayDeviceOptionsRowWidget extends State<DisplayDeviceOptionsRowWidget>{

  @override
  Widget build(BuildContext context) {
    return Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: GestureDetector(
                onTap: () => widget.onTap!(),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: 8.0),
                          child: Icon(
                            widget.icon,
                            color: Colors.white,
                            size: 24.0,
                          ),
                        ),
                        Text(
                          widget.title,
                          style: FlutterFlowTheme.of(context)
                              .bodyLarge
                              .override(
                                fontFamily: 'Montserrat',
                                color: FlutterFlowTheme.of(context).primaryText,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w600,
                              ),
                        ),
                      ],
                    ),
                    const Icon(
                      Icons.arrow_drop_down,
                      color: Colors.white,
                      size: 24.0,
                    ),
                  ],
                ),
              )
              );
  }
}
