import 'package:flutter/material.dart';
// import 'package:flutter_show_off/bloc/bloc.dart';

class InheritedBloc extends InheritedWidget {
  InheritedBloc({Key key, this.child
  // , this.bloc
  }) : super(key: key, child: child);

  final Widget child;
  // final ShowoffBloc bloc;

  static InheritedBloc of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(InheritedBloc)as InheritedBloc);
  }

  @override
  bool updateShouldNotify( InheritedBloc oldWidget) {
    return true;
  }
}