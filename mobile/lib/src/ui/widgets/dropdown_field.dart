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
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text(widget.field.title),
        SizedBox(height: 10),
        TextField(
          decoration: InputDecoration(border: OutlineInputBorder()),
        ),
        SizedBox(height: 15),
      ],
    );
  }
}
