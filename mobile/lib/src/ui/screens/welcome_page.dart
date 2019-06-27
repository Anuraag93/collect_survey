import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  final String title;
  final String description;
  final String buttonText;
  final bool showButton;
  final VoidCallback onPressed;

  const WelcomePage(
      {Key key,
      this.title = "",
      this.description = "",
      this.buttonText = "",
      this.showButton = false,
      this.onPressed})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              title,
              style: theme.textTheme.title,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 50),
            Text(
              description,
              style: theme.textTheme.subhead,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            if (showButton)
              RaisedButton(
                child: Text(buttonText),
                onPressed: onPressed,
              )
          ],
        ),
      ),
    );
  }
}
