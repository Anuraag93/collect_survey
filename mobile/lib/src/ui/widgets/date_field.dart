import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateField extends StatefulWidget {
  final Field field;
  final ValueChanged<String> onChanged;

  const DateField({Key key, @required this.field, this.onChanged})
      : super(key: key);
  @override
  _DateFieldState createState() => _DateFieldState();
}

class _DateFieldState extends State<DateField> {
  String _date = "";
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
            child: Text(_date),
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
      initialDate: DateTime.now(),
      firstDate: DateTime(DateTime.now().year - 1),
      lastDate: DateTime(DateTime.now().year + 1),
    );
    if (picked != null) {
      print("picked => $picked");
      String format = widget.field.properties?.structure ?? "dd/MM/yyyy";
      setState(() {
        _date = DateFormat(format).format(picked);
      });
    }
  }
}
