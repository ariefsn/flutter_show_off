import 'dart:async';
import 'package:bloc/bloc.dart';
import './bloc.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  @override
  MainState get initialState => InitialMainState();

  @override
  Stream<MainState> mapEventToState( MainEvent event, ) async* {

  }
}

class FlatButtonBloc extends Bloc<MainEvent, FlatButtonState> {
  @override
  FlatButtonState get initialState => FlatButtonState();

  StreamController _flatButton = StreamController<FlatButtonState>.broadcast();
  StreamSink<FlatButtonState> get _inFlatButton => _flatButton.sink;
  Stream<FlatButtonState> get outFlatButton => _flatButton.stream;

  FlatButtonBloc();

  @override
  void dispose() {
    super.dispose();
    _flatButton.close();
  }

  @override
  Stream<FlatButtonState> mapEventToState(MainEvent event) async* {
    if (event is FlatButtonAction) {
      _inFlatButton.add(event.flatButtonState);
      currentState.height = event.flatButtonState.height;
      currentState.width = event.flatButtonState.width;
      currentState.color = event.flatButtonState.color;
      currentState.borderBottomLeft = event.flatButtonState.borderBottomLeft;
      currentState.borderBottomRight = event.flatButtonState.borderBottomRight;
      currentState.borderTopLeft = event.flatButtonState.borderTopLeft;
      currentState.borderTopRight = event.flatButtonState.borderTopRight;
      currentState.disabled = event.flatButtonState.disabled;
      currentState.disabledColor = event.flatButtonState.disabledColor;
      currentState.highlightColor = event.flatButtonState.highlightColor;
      currentState.label = event.flatButtonState.label;
      currentState.onPressed = event.flatButtonState.onPressed;
      currentState.padding = event.flatButtonState.padding;
      currentState.splashColor = event.flatButtonState.splashColor;
      currentState.disabledTextColor = event.flatButtonState.disabledTextColor;
    }
  }
  
}

class RaisedButtonBloc extends Bloc<MainEvent, RaisedButtonState> {
  @override
  RaisedButtonState get initialState => RaisedButtonState();

  StreamController _raisedButton = StreamController<RaisedButtonState>.broadcast();
  StreamSink<RaisedButtonState> get _inRaisedButton => _raisedButton.sink;
  Stream<RaisedButtonState> get outRaisedButton => _raisedButton.stream;

  RaisedButtonBloc();

  @override
  void dispose() {
    super.dispose();
    _raisedButton.close();
  }

  @override
  Stream<RaisedButtonState> mapEventToState(MainEvent event) async* {
    if (event is RaisedButtonAction) {
      _inRaisedButton.add(event.raisedButtonState);
      currentState.borderRadiusType = event.raisedButtonState.borderRadiusType;
      currentState.color = event.raisedButtonState.color;
      currentState.disabled = event.raisedButtonState.disabled;
      currentState.disabledColor = event.raisedButtonState.disabledColor;
      currentState.disabledTextColor = event.raisedButtonState.disabledTextColor;
      currentState.duration = event.raisedButtonState.duration;
      currentState.height = event.raisedButtonState.height;
      currentState.highlightColor = event.raisedButtonState.highlightColor;
      currentState.onPressed = event.raisedButtonState.onPressed;
      currentState.padding = event.raisedButtonState.padding;
      currentState.radiusAll = event.raisedButtonState.radiusAll;
      currentState.radiusCircular = event.raisedButtonState.radiusCircular;
      currentState.radiusHorLeft = event.raisedButtonState.radiusHorLeft;
      currentState.radiusHorRight = event.raisedButtonState.radiusHorRight;
      currentState.radiusOnlyBottomLeft = event.raisedButtonState.radiusOnlyBottomLeft;
      currentState.radiusOnlyBottomRight = event.raisedButtonState.radiusOnlyBottomRight;
      currentState.radiusOnlyTopLeft = event.raisedButtonState.radiusOnlyTopLeft;
      currentState.radiusOnlyTopRight = event.raisedButtonState.radiusOnlyTopRight;
      currentState.radiusVerBottom = event.raisedButtonState.radiusVerBottom;
      currentState.radiusVerTop = event.raisedButtonState.radiusVerTop;
      currentState.splashColor = event.raisedButtonState.splashColor;
      currentState.title = event.raisedButtonState.title;
      currentState.titleColor = event.raisedButtonState.titleColor;
      currentState.width = event.raisedButtonState.width;
    }
  }
  
}