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
  YesNo _selected;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text(widget.field.title),
        SizedBox(height: 10),
        Row(mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _custonButton(
                label: YesNo.yes,
                onTap: () {
                  setState(() {
                    _selected = YesNo.yes;
                    widget.onChanged(_selected);
                  });
                }),
            SizedBox(width: 20),
            _custonButton(
                label: YesNo.no,
                onTap: () {
                  setState(() {
                    _selected = YesNo.no;
                    widget.onChanged(_selected);
                  });
                }),
          ],
        ),
        SizedBox(height: 15),
      ],
    );
  }

  Widget _custonButton({YesNo label, VoidCallback onTap}) {
    final theme = Theme.of(context);
    String text;
    if (label == YesNo.yes) {
      text = "YES";
    } else {
      text = "NO";
    }
    if (label == _selected) {
      return RaisedButton(
        color: theme.primaryColor,
        child: Text(text),
        textColor: Colors.white,
        onPressed: onTap,
      );
    } else {
      return OutlineButton(
        color: theme.primaryColor,
        child: Text(text),
        onPressed: onTap,
      );
    }
  }
}
