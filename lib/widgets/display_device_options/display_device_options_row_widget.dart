import 'package:flutter/material.dart';
import '/flutter_flow/flutter_flow_theme.dart';

class DisplayDeviceOptionsRowWidget extends StatefulWidget {
  final String title;
  final String imagePath;
  final bool expanded;
  final void Function()? onTap;
 

  DisplayDeviceOptionsRowWidget(
      {required this.title,
      required this.onTap,
      required this.imagePath,
      required this.expanded});
      

  @override
  State<StatefulWidget> createState() {
    return _DisplayDeviceOptionsRowWidget();
  }
}

class _DisplayDeviceOptionsRowWidget
    extends State<DisplayDeviceOptionsRowWidget> {
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
                    child: Image.asset(
                      widget.imagePath, // Load the image from assets
                      color: Colors.white,
                      width: 24.0,
                      height: 24.0,
                    ),
                  ),
                  Text(
                    widget.title,
                    style: FlutterFlowTheme.of(context).bodyLarge.override(
                          fontFamily: 'Montserrat',
                          color: FlutterFlowTheme.of(context).primaryText,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ],
              ),
              Image.asset(
                !widget.expanded ? "assets/images/i_arrow_donw.png" : "assets/images/i_arrow_up.png", // Load the image from assets
                color: Colors.white,
                width: 12.0,
                height: 12.0,
              ),
            ],
          ),
        ));
  }
}
