import 'package:flutter/material.dart';
import 'package:flutter_show_off/components/MyButtons.dart';
import 'package:flutter_show_off/components/MyDropdown.dart';
import 'package:flutter_show_off/components/MySeparators.dart';
import 'package:flutter_show_off/configs/optionList.dart';
import 'package:flutter_show_off/bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_show_off/components/MyTextField.dart';

class MyFlatButtonWithConfig extends StatefulWidget {
  @override
  _MyFlatButtonWithConfigState createState() => _MyFlatButtonWithConfigState();
}

class _MyFlatButtonWithConfigState extends State<MyFlatButtonWithConfig> {
  Map<String, dynamic> _colorSelected, _splashColorSelected, _disabledColorSelected, _textColorSelected, _highlightColorSelected, _disabledTextColorSelected;

  @override
  void initState() {
    super.initState();
    _colorSelected = colorList[0];
    _splashColorSelected = colorList[0];
    _disabledColorSelected = colorList[0];
    _disabledTextColorSelected = colorList[0];
    _highlightColorSelected = colorList[0];
  }

  Map<String, dynamic> getColorSelected(Color color) {
    var res = colorList.where((e) => e["value"] == color).toList();
    return res[0];
  }

  @override
  Widget build(BuildContext context) {
    final _bloc = BlocProvider.of<FlatButtonBloc>(context);

    return StreamBuilder(
      stream: _bloc.outFlatButton,
      initialData: _bloc.currentState,
      builder: (BuildContext context, AsyncSnapshot<FlatButtonState> state) {
        _colorSelected = getColorSelected(state.data.color);
        _textColorSelected = getColorSelected(state.data.textColor);
        _splashColorSelected = getColorSelected(state.data.splashColor);
        _disabledColorSelected = getColorSelected(state.data.disabledColor);
        _disabledTextColorSelected = getColorSelected(state.data.disabledTextColor);
        _highlightColorSelected = getColorSelected(state.data.highlightColor);

        return Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 10.0, bottom: 5.0),
              child: MyFlatButton(
                height: state.data.height,
                width: state.data.width,
                color: state.data.color,
                disabledColor: state.data.disabledColor,
                disabledTextColor: state.data.disabledTextColor,
                highlightColor: state.data.highlightColor,
                onPressed: state.data.disabled ? null : () {},
                padding: state.data.padding,
                splashColor: state.data.splashColor,
                textColor: state.data.textColor,
                borderBottomLeft: state.data.borderBottomLeft,
                borderBottomRight: state.data.borderBottomRight,
                borderTopLeft: state.data.borderTopLeft,
                borderTopRight: state.data.borderTopRight,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 10.0),
              child: MySimpleSeparator(height: 3.0),
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
                      child: TextFieldFixCursorSelection(
                        textInputType: TextInputType.number,
                        value: state.data.width.toStringAsFixed(0),
                        onChanged: (v) {
                          _bloc.currentState.width = double.parse(v);  
                          _bloc.dispatch(FlatButtonAction(flatButtonState: _bloc.currentState));
                        },
                      ),
                      width: 205,
                    ),
                  ),
                  ListTile(
                    dense: true,
                    title: Text("Height"),
                    trailing: Container(
                      child: TextFieldFixCursorSelection(
                        textInputType: TextInputType.number,
                        value: state.data.height.toStringAsFixed(0),
                        onChanged: (v) {
                          double.parse(v) > 250.0 ? _bloc.currentState.height = 250.0 : _bloc.currentState.height = double.parse(v);
                          _bloc.dispatch(FlatButtonAction(flatButtonState: _bloc.currentState));
                        },
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
                        _bloc.currentState.color = value["value"];
                        _bloc.dispatch(FlatButtonAction(flatButtonState: _bloc.currentState));
                        _colorSelected = colorList.where((e) => e["value"] == value["value"]).toList()[0];
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
                        _bloc.currentState.textColor = value["value"];
                        _bloc.dispatch(FlatButtonAction(flatButtonState: _bloc.currentState));
                        _textColorSelected = colorList.where((e) => e["value"] == value["value"]).toList()[0];
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
                            value: _bloc.currentState.disabled,
                            activeColor: Colors.lightGreen,
                            inactiveThumbColor: Colors.red,
                            onChanged: (v) {
                              _bloc.currentState.disabled = v;
                              _bloc.dispatch(FlatButtonAction(flatButtonState: _bloc.currentState));
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
                    enabled: _bloc.currentState.disabled,
                    trailing: MyDropdown(
                      items: colorList,
                      onChanged: !_bloc.currentState.disabled ? null : (value) {
                        _bloc.currentState.disabledColor = value["value"];
                        _bloc.dispatch(FlatButtonAction(flatButtonState: _bloc.currentState));
                        _disabledColorSelected = colorList.where((e) => e["value"] == value["value"]).toList()[0];
                      },
                      value: _disabledColorSelected,
                      hint: Text("Choose Color"),
                      colorBox: true,
                    ),
                  ),
                  ListTile(
                    dense: true,
                    title: Text("Disabled Text Color"),
                    enabled: _bloc.currentState.disabled,
                    trailing: MyDropdown(
                      items: colorList,
                      onChanged: !_bloc.currentState.disabled ? null : (value) {
                        _bloc.currentState.disabledTextColor = value["value"];
                        _bloc.dispatch(FlatButtonAction(flatButtonState: _bloc.currentState));
                        _disabledTextColorSelected = colorList.where((e) => e["value"] == value["value"]).toList()[0];
                      },
                      value: _disabledTextColorSelected,
                      hint: Text("Choose Color"),
                      colorBox: true,
                    ),
                  ),
                  ListTile(
                    dense: true,
                    title: Text("Splash Color"),
                    trailing: MyDropdown(
                      items: colorList,
                      onChanged: (value) {
                        _bloc.currentState.splashColor = value["value"];
                        _bloc.dispatch(FlatButtonAction(flatButtonState: _bloc.currentState));
                        _splashColorSelected = colorList.where((e) => e["value"] == value["value"]).toList()[0];
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
                        _bloc.currentState.highlightColor = value["value"];
                        _bloc.dispatch(FlatButtonAction(flatButtonState: _bloc.currentState));
                        _highlightColorSelected = colorList.where((e) => e["value"] == value["value"]).toList()[0];
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
                      child: TextFieldFixCursorSelection(
                        textInputType: TextInputType.number,
                        value: state.data.borderTopLeft.toStringAsFixed(0),
                        onChanged: (v) {
                          _bloc.currentState.borderTopLeft = double.parse(v);  
                          _bloc.dispatch(FlatButtonAction(flatButtonState: _bloc.currentState));
                        },
                      ),
                      width: 205,
                    ),
                  ),
                  ListTile(
                    dense: true,
                    title: Text("Border Top Right"),
                    trailing: Container(
                      child: TextFieldFixCursorSelection(
                        textInputType: TextInputType.number,
                        value: state.data.borderTopRight.toStringAsFixed(0),
                        onChanged: (v) {
                          _bloc.currentState.borderTopRight = double.parse(v);  
                          _bloc.dispatch(FlatButtonAction(flatButtonState: _bloc.currentState));
                        },
                      ),
                      width: 205,
                    ),
                  ),
                  ListTile(
                    dense: true,
                    title: Text("Border Bottom Left"),
                    trailing: Container(
                      child: TextFieldFixCursorSelection(
                        textInputType: TextInputType.number,
                        value: state.data.borderBottomLeft.toStringAsFixed(0),
                        onChanged: (v) {
                          _bloc.currentState.borderBottomLeft = double.parse(v);  
                          _bloc.dispatch(FlatButtonAction(flatButtonState: _bloc.currentState));
                        },
                      ),
                      width: 205,
                    ),
                  ),
                  ListTile(
                    dense: true,
                    title: Text("Border Bottom Right"),
                    trailing: Container(
                      child: TextFieldFixCursorSelection(
                        textInputType: TextInputType.number,
                        value: state.data.borderBottomRight.toStringAsFixed(0),
                        onChanged: (v) {
                          _bloc.currentState.borderBottomRight = double.parse(v);  
                          _bloc.dispatch(FlatButtonAction(flatButtonState: _bloc.currentState));
                        },
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