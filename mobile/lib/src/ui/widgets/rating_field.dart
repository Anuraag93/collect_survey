import 'package:core/core.dart';
import 'package:flutter/material.dart';

class RatingField extends StatefulWidget {
  final Field field;
  final ValueChanged<double> onChanged;

  const RatingField({Key key, @required this.field, this.onChanged})
      : super(key: key);
  @override
  _RatingFieldState createState() => _RatingFieldState();
}

class _RatingFieldState extends State<RatingField> {
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
