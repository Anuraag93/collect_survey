import 'package:core/core.dart';
import 'package:flutter/material.dart';

enum YesNo { unknown, yes, no }

class YesNoField extends StatefulWidget {
  final Field field;
  final ValueChanged<YesNo> onChanged;

  const YesNoField({Key key, @required this.field, this.onChanged})
      : super(key: key);
  @override
  _YesNoFieldState createState() => _YesNoFieldState();
}

class _YesNoFieldState extends State<YesNoField> {
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
