import 'package:core/core.dart';
import 'package:flutter/material.dart';

class PhoneNumberField extends StatefulWidget {
  final Field field;
  final ValueChanged<String> onChanged;

  const PhoneNumberField({Key key, @required this.field, this.onChanged})
      : super(key: key);
  @override
  _PhoneNumberFieldState createState() => _PhoneNumberFieldState();
}

class _PhoneNumberFieldState extends State<PhoneNumberField> {
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
