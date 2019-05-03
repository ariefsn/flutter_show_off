import 'package:flutter/material.dart';

class ImageBox extends StatelessWidget {
  ImageBox({
    this.source
  });
  final String source;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border.all(width: 1.0, style: BorderStyle.solid, color: Colors.black),
        image: DecorationImage(
          image: AssetImage(this.source, ),
          fit: BoxFit.cover,
        )
      ),
    );
    // return Image.asset(this.source);
  }
}