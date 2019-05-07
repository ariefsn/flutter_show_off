import 'package:flutter/material.dart';
import 'package:flutter_show_off/components/MyButtons.dart';
import 'package:flutter_show_off/components/MyDropdown.dart';
import 'package:flutter_show_off/configs/optionList.dart';
import 'package:flutter_show_off/bloc/bloc.dart';
import 'package:flutter_show_off/components/InheritedBloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyFlatButtonWithConfig extends StatefulWidget {
  @override
  _MyFlatButtonWithConfigState createState() => _MyFlatButtonWithConfigState();
}

class _MyFlatButtonWithConfigState extends State<MyFlatButtonWithConfig> {
  TextEditingController _width = TextEditingController(text: "200");
  TextEditingController _radiusTopLeft = TextEditingController(text: "0");
  TextEditingController _radiusTopRight = TextEditingController(text: "0");
  TextEditingController _radiusBottomLeft = TextEditingController(text: "0");
  TextEditingController _radiusBottomRight = TextEditingController(text: "0");

  Color _color, _splashColor, _disabledColor, _textColor, _highlightColor;
  Map<String, dynamic> _colorSelected, _splashColorSelected, _disabledColorSelected, _textColorSelected, _highlightColorSelected;
  EdgeInsetsGeometry _padding;
  bool _disabled;

  @override
  void initState() {
    super.initState();
    // _color = colorList[0]["value"];
    // _colorSelected = colorList[0];
    _splashColor = colorList[0]["value"];
    _splashColorSelected = colorList[0];
    _disabledColor = colorList[0]["value"];
    _disabledColorSelected = colorList[0];
    // _textColor = colorList[0]["value"];
    // _textColorSelected = colorList[0];
    _highlightColor = colorList[0]["value"];
    _highlightColorSelected = colorList[0];
    _disabled = false;
  }

  @override
  Widget build(BuildContext context) {
    final _bloc = InheritedBloc.of(context).bloc;

    return BlocBuilder(
      bloc: _bloc,
      builder: (BuildContext context, InitialShowoffState state) {
        _width.text = state.flatButtonState.width.toString();
        _color = state.flatButtonState.color;
        _colorSelected = colorList.where((e) => e["value"] == _color).toList()[0];
        _textColor = state.flatButtonState.textColor;
        _textColorSelected = colorList.where((e) => e["value"] == _textColor).toList()[0];

        print("rebuild!!!");
        print("_color = $_color");

        return Column(
        children: <Widget>[
          MyFlatButton(
            width: state.flatButtonState.width,
            color: state.flatButtonState.color,
            disabledColor: state.flatButtonState.disabledColor,
            highlightColor: state.flatButtonState.highlightColor,
            onPressed: _disabled ? null : () {},
            padding: state.flatButtonState.padding,
            splashColor: state.flatButtonState.splashColor,
            textColor: state.flatButtonState.textColor,
            borderBottomLeft: state.flatButtonState.borderBottomLeft,
            borderBottomRight: state.flatButtonState.borderBottomRight,
            borderTopLeft: state.flatButtonState.borderTopLeft,
            borderTopRight: state.flatButtonState.borderTopRight,
          ),
          Expanded(
            flex: 1,
            child: ListView(
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              children: <Widget>[
                ListTile(
                  dense: true,
                  title: Text("Width"),
                  trailing: Container(
                    child: TextField(
                      controller: _width,
                      onChanged: (v) {
                        state.flatButtonState.width = double.parse(v);
                        _bloc.inFlatButton.add(state.flatButtonState);
                      },
                      textAlign: TextAlign.end,
                      keyboardType: TextInputType.number,
                    ),
                    width: 205,
                  ),
                ),
                ListTile(
                  dense: true,
                  title: Text("Color"),
                  trailing: MyDropdown(
                    items: colorList,
                    onChanged: (value) {
                      state.flatButtonState.color = value["value"];
                      _bloc.inFlatButton.add(state.flatButtonState);
                      _bloc.dispatch(Actions.getFlatButtonState);
                    },
                    value: _colorSelected,
                    hint: Text("Choose Color"),
                    colorBox: true,
                  ),
                ),
                ListTile(
                  dense: true,
                  title: Text("Text Color"),
                  trailing: MyDropdown(
                    items: colorList,
                    onChanged: (value) {
                      state.flatButtonState.textColor = value["value"];
                      _bloc.inFlatButton.add(state.flatButtonState);
                      _bloc.dispatch(Actions.getFlatButtonState);
                      // setState(() {
                      //   _textColor = value["value"];
                      //   _textColorSelected = value;
                      // });
                    },
                    value: _textColorSelected,
                    hint: Text("Choose Text Color"),
                    colorBox: true,
                  ),
                ),
                ListTile(
                  dense: true,
                  title: Text("Disabled"),
                  trailing: Container(
                    child: Row(
                      children: <Widget>[
                        Text("No"),
                        Switch(
                          value: _disabled,
                          activeColor: Colors.lightGreen,
                          inactiveThumbColor: Colors.red,
                          onChanged: (v) {
                            setState(() {
                              _disabled = v;
                            });
                          },
                        ),
                        Text("Yes")
                      ],
                    ),
                    width: 101.0,
                  ),
                ),
                ListTile(
                  dense: true,
                  title: Text("Disabled Color"),
                  trailing: MyDropdown(
                    items: colorList,
                    onChanged: (value) {
                      setState(() {
                        _disabledColor = value["value"];
                        _disabledColorSelected = value;
                      });
                    },
                    value: _disabledColorSelected,
                    hint: Text("Choose Disabled Color"),
                    colorBox: true,
                  ),
                ),
                ListTile(
                  dense: true,
                  title: Text("Splash Color"),
                  trailing: MyDropdown(
                    items: colorList,
                    onChanged: (value) {
                      setState(() {
                        _splashColor = value["value"];
                        _splashColorSelected = value;
                      });
                    },
                    value: _splashColorSelected,
                    hint: Text("Choose Splash Color"),
                    colorBox: true,
                  ),
                ),
                ListTile(
                  dense: true,
                  title: Text("Highlight Color"),
                  trailing: MyDropdown(
                    items: colorList,
                    onChanged: (value) {
                      setState(() {
                        _highlightColor = value["value"];
                        _highlightColorSelected = value;
                      });
                    },
                    value: _highlightColorSelected,
                    hint: Text("Choose Highlight Color"),
                    colorBox: true,
                  ),
                ),
                ListTile(
                  dense: true,
                  title: Text("Border Top Left"),
                  trailing: Container(
                    child: TextField(
                      controller: _radiusTopLeft,
                      onSubmitted: (v) {
                        setState(() {
                          _radiusTopLeft.text = v;
                        });
                      },
                      textAlign: TextAlign.end,
                      keyboardType: TextInputType.number,
                    ),
                    width: 205,
                  ),
                ),
                ListTile(
                  dense: true,
                  title: Text("Border Top Right"),
                  trailing: Container(
                    child: TextField(
                      controller: _radiusTopRight,
                      onSubmitted: (v) {
                        setState(() {
                          _radiusTopRight.text = v;
                        });
                      },
                      textAlign: TextAlign.end,
                      keyboardType: TextInputType.number,
                    ),
                    width: 205,
                  ),
                ),
                ListTile(
                  dense: true,
                  title: Text("Border Bottom Left"),
                  trailing: Container(
                    child: TextField(
                      controller: _radiusBottomLeft,
                      onSubmitted: (v) {
                        setState(() {
                          _radiusBottomLeft.text = v;
                        });
                      },
                      textAlign: TextAlign.end,
                      keyboardType: TextInputType.number,
                    ),
                    width: 205,
                  ),
                ),
                ListTile(
                  dense: true,
                  title: Text("Border Bottom Right"),
                  trailing: Container(
                    child: TextField(
                      controller: _radiusBottomRight,
                      onSubmitted: (v) {
                        setState(() {
                          _radiusBottomRight.text = v;
                        });
                      },
                      textAlign: TextAlign.end,
                      keyboardType: TextInputType.number,
                    ),
                    width: 205,
                  ),
                ),
              ],
            ),
          ),
        ],
      );
      }
    );
  }
}