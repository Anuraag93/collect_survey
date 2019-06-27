import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:mobile/src/ui/screens/load_survey_page.dart';
import 'package:mobile/src/ui/screens/welcome_page.dart';

class WelcomePageList extends StatefulWidget {
  final Survey survey;

  const WelcomePageList({Key key, this.survey}) : super(key: key);
  @override
  _WelcomePageListState createState() => _WelcomePageListState();
}

class _WelcomePageListState extends State<WelcomePageList>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(
      vsync: this,
      length: widget.survey?.welcomeScreens?.length ?? 0,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.survey.title),
      ),
      body: TabBarView(
        controller: _tabController,
        children: widget.survey.welcomeScreens.map((w) {
          return WelcomePage(
            title: w.title,
            description: w.properties.description,
            buttonText: w.properties.buttonText,
            showButton: w.properties.showButton,
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => LoadSurveyPage()));
            },
          );
        }).toList(),
      ),
    );
  }
}
