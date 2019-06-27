import 'package:core/core.dart';
import 'package:flutter/material.dart';

class ShortTextField extends StatefulWidget {
  final Field field;
  final ValueChanged<String> onChanged;

  const ShortTextField({Key key, @required this.field, this.onChanged})
      : super(key: key);
  @override
  _ShortTextFieldState createState() => _ShortTextFieldState();
}

class _ShortTextFieldState extends State<ShortTextField> {
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
          keyboardType: TextInputType.text,
        ),
        SizedBox(height: 15),
      ],
    );
  }
}
