import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class RatingField extends StatefulWidget {
  final Field field;
  final ValueChanged<double> onChanged;

  const RatingField({Key key, @required this.field, this.onChanged})
      : super(key: key);
  @override
  _RatingFieldState createState() => _RatingFieldState();
}

class _RatingFieldState extends State<RatingField> {
  double _rating = 0.0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text(widget.field.title),
        SizedBox(height: 10),
        SmoothStarRating(
          allowHalfRating: false,
          rating: _rating,
          starCount: widget.field.properties?.steps ?? 1,
          size: 40,
          onRatingChanged: (value) {
            setState(() {
              _rating = value;
              widget.onChanged(value);
            });
          },
          color: theme.primaryColor,
          borderColor: theme.primaryColor.withOpacity(0.3),
        ),
        SizedBox(height: 15),
      ],
    );
  }
}
