import 'package:flutter/material.dart';

class PressableImage extends StatefulWidget {
  final String imagePath;
  final double width;
  final double height;
  final Color color;
  final VoidCallback function;

  const PressableImage({
    Key? key,
    required this.imagePath,
    required this.function,
    this.width = 24.0,
    this.height = 24.0,
    this.color = Colors.white,
  }) : super(key: key);

  @override
  _PressableImageState createState() => _PressableImageState();
}

class _PressableImageState extends State<PressableImage> {
  double _imageOpacity = 1.0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        setState(() {
          widget.function();
          _imageOpacity = 0.5;
        });
      },
      onTapUp: (_) {
        
       Future.delayed(Duration(milliseconds: 100), () {
      setState(() {
        _imageOpacity = 1.0;
      });
    });
      },
      onTapCancel: () {
        setState(() {
          _imageOpacity = 1.0;
        });
      },
      child: Opacity(
        opacity: _imageOpacity,
        child: Image.asset(
          widget.imagePath,
          color: widget.color,
          width: widget.width,
          height: widget.height,
        ),
      ),
    );
  }
}