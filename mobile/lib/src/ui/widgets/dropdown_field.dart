import 'package:core/core.dart';
import 'package:flutter/material.dart';

class DropdownField extends StatefulWidget {
  final Field field;
  final ValueChanged<String> onChanged;

  const DropdownField({Key key, @required this.field, this.onChanged})
      : super(key: key);
  @override
  _DropdownFieldState createState() => _DropdownFieldState();
}

class _DropdownFieldState extends State<DropdownField> {
  String _dropdownValue;
  List<String> choices = [];
  @override
  void initState() {
    choices =
        widget.field.properties?.choices?.map((c) => c.label)?.toList() ?? [];

    // print("choices => $choices");
    if (widget.field.properties?.alphabeticalOrder ?? true) {
      choices.sort();
      // print("sorted choices => $choices");
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<DropdownMenuItem> items = choices.map((c) {
      return DropdownMenuItem(
        value: c,
        child: Text(c),
      );
    }).toList();

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text(widget.field.title),
        SizedBox(height: 10),
        DropdownButton(
          isExpanded: true,
          value: _dropdownValue,
          items: items,
          onChanged: (value) {
            setState(() {
              _dropdownValue = value;
              widget.onChanged(value);
            });
          },
        ),
        SizedBox(height: 15),
      ],
    );
  }
}
