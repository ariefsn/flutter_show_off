import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_show_off/configs/listMenu.dart';
import 'package:flutter_show_off/bloc/bloc.dart';
// import 'package:flutter_show_off/components/InheritedBloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Dashboard extends StatefulWidget {
  Dashboard({this.title});
  final String title;

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int menuSelected;
  MainBloc _mainBloc;
  FlatButtonBloc _flatButtonBloc;
  RaisedButtonBloc _raisedButtonBloc;

  Future<bool> _willPop() {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => AlertDialog(
              title: Text("Wait"),
              content: Text("Exit now?"),
              actions: <Widget>[
                FlatButton(
                  child: Text("Yap"),
                  onPressed: () => SystemChannels.platform
                      .invokeMethod('SystemNavigator.pop'),
                ),
                FlatButton(
                  child: Text("Noo"),
                  onPressed: () => Navigator.of(context).pop(false),
                ),
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    _mainBloc = BlocProvider.of<MainBloc>(context);
    _flatButtonBloc = BlocProvider.of<FlatButtonBloc>(context);
    _raisedButtonBloc = BlocProvider.of<RaisedButtonBloc>(context);

    return WillPopScope(
      onWillPop: _willPop,
      child: Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.home),
          title: Text(this.widget.title),
        ),
        body: SafeArea(
          child: ListView.builder(
            itemCount: listMenu.length,
            itemBuilder: (BuildContext context, int i) {
              return ListTile(
                dense: true,
                title: Text(listMenu[i]["title"]),
                subtitle: Text(listMenu[i]["description"]),
                selected: this.menuSelected == i ? true : false,
                onTap: () {
                  setState(() {
                    this.menuSelected = i;
                  });
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        // builder: (context) => InheritedBloc(
                        //   child: listMenu[i]["view"],
                        //   bloc: bloc,
                        // ),
                        builder: (context) => BlocProviderTree(
                          blocProviders: [
                            BlocProvider<MainBloc>(bloc: _mainBloc),
                            BlocProvider<FlatButtonBloc>(bloc: _flatButtonBloc),
                            BlocProvider<RaisedButtonBloc>(bloc: _raisedButtonBloc,),
                          ],
                          child: listMenu[i]["view"],
                        ),
                      ));
                },
              );
            },
          ),
        ),
      ),
    );
  }
}