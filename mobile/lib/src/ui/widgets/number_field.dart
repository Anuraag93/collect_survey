import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:quiver/strings.dart';

class NumberField extends StatefulWidget {
  final Field field;
  final ValueChanged<int> onChanged;

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
          onChanged: (value) {
            int v;
            if (!isBlank(value)) {
              v = int.parse(value);
            }
            widget.onChanged(v);
          },
          decoration: InputDecoration(border: OutlineInputBorder()),
          keyboardType: TextInputType.number,
        ),
        SizedBox(height: 15),
      ],
    );
  }
}
