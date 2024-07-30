import 'package:flutter/material.dart';

class LoadingPageWidget extends StatefulWidget  
{
  @override
  State<LoadingPageWidget> createState() => _LoadingPageWidgetState();
}

class _LoadingPageWidgetState extends State<LoadingPageWidget> 
{
  @override
  Widget build(BuildContext context) 
  {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}