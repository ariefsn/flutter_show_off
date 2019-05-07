import 'dart:async';
import 'package:bloc/bloc.dart';
import './bloc.dart';

class ShowoffBloc extends Bloc<Actions, InitialShowoffState> {
  @override
  InitialShowoffState get initialState => InitialShowoffState().init();

  // FlatButton
  StreamController _flatButtonSC = StreamController<FlatButtonState>.broadcast();
  StreamSink<FlatButtonState> get inFlatButton => _flatButtonSC.sink;
  Stream<FlatButtonState> get outFlatButton => _flatButtonSC.stream;

  ShowoffBloc() {
    // FlatButton
    _flatButtonSC.stream.listen((v) {
      currentState.flatButtonState = v;
      print(currentState.flatButtonState.color);
      print("From Blog");
    });
  }

  @override
  void dispose() {
    super.dispose();
    _flatButtonSC.close();
  }

  @override
  Stream<InitialShowoffState> mapEventToState( Actions event, ) async* {
    switch (event) {
      case Actions.getFlatButtonState:
        print("From MapEventToState = ${currentState.flatButtonState.color}");
        break;
      default:
    }
  }
}
