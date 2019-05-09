import 'package:meta/meta.dart';
import './main_state.dart';
import 'package:equatable/equatable.dart';

@immutable
abstract class MainEvent extends Equatable {
  MainEvent([List props = const []]) : super(props);
}

class FlatButtonAction extends MainEvent {
  FlatButtonAction({ @required this.flatButtonState }) : super([flatButtonState]);

  final FlatButtonState flatButtonState;
}

class RaisedButtonAction extends MainEvent {
  RaisedButtonAction({ @required this.raisedButtonState }) : super([raisedButtonState]);

  final RaisedButtonState raisedButtonState;
}