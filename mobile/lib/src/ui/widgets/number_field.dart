import 'package:core/core.dart';
import 'package:flutter/material.dart';

class NumberField extends StatefulWidget {
  final Field field;
  final ValueChanged<String> onChanged;

  const NumberField({Key key, @required this.field, this.onChanged})
      : super(key: key);
  @override
  _NumberFieldState createState() => _NumberFieldState();
}

class _NumberFieldState extends State<NumberField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text(widget.field.title),
        SizedBox(height: 10),
        TextField(
          onChanged: widget.onChanged,
          decoration: InputDecoration(border: OutlineInputBorder()),
        ),
        SizedBox(height: 15),
      ],
    );
  }
}
