import 'package:flutter/material.dart';
import 'package:flutter_show_off/views/flatButtonWithConfig.dart';
// import 'package:flutter_show_off/components/InheritedBloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_show_off/bloc/bloc.dart';
import 'package:flutter_show_off/views/raisedButtonWithConfig.dart';

class MyButtons extends StatefulWidget {
  MyButtons({
    Key key,
    this.title
  }) : super(key:key);

  final String title;

  @override
  _MyButtonsState createState() => _MyButtonsState();
}

class _MyButtonsState extends State<MyButtons> with SingleTickerProviderStateMixin {
  List<String> _buttons = ["Flat", "Raised"];

  List<Tab> _tabView = [];
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _buttons.forEach((s) {
      _tabView.add(Tab(
        key: Key(s.toLowerCase()),
        text: s,
      ));
    });
    _tabController = TabController(length: _tabView.length, vsync: this);
  }
  
  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: TabBarView(
        controller: _tabController,
        children: _tabView.map((Tab tab) {
          return tab.key == Key("flat") ? MyFlatButtonWithConfig() : MyRaisedButtonWithConfig();
        }).toList(),
      ),
      bottomNavigationBar: TabBar(
        controller: _tabController,
        tabs: _tabView,
        labelColor: Colors.blue,
      ),
      resizeToAvoidBottomPadding: true,
    );
  }
}
