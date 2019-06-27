import 'package:core/core.dart';
import 'package:flutter/material.dart';

class EmailField extends StatefulWidget {
  final Field field;
  final ValueChanged<String> onChanged;

  const EmailField({Key key, @required this.field, this.onChanged})
      : super(key: key);
  @override
  _EmailFieldState createState() => _EmailFieldState();
}

class _EmailFieldState extends State<EmailField> {
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
          keyboardType: TextInputType.emailAddress,
        ),
        SizedBox(height: 15),
      ],
    );
  }
}
