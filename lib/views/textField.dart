import 'package:flutter/material.dart';
import 'package:flutter_show_off/configs/optionList.dart';
import 'package:flutter_show_off/components/MyDropdown.dart';

class MyTextField extends StatefulWidget {
  MyTextField({
    Key key,
    this.title
  }) : super(key:key);

  final String title;

  @override
  _MyTextFieldState createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  TextEditingController _textEditingController = TextEditingController(text: "Hello World");
  TextEditingController _widthController = TextEditingController(text: "300");
  TextEditingController _radiusTopLeft = TextEditingController(text: "0");
  TextEditingController _radiusTopRight = TextEditingController(text: "0");
  TextEditingController _radiusBottomLeft = TextEditingController(text: "0");
  TextEditingController _radiusBottomRight = TextEditingController(text: "0");
  TextEditingController _maxLength = TextEditingController(text: "100");
  TextEditingController _prefixText = TextEditingController(text: "");
  TextEditingController _suffixText = TextEditingController(text: "");
  TextEditingController _helperText = TextEditingController(text: "");

  TextStyle _textStyle;
  TextDirection _textDirection = textDirectionList[0]["value"];
  int _maxLines = 999;

  Color _cursorColor = colorList[0]["value"];
  List<Map<String, dynamic>> _colorList = colorList;
  Map<String, dynamic> _cursorColorSelected = colorList[0];
  Color _textColor = colorList[0]["value"];
  Map<String, dynamic> _textColorSelected = colorList[0];

  TextAlign _textAlign = textAlignList[0]["value"];
  // List<Map<String, dynamic>> _textAlignList = textAlignList;
  // Map<String, dynamic> _textAlignSelected = textAlignList[0];

  bool _enabled, _isPassword, _addInputDecoration, _decorationBorder;

  TextInputType _keyboardType = keyboardTypeList[5]["values"];
  List<Map<String, dynamic>> _keyboardTypeList = keyboardTypeList;
  Map<String, dynamic> _keyboardTypeSelected = keyboardTypeList[5];

  String _counterText;

  // Decoration
  List<Map<String, dynamic>> _iconList = iconList;
  IconData _prefixIcon, _suffixIcon, _outsideIcon;
  Map<String, dynamic> _prefixIconSelected, _suffixIconSelected, _outsideIconSelected;
  Color _colorBackground, _colorOutsideIcon, _colorPrefixIcon, _colorSuffixIcon;
  Map<String, dynamic> _colorBackgroundSelected = colorList[0];
  Map<String, dynamic> _colorOutsideIconSelected = colorList[0];
  Map<String, dynamic> _colorPrefixIconSelected = colorList[0];
  Map<String, dynamic> _colorSuffixIconSelected = colorList[0];

  @override
  void initState() {
    super.initState();
    _enabled = true;
    _isPassword = false;
    _addInputDecoration = false;
    _decorationBorder = false;
    _prefixIcon = _iconList[0]["value"];
    _prefixIconSelected = _iconList[0];
    _suffixIcon = _iconList[0]["value"];
    _suffixIconSelected = _iconList[0];
    _outsideIcon = _iconList[0]["value"];
    _outsideIconSelected = _iconList[0];
    _colorBackground = null;
    _colorOutsideIcon = null;
    _colorPrefixIcon = null;
    _colorSuffixIcon = null;
    _counterText = _textEditingController.text.length.toString() + "/" + _maxLength.text;
  }

  @override
  void dispose() {
    super.dispose();
    _textEditingController.dispose();
    _widthController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget _textField = !_addInputDecoration ? TextField(
        style: TextStyle(
          color: _textColor,
        ),
        controller: _textEditingController,
        cursorColor: _cursorColor,
        textAlign: _textAlign,
        onSubmitted: (v) {
          setState(() {
            _textEditingController.text = v;
          });
        },
        enabled: _enabled,
        keyboardType: _keyboardType,
        obscureText: _isPassword,
      ) : TextField(
        style: TextStyle(
          color: _textColor,
        ),
        controller: _textEditingController,
        cursorColor: _cursorColor,
        textAlign: _textAlign,
        onSubmitted: (v) {
          setState(() {
            _textEditingController.text = v;
          });
        },
        onChanged: (v) {
          setState(() {
            _counterText = _textEditingController.text.length.toString() + "/" + _maxLength.text;
          });
        },
        maxLength: int.parse(_maxLength.text),
        enabled: _enabled,
        keyboardType: _keyboardType,
        obscureText: _isPassword,
        decoration: !_addInputDecoration ? null : InputDecoration(
          border: !_decorationBorder ? InputBorder.none : OutlineInputBorder(borderSide: BorderSide(width: 5.0, color: Colors.red, style: BorderStyle.solid,), borderRadius: BorderRadius.only(topLeft: Radius.circular(double.parse(_radiusTopLeft.text)), topRight: Radius.circular(double.parse(_radiusTopRight.text)), bottomLeft: Radius.circular(double.parse(_radiusBottomLeft.text)), bottomRight: Radius.circular(double.parse(_radiusBottomRight.text)))),
          prefixIcon: Icon(_prefixIcon, color: _colorPrefixIcon,),
          suffixIcon: Icon(_suffixIcon, color: _colorSuffixIcon,),
          fillColor: _colorBackground,
          filled: true,
          icon: _outsideIcon != null ? Icon(_outsideIcon, color: _colorOutsideIcon,) : null,
          isDense: true,
          counterText: _counterText,
          labelText: "Type Here",
          labelStyle: TextStyle(fontWeight: FontWeight.bold),
          prefixText: _prefixText.text == "" ? null : _prefixText.text + " ",
          suffixText: _suffixText.text == "" ? null : " " + _suffixText.text,
          enabled: _enabled,
          helperText: _helperText.text == "" ? null : _helperText.text,
        ),
      );

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      resizeToAvoidBottomInset: true,
      body: Column(
        children: <Widget>[
          Container(
            child: Center(
              child: Text(_textEditingController.text,
                style: _textStyle,
                maxLines: _maxLines,
                textAlign: _textAlign,
                textDirection: _textDirection,
              ),
            ),
            height: 50.0,
          ),
          Container(
            child: _textField,
            width: double.parse(_widthController.text),
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Text("Configuration"),
          ),
          // Configuration
          Expanded(
            flex: 1,
            child: ListView(
              shrinkWrap: true,
              physics: BouncingScrollPhysics(parent: ScrollPhysics()),
              children: <Widget>[
                ListTile(
                  dense: true,
                  title: Text("Text Color"),
                  trailing: MyDropdown(
                    items: _colorList,
                    onChanged: (value) {
                      setState(() {
                        _textColor = value["value"];
                        _textColorSelected = value;
                      });
                    },
                    value: _textColorSelected,
                    hint: Text("Choose Text Color"),
                    colorBox: true,
                  ),
                ),
                ListTile(
                  dense: true,
                  title: Text("Cursor Color"),
                  trailing: MyDropdown(
                    items: _colorList,
                    onChanged: (value) {
                      setState(() {
                        _cursorColor = value["value"];
                        _cursorColorSelected = value;
                      });
                    },
                    value: _cursorColorSelected,
                    hint: Text("Choose Cursor Color"),
                    colorBox: true,
                  ),
                ),
                ListTile(
                  dense: true,
                  title: Text("Set Width"),
                  trailing: Container(
                    child: TextField(
                      controller: _widthController,
                      onSubmitted: (v) {
                        setState(() {
                          _widthController.text = v;
                        });
                      },
                      textAlign: TextAlign.end,
                    ),
                    width: 205,
                  ),
                ),
                ListTile(
                  dense: true,
                  title: Text("Enable"),
                  trailing: Container(
                    child: Row(
                      children: <Widget>[
                        Text("No"),
                        Switch(
                          value: _enabled,
                          activeColor: Colors.lightGreen,
                          inactiveThumbColor: Colors.red,
                          onChanged: (v) {
                            setState(() {
                              _enabled = v;
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
                  title: Text("Keyboard Type"),
                  trailing: MyDropdown(
                    items: _keyboardTypeList,
                    onChanged: (value) {
                      setState(() {
                        _keyboardType = value["value"];
                        _keyboardTypeSelected = value;
                      });
                    },
                    value: _keyboardTypeSelected,
                    hint: Text("Choose Keyboard"),
                  ),
                ),
                ListTile(
                  dense: true,
                  title: Text("Secure Text"),
                  trailing: Container(
                    child: Row(
                      children: <Widget>[
                        Text("Visible"),
                        Switch(
                          value: _isPassword,
                          activeColor: Colors.lightGreen,
                          inactiveThumbColor: Colors.red,
                          onChanged: (v) {
                            setState(() {
                              _isPassword = v;
                            });
                          },
                        ),
                        Text("Hide")
                      ],
                    ),
                    width: 130.0,
                  ),
                ),
                ListTile(
                  dense: true,
                  title: Text("Add Decoration"),
                  trailing: Container(
                    child: Row(
                      children: <Widget>[
                        Text("No"),
                        Switch(
                          value: _addInputDecoration,
                          activeColor: Colors.lightGreen,
                          inactiveThumbColor: Colors.red,
                          onChanged: (v) {
                            setState(() {
                              _addInputDecoration = v;
                            });
                          },
                        ),
                        Text("Yes")
                      ],
                    ),
                    width: 130.0,
                  ),
                ),
                ListTile(
                  dense: true,
                  enabled: _addInputDecoration,
                  title: Text("Decoration Border"),
                  trailing: Container(
                    child: Row(
                      children: <Widget>[
                        Text("No"),
                        Switch(
                          value: _decorationBorder,
                          activeColor: Colors.lightGreen,
                          inactiveThumbColor: Colors.red,
                          onChanged: _addInputDecoration ? (v) {
                            setState(() {
                              _decorationBorder = v;
                            });
                          } : null,
                        ),
                        Text("Yes")
                      ],
                    ),
                    width: 130.0,
                  ),
                ),
                ListTile(
                  enabled: _addInputDecoration,
                  dense: true,
                  title: Text("Border Top Left"),
                  trailing: Container(
                    child: TextField(
                      enabled: _addInputDecoration,
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
                  enabled: _addInputDecoration,
                  dense: true,
                  title: Text("Border Top Right"),
                  trailing: Container(
                    child: TextField(
                      enabled: _addInputDecoration,
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
                  enabled: _addInputDecoration,
                  dense: true,
                  title: Text("Border Bottom Left"),
                  trailing: Container(
                    child: TextField(
                      enabled: _addInputDecoration,
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
                  enabled: _addInputDecoration,
                  dense: true,
                  title: Text("Border Bottom Right"),
                  trailing: Container(
                    child: TextField(
                      enabled: _addInputDecoration,
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
                ListTile(
                  enabled: _addInputDecoration,
                  dense: true,
                  title: Text("Outside Icon"),
                  trailing: MyDropdown(
                    disabled: !_addInputDecoration,
                    items: _iconList,
                    onChanged: (value) {
                      setState(() {
                        _outsideIcon = value["value"];
                        _outsideIconSelected = value;
                      });
                    },
                    value: _outsideIconSelected,
                    hint: Text("Choose _colorList"),
                    iconBox: true,
                  ),
                ),
                ListTile(
                  enabled: _addInputDecoration,
                  dense: true,
                  title: Text("Outside Color"),
                  trailing: MyDropdown(
                    disabled: !_addInputDecoration,
                    items: _colorList,
                    onChanged: (value) {
                      setState(() {
                        _colorOutsideIcon = value["value"];
                        _colorOutsideIconSelected = value;
                      });
                    },
                    value: _colorOutsideIconSelected,
                    hint: Text("Choose Outside Color"),
                    colorBox: true,
                  ),
                ),
                ListTile(
                  enabled: _addInputDecoration,
                  dense: true,
                  title: Text("Prefix Icon"),
                  trailing: MyDropdown(
                    disabled: !_addInputDecoration,
                    items: _iconList,
                    onChanged: (value) {
                      setState(() {
                        _prefixIcon = value["value"];
                        _prefixIconSelected = value;
                      });
                    },
                    value: _prefixIconSelected,
                    hint: Text("Choose Prefix Icon"),
                    iconBox: true,
                  ),
                ),
                ListTile(
                  enabled: _addInputDecoration,
                  dense: true,
                  title: Text("Prefix Color"),
                  trailing: MyDropdown(
                    disabled: !_addInputDecoration,
                    items: _colorList,
                    onChanged: (value) {
                      setState(() {
                        _colorPrefixIcon = value["value"];
                        _colorPrefixIconSelected = value;
                      });
                    },
                    value: _colorPrefixIconSelected,
                    hint: Text("Choose Prefix Color"),
                    colorBox: true,
                  ),
                ),
                ListTile(
                  enabled: _addInputDecoration,
                  dense: true,
                  title: Text("Suffix Icon"),
                  trailing: MyDropdown(
                    disabled: !_addInputDecoration,
                    items: _iconList,
                    onChanged: (value) {
                      setState(() {
                        _suffixIcon = value["value"];
                        _suffixIconSelected = value;
                      });
                    },
                    value: _suffixIconSelected,
                    hint: Text("Choose Suffix Icon"),
                    iconBox: true,
                  ),
                ),
                ListTile(
                  enabled: _addInputDecoration,
                  dense: true,
                  title: Text("Suffix Color"),
                  trailing: MyDropdown(
                    disabled: !_addInputDecoration,
                    items: _colorList,
                    onChanged: (value) {
                      setState(() {
                        _colorSuffixIcon = value["value"];
                        _colorSuffixIconSelected = value;
                      });
                    },
                    value: _colorSuffixIconSelected,
                    hint: Text("Choose Suffix Color"),
                    colorBox: true,
                  ),
                ),
                ListTile(
                  enabled: _addInputDecoration,
                  dense: true,
                  title: Text("Bg Color"),
                  trailing: MyDropdown(
                    disabled: !_addInputDecoration,
                    items: _colorList,
                    onChanged: (value) {
                      setState(() {
                        _colorBackground = value["value"];
                        _colorBackgroundSelected = value;
                      });
                    },
                    value: _colorBackgroundSelected,
                    hint: Text("Choose Background Color"),
                    colorBox: true,
                  ),
                ),
                ListTile(
                  enabled: _addInputDecoration,
                  dense: true,
                  title: Text("Prefix Text"),
                  trailing: Container(
                    child: TextField(
                      enabled: _addInputDecoration,
                      controller: _prefixText,
                      onSubmitted: (v) {
                        setState(() {
                          _prefixText.text = v;
                        });
                      },
                      textAlign: TextAlign.start,
                      keyboardType: TextInputType.text,
                    ),
                    width: 205,
                  ),
                ),
                ListTile(
                  enabled: _addInputDecoration,
                  dense: true,
                  title: Text("Suffix Text"),
                  trailing: Container(
                    child: TextField(
                      enabled: _addInputDecoration,
                      controller: _suffixText,
                      onSubmitted: (v) {
                        setState(() {
                          _suffixText.text = v;
                        });
                      },
                      textAlign: TextAlign.start,
                      keyboardType: TextInputType.text,
                    ),
                    width: 205,
                  ),
                ),
                ListTile(
                  enabled: _addInputDecoration,
                  dense: true,
                  title: Text("Helper Text"),
                  trailing: Container(
                    child: TextField(
                      enabled: _addInputDecoration,
                      controller: _helperText,
                      onSubmitted: (v) {
                        setState(() {
                          _helperText.text = v;
                        });
                      },
                      textAlign: TextAlign.start,
                      keyboardType: TextInputType.text,
                    ),
                    width: 205,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}