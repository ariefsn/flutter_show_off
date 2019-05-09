import 'package:flutter/material.dart';

class MyFlatButton extends StatelessWidget {
  MyFlatButton({
    this.width = 200.0,
    this.height = 50.0,
    this.label = "Flat Button",
    this.onPressed,
    this.color,
    this.splashColor,
    this.disabledColor,
    this.disabledTextColor,
    this.textColor,
    this.highlightColor,
    this.padding,
    this.borderTopLeft = 0,
    this.borderTopRight = 0,
    this.borderBottomLeft = 0,
    this.borderBottomRight = 0,
  });

  final double width, height, borderTopLeft, borderTopRight, borderBottomLeft, borderBottomRight;
  final String label;
  final void Function() onPressed;
  final Color color, splashColor, disabledColor, textColor, highlightColor, disabledTextColor;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: FlatButton(
        child: Text(label),
        onPressed: onPressed,
        color: color,
        splashColor: splashColor,
        disabledColor: disabledColor,
        disabledTextColor: disabledTextColor,
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

class MyRaisedButton extends StatelessWidget {
  final double width, height, radiusAll, radiusCircular, radiusHorLeft, radiusHorRight, radiusVerTop, radiusVerBottom, radiusOnlyTopLeft, radiusOnlyTopRight, radiusOnlyBottomLeft, radiusOnlyBottomRight;
  final String title, borderRadiusType;
  final void Function() onPressed;
  final int duration;
  final Color color, disabledColor, disabledTextColor, highlightColor, titleColor, splashColor;
  final EdgeInsetsGeometry padding;

  const MyRaisedButton({
    Key key,
    this.width = 200.0,
    this.height = 50.0,
    this.title = "Raised Button",
    this.onPressed,
    this.duration = 1000,
    this.disabledColor,
    this.disabledTextColor,
    this.highlightColor,
    this.color,
    this.titleColor,
    this.splashColor,
    this.padding,
    this.borderRadiusType = "all",
    this.radiusAll = 10.0,
    this.radiusCircular = 10.0,
    this.radiusHorLeft = 10.0,
    this.radiusHorRight = 10.0,
    this.radiusVerTop = 10.0,
    this.radiusVerBottom = 10.0,
    this.radiusOnlyTopLeft = 10.0,
    this.radiusOnlyTopRight = 10.0,
    this.radiusOnlyBottomLeft = 10.0,
    this.radiusOnlyBottomRight = 10.0
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BorderRadius _borderRadius;
    if (borderRadiusType == "all") {
      _borderRadius = BorderRadius.all(Radius.circular(radiusAll));
    } else if (borderRadiusType == "circular") {
      _borderRadius = BorderRadius.circular(radiusCircular);
    } else if (borderRadiusType == "horizontal") {
      _borderRadius = BorderRadius.horizontal(
        left: Radius.circular(radiusHorLeft),
        right: Radius.circular(radiusHorRight)
      );
    } else if (borderRadiusType == "vertical") {
      _borderRadius = BorderRadius.vertical(
        top: Radius.circular(radiusVerTop),
        bottom: Radius.circular(radiusVerBottom)
      );
    } else if (borderRadiusType == "only") {
      _borderRadius = BorderRadius.only(
        topLeft: Radius.circular(radiusOnlyTopLeft),
        topRight: Radius.circular(radiusOnlyTopRight),
        bottomLeft: Radius.circular(radiusOnlyBottomLeft),
        bottomRight: Radius.circular(radiusOnlyBottomRight),
      );
    }

    return SizedBox(
      width: width,
      height: height,
      child: RaisedButton(
        child: Text(title),
        onPressed: onPressed,
        animationDuration: Duration(milliseconds: duration),
        color: color,
        disabledColor: disabledColor,
        disabledTextColor: disabledTextColor,
        highlightColor: highlightColor,
        splashColor: splashColor,
        textColor: titleColor,
        padding: padding,
        shape: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: _borderRadius
        ),
      ),
    );
  }
}