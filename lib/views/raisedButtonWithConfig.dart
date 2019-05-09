import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_show_off/bloc/bloc.dart';
import 'package:flutter_show_off/components/MyButtons.dart';
import 'package:flutter_show_off/components/MyDropdown.dart';
import 'package:flutter_show_off/components/MySeparators.dart';
import 'package:flutter_show_off/components/MyTextField.dart';
import 'package:flutter_show_off/configs/optionList.dart';

class MyRaisedButtonWithConfig extends StatefulWidget {
  @override
  _MyRaisedButtonWithConfigState createState() => _MyRaisedButtonWithConfigState();
}

class _MyRaisedButtonWithConfigState extends State<MyRaisedButtonWithConfig> {
  Map<String, dynamic> _colorSelected, _splashColorSelected, _disabledColorSelected, _textColorSelected, _highlightColorSelected, _disabledTextColorSelected, _borderRadiusType;
  List<Widget> _filterRadius;

  @override
  void initState() {
    super.initState();
    _colorSelected = colorList[0];
    _textColorSelected = colorList[0];
    _splashColorSelected = colorList[0];
    _disabledColorSelected = colorList[0];
    _disabledTextColorSelected = colorList[0];
    _highlightColorSelected = colorList[0];
    _borderRadiusType = borderRadiusType[0];
    _filterRadius = [];
  }

  Map<String, dynamic> getColorSelected(Color color) {
    var res = colorList.where((e) => e["value"] == color).toList();
    return res[0];
  }

  Map<String, dynamic> getRadiusType(String type) {
    var res = borderRadiusType.where((e) => e["value"] == type).toList();
    return res[0];
  }

  @override
  Widget build(BuildContext context) {
    var _bloc = BlocProvider.of<RaisedButtonBloc>(context);

    return StreamBuilder(
      stream: _bloc.outRaisedButton,
      initialData: _bloc.currentState,
      builder: (BuildContext context, AsyncSnapshot<RaisedButtonState> state){
        _colorSelected = getColorSelected(state.data.color);
        _textColorSelected = getColorSelected(state.data.titleColor);
        _splashColorSelected = getColorSelected(state.data.splashColor);
        _disabledColorSelected = getColorSelected(state.data.disabledColor);
        _disabledTextColorSelected = getColorSelected(state.data.disabledTextColor);
        _highlightColorSelected = getColorSelected(state.data.highlightColor);
        _borderRadiusType = getRadiusType(state.data.borderRadiusType);

        _filterRadius.clear();

        switch (state.data.borderRadiusType) {
          case "all" :
            _filterRadius.add(
              ListTile(
                dense: true,
                title: Text("Set Radius"),
                trailing: Container(
                  child: TextFieldFixCursorSelection(
                    textInputType: TextInputType.number,
                    value: state.data.radiusAll.toStringAsFixed(0),
                    onChanged: (v) {
                      _bloc.currentState.radiusAll = double.parse(v);  
                      _bloc.dispatch(RaisedButtonAction(raisedButtonState: _bloc.currentState));
                    },
                  ),
                  width: 205,
                ),
              ),
            );
            break;
          case "circular":
            _filterRadius.add(
              ListTile(
                dense: true,
                title: Text("Set Radius"),
                trailing: Container(
                  child: TextFieldFixCursorSelection(
                    textInputType: TextInputType.number,
                    value: state.data.radiusCircular.toStringAsFixed(0),
                    onChanged: (v) {
                      _bloc.currentState.radiusCircular = double.parse(v);  
                      _bloc.dispatch(RaisedButtonAction(raisedButtonState: _bloc.currentState));
                    },
                  ),
                  width: 205,
                ),
              ),
            );
            break;
          case "horizontal":
            _filterRadius.addAll([
              ListTile(
                dense: true,
                title: Text("Set Left Radius"),
                trailing: Container(
                  child: TextFieldFixCursorSelection(
                    textInputType: TextInputType.number,
                    value: state.data.radiusHorLeft.toStringAsFixed(0),
                    onChanged: (v) {
                      _bloc.currentState.radiusHorLeft = double.parse(v);  
                      _bloc.dispatch(RaisedButtonAction(raisedButtonState: _bloc.currentState));
                    },
                  ),
                  width: 205,
                ),
              ),
              ListTile(
                dense: true,
                title: Text("Set Right Radius"),
                trailing: Container(
                  child: TextFieldFixCursorSelection(
                    textInputType: TextInputType.number,
                    value: state.data.radiusHorRight.toStringAsFixed(0),
                    onChanged: (v) {
                      _bloc.currentState.radiusHorRight = double.parse(v);  
                      _bloc.dispatch(RaisedButtonAction(raisedButtonState: _bloc.currentState));
                    },
                  ),
                  width: 205,
                ),
              ),
            ]);
            break;
          case "vertical":
            _filterRadius.addAll([
              ListTile(
                dense: true,
                title: Text("Set Top Radius"),
                trailing: Container(
                  child: TextFieldFixCursorSelection(
                    textInputType: TextInputType.number,
                    value: state.data.radiusVerTop.toStringAsFixed(0),
                    onChanged: (v) {
                      _bloc.currentState.radiusVerTop = double.parse(v);  
                      _bloc.dispatch(RaisedButtonAction(raisedButtonState: _bloc.currentState));
                    },
                  ),
                  width: 205,
                ),
              ),
              ListTile(
                dense: true,
                title: Text("Set Bottom Radius"),
                trailing: Container(
                  child: TextFieldFixCursorSelection(
                    textInputType: TextInputType.number,
                    value: state.data.radiusVerBottom.toStringAsFixed(0),
                    onChanged: (v) {
                      _bloc.currentState.radiusVerBottom = double.parse(v);  
                      _bloc.dispatch(RaisedButtonAction(raisedButtonState: _bloc.currentState));
                    },
                  ),
                  width: 205,
                ),
              ),
            ]);
            break;
          case "only":
            _filterRadius.addAll([
              ListTile(
                dense: true,
                title: Text("Set TopLeft Radius"),
                trailing: Container(
                  child: TextFieldFixCursorSelection(
                    textInputType: TextInputType.number,
                    value: state.data.radiusOnlyTopLeft.toStringAsFixed(0),
                    onChanged: (v) {
                      _bloc.currentState.radiusOnlyTopLeft = double.parse(v);  
                      _bloc.dispatch(RaisedButtonAction(raisedButtonState: _bloc.currentState));
                    },
                  ),
                  width: 205,
                ),
              ),
              ListTile(
                dense: true,
                title: Text("Set TopRight Radius"),
                trailing: Container(
                  child: TextFieldFixCursorSelection(
                    textInputType: TextInputType.number,
                    value: state.data.radiusOnlyTopRight.toStringAsFixed(0),
                    onChanged: (v) {
                      _bloc.currentState.radiusOnlyTopRight = double.parse(v);  
                      _bloc.dispatch(RaisedButtonAction(raisedButtonState: _bloc.currentState));
                    },
                  ),
                  width: 205,
                ),
              ),
              ListTile(
                dense: true,
                title: Text("Set BottomLeft Radius"),
                trailing: Container(
                  child: TextFieldFixCursorSelection(
                    textInputType: TextInputType.number,
                    value: state.data.radiusOnlyBottomLeft.toStringAsFixed(0),
                    onChanged: (v) {
                      _bloc.currentState.radiusOnlyBottomLeft = double.parse(v);  
                      _bloc.dispatch(RaisedButtonAction(raisedButtonState: _bloc.currentState));
                    },
                  ),
                  width: 205,
                ),
              ),
              ListTile(
                dense: true,
                title: Text("Set BottomRight Radius"),
                trailing: Container(
                  child: TextFieldFixCursorSelection(
                    textInputType: TextInputType.number,
                    value: state.data.radiusOnlyBottomRight.toStringAsFixed(0),
                    onChanged: (v) {
                      _bloc.currentState.radiusOnlyBottomRight = double.parse(v);  
                      _bloc.dispatch(RaisedButtonAction(raisedButtonState: _bloc.currentState));
                    },
                  ),
                  width: 205,
                ),
              ),
            ]);
            break;
          default: 
            _filterRadius.clear();
        }

        return Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 10.0, bottom: 5.0),
              child: MyRaisedButton(
                borderRadiusType: state.data.borderRadiusType,
                color: state.data.color,
                disabledColor: state.data.disabledColor,
                disabledTextColor: state.data.disabledTextColor,
                duration: state.data.duration,
                height: state.data.height,
                highlightColor: state.data.highlightColor,
                onPressed: state.data.disabled ? null : () {},
                padding: state.data.padding,
                radiusAll: state.data.radiusAll,
                radiusCircular: state.data.radiusCircular,
                radiusHorLeft: state.data.radiusHorLeft,
                radiusHorRight: state.data.radiusHorRight,
                radiusOnlyBottomLeft: state.data.radiusOnlyBottomLeft,
                radiusOnlyBottomRight: state.data.radiusOnlyBottomRight,
                radiusOnlyTopLeft: state.data.radiusOnlyTopLeft,
                radiusOnlyTopRight: state.data.radiusOnlyTopRight,
                radiusVerBottom: state.data.radiusVerBottom,
                radiusVerTop: state.data.radiusVerTop,
                splashColor: state.data.splashColor,
                title: state.data.title,
                titleColor: state.data.titleColor,
                width: state.data.width,
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
                    title: Text("Animation Duration"),
                    trailing: Container(
                      child: TextFieldFixCursorSelection(
                        textInputType: TextInputType.number,
                        value: state.data.duration.toStringAsFixed(0),
                        onChanged: (v) {
                          _bloc.currentState.duration = int.parse(v);  
                          _bloc.dispatch(RaisedButtonAction(raisedButtonState: _bloc.currentState));
                        },
                        suffixText: " ms",
                      ),
                      width: 205,
                    ),
                  ),
                  ListTile(
                    dense: true,
                    title: Text("Width"),
                    trailing: Container(
                      child: TextFieldFixCursorSelection(
                        textInputType: TextInputType.number,
                        value: state.data.width.toStringAsFixed(0),
                        onChanged: (v) {
                          _bloc.currentState.width = double.parse(v);  
                          _bloc.dispatch(RaisedButtonAction(raisedButtonState: _bloc.currentState));
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
                          _bloc.dispatch(RaisedButtonAction(raisedButtonState: _bloc.currentState));
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
                          _bloc.dispatch(RaisedButtonAction(raisedButtonState: _bloc.currentState));
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
                        _bloc.currentState.titleColor = value["value"];
                        _bloc.dispatch(RaisedButtonAction(raisedButtonState: _bloc.currentState));
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
                              _bloc.dispatch(RaisedButtonAction(raisedButtonState: _bloc.currentState));
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
                        _bloc.dispatch(RaisedButtonAction(raisedButtonState: _bloc.currentState));
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
                        _bloc.dispatch(RaisedButtonAction(raisedButtonState: _bloc.currentState));
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
                        _bloc.dispatch(RaisedButtonAction(raisedButtonState: _bloc.currentState));
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
                        _bloc.dispatch(RaisedButtonAction(raisedButtonState: _bloc.currentState));
                        _highlightColorSelected = colorList.where((e) => e["value"] == value["value"]).toList()[0];
                      },
                      value: _highlightColorSelected,
                      hint: Text("Choose Highlight Color"),
                      colorBox: true,
                    ),
                  ),
                  ListTile(
                    dense: true,
                    title: Text("Radius Type"),
                    trailing: MyDropdown(
                      items: borderRadiusType,
                      onChanged: (value) {
                        _bloc.currentState.borderRadiusType = value["value"];
                        _bloc.dispatch(RaisedButtonAction(raisedButtonState: _bloc.currentState));
                        _borderRadiusType = colorList.where((e) => e["value"] == value["value"]).toList()[0];
                      },
                      value: _borderRadiusType,
                      hint: Text("Choose Radius Type"),
                    ),
                  ),
                  ..._filterRadius
                ],
              ),
            )
          ],
        );
      },
    );
  }
}