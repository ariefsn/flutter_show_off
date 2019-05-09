import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

// @immutable
abstract class MainState extends Equatable {
  MainState([List props = const []]) : super(props);
}
  
class InitialMainState extends MainState {}

class FlatButtonState extends MainState{
  FlatButtonState({
    this.width = 200.0,
    this.height = 50.0,
    this.label = "Flat Button",
    this.onPressed,
    this.color,
    this.splashColor,
    this.disabled = false,
    this.disabledColor,
    this.disabledTextColor,
    this.textColor,
    this.highlightColor,
    this.padding,
    this.borderTopLeft = 0,
    this.borderTopRight = 0,
    this.borderBottomLeft = 0,
    this.borderBottomRight = 0,
  }) : super([width, height, label, onPressed, color, splashColor, disabled, textColor, highlightColor, padding, borderBottomLeft, borderBottomRight, borderTopLeft, borderTopRight]);

  double height, width, borderTopLeft, borderTopRight, borderBottomLeft, borderBottomRight;
  String label;
  void Function() onPressed;
  Color color, splashColor, disabledColor, textColor, highlightColor, disabledTextColor;
  EdgeInsetsGeometry padding;
  bool disabled;
}

class RaisedButtonState extends MainState {
  double width, height, radiusAll, radiusCircular, radiusHorLeft, radiusHorRight, radiusVerTop, radiusVerBottom, radiusOnlyTopLeft, radiusOnlyTopRight, radiusOnlyBottomLeft, radiusOnlyBottomRight;
  String title, borderRadiusType;
  void Function() onPressed;
  int duration;
  Color color, disabledColor, disabledTextColor, highlightColor, titleColor, splashColor;
  EdgeInsetsGeometry padding;
  bool disabled;

  RaisedButtonState({
    this.width = 200.0,
    this.height = 50.0,
    this.title = "Raised Button",
    this.onPressed,
    this.duration = 1000,
    this.disabled = false,
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
  }) : super([width, height, title, titleColor, onPressed, duration, disabled, disabledColor, disabledTextColor, highlightColor, color, splashColor, padding, borderRadiusType, radiusAll, radiusCircular, radiusHorLeft, radiusHorRight, radiusVerBottom, radiusVerTop, radiusOnlyBottomLeft, radiusOnlyBottomRight, radiusOnlyTopLeft, radiusOnlyTopRight]);
}