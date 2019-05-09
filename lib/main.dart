import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_show_off/bloc/bloc.dart';
import 'views/dashboard.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final MainBloc _mainBloc = MainBloc();
  final FlatButtonBloc _flatButtonBloc = FlatButtonBloc();
  final RaisedButtonBloc _raisedButtonBloc = RaisedButtonBloc();
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Show Off',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProviderTree(
        blocProviders: [
          BlocProvider<MainBloc>(bloc: _mainBloc),
          BlocProvider<FlatButtonBloc>(bloc: _flatButtonBloc),
          BlocProvider<RaisedButtonBloc>(bloc: _raisedButtonBloc),
        ],
        child: Dashboard(title: "Show Off",),
      ),
    );
  }
}
