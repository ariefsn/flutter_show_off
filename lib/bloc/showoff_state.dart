import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

@immutable
abstract class ShowoffState {}
  
class InitialShowoffState {
  // Buttons
  FlatButtonState flatButtonState;

  InitialShowoffState({
    this.flatButtonState,
  }) {
    flatButtonState = FlatButtonState();
    print(flatButtonState.width);
  }

  init() => InitialShowoffState(
    flatButtonState: flatButtonState,
  );
}

class FlatButtonState {
  FlatButtonState({
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

  double width, borderTopLeft, borderTopRight, borderBottomLeft, borderBottomRight;
  String label;
  void Function() onPressed;
  Color color, splashColor, disabledColor, textColor, highlightColor;
  EdgeInsetsGeometry padding;
}