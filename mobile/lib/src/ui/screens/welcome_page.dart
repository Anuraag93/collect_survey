import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:mobile/src/ui/screens/load_survey_page.dart';

class WelcomePage extends StatelessWidget {
  final VoidCallback onPressed;
  final WelcomeScreen data;

  const WelcomePage({Key key, this.onPressed, this.data}) : super(key: key);
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
              data.title ?? "",
              style: theme.textTheme.title,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 50),
            Text(
              data.properties.description ?? "",
              style: theme.textTheme.subhead,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            if (data.properties.showButton ?? false)
              RaisedButton(
                child: Text(data.properties.buttonText ?? ""),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => LoadSurveyPage()));
                },
              )
          ],
        ),
      ),
    );
  }
}
