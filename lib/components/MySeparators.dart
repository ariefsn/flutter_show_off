import 'package:flutter/material.dart';

class MySimpleSeparator extends StatelessWidget {
  MySimpleSeparator({
    Key key,
    this.color,
    this.width,
    this.height,
  }) : super(key:key);

  final Color color;
  final double width, height;
  
  @override
  Widget build(BuildContext context) {
    return Container(
      color: color != null ? color : Theme.of(context).primaryColor,
      height: height,
      width: width,
    );
  }
}