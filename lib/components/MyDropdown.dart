import 'package:flutter/material.dart';

class MyDropdown extends StatelessWidget {
  MyDropdown({
    @required this.items,
    @required this.onChanged,
    this.hint,
    this.isDense = true,
    @required this.value,
    this.width = 150.0,
    this.colorBox = false,
    this.iconBox = false,
    this.disabled = false
  });

  final List<Map<String, dynamic>> items;
  final void Function(dynamic value) onChanged;
  final Widget hint;
  final bool isDense, colorBox, iconBox, disabled;
  final Map<String, dynamic> value;
  final double width;

  @override
  Widget build(BuildContext context) {
    // List<Widget> widgetItems(bool colorbox, Map<String, dynamic> value) {
    //   List<Widget> defaultWidgets = [
    //     Padding(padding: EdgeInsets.all(10.0),),
    //     Text(value["label"])
    //   ];

    //   if (colorbox) {
    //     defaultWidgets.insert(0, Container(
    //         color: value["value"],
    //         height: 20.0,
    //         width: 20.0,
    //       )
    //     );
    //   }

    //   return defaultWidgets;
    // }

    return Container(
      width: 205,
      child: DropdownButton(
        isExpanded: true,
        items: items.map((Map<String, dynamic> value) {
          return DropdownMenuItem(
            child: Row(
              children: <Widget>[
                colorBox ? Container(
                  color: value["value"],
                  height: 20.0,
                  width: 20.0,
                ) : iconBox ? Icon(value["value"]) : Container(),
                Padding(padding: EdgeInsets.all(10.0),),
                Text(value["label"])
              ],
            ),
            value: value,
          );
        }).toList(),
        onChanged: disabled ? null : onChanged,
        hint: hint,
        isDense: isDense,
        value: value,
      ),
    );
  }
}