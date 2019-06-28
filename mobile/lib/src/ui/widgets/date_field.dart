import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:quiver/strings.dart';

class DateField extends StatefulWidget {
  final Field field;
  final ValueChanged<String> onChanged;

  const DateField({Key key, @required this.field, this.onChanged})
      : super(key: key);
  @override
  _DateFieldState createState() => _DateFieldState();
}

class _DateFieldState extends State<DateField> {
  String _dateString = "";
  DateTime _date = DateTime.now();
  String _format;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text(widget.field.title),
        SizedBox(height: 10),
        InkWell(
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            decoration: BoxDecoration(
                border: Border.all(width: 0.5),
                borderRadius: BorderRadius.circular(3)),
            child: Text(_dateString),
          ),
          onTap: _selectDate,
        ),
        SizedBox(height: 15),
      ],
    );
  }

  void _selectDate() async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: _date ?? DateTime.now(),
      firstDate: DateTime(DateTime.now().year - 1),
      lastDate: DateTime(DateTime.now().year + 1),
    );
    if (picked != null) {
      // print("picked => $picked");
      if (_format == null) {
        if (widget.field.properties?.structure == null) {
          _format = "dd/MM/yyyy";
        } else {
          var structure = widget.field.properties?.structure?.split("") ?? [];
          var seperator = widget.field.properties?.separator ?? "";
          String preChar;
          _format = "";
          structure.forEach((f) {
            if (preChar == null) {
              preChar = f;
            } else if (preChar != f) {
              preChar = f;
              _format += seperator;
            }
            if (f == "D" || f == "Y") {
              _format += f.toLowerCase();
            } else {
              _format += f;
            }
          });
        }
      }

      setState(() {
        _date = picked;
        _dateString = DateFormat(_format).format(picked);
        print("$_format ==> $_dateString");
        widget.onChanged(_dateString);
      });
    }
  }
}
