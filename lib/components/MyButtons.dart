import 'package:flutter/material.dart';

class MyFlatButton extends StatelessWidget {
  MyFlatButton({
    this.width = 200.0,
    this.label = "Flat Button",
    this.onPressed,
    this.color,
    this.splashColor,
    this.disabledColor,
    this.textColor,
    this.highlightColor,
    this.padding,
    this.borderTopLeft = 0,
    this.borderTopRight = 0,
    this.borderBottomLeft = 0,
    this.borderBottomRight = 0,
  });

  final double width, borderTopLeft, borderTopRight, borderBottomLeft, borderBottomRight;
  final String label;
  final void Function() onPressed;
  final Color color, splashColor, disabledColor, textColor, highlightColor;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: FlatButton(
        child: Text(label),
        onPressed: onPressed,
        color: color,
        splashColor: splashColor,
        disabledColor: disabledColor,
        textColor: textColor,
        highlightColor: highlightColor,
        padding: padding,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(
          topLeft: Radius.circular(borderTopLeft),
          topRight: Radius.circular(borderTopRight),
          bottomLeft: Radius.circular(borderBottomLeft),
          bottomRight: Radius.circular(borderBottomRight),
        )),
      ),
    );
  }
}