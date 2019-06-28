import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:mobile/src/ui/screens/welcome_page.dart';
import 'package:mobile/src/ui/widgets/dot_indicator.dart';

class WelcomePageList extends StatefulWidget {
  final Survey survey;
  final List<Map<String, dynamic>> idList;

  const WelcomePageList({Key key, this.survey, this.idList}) : super(key: key);
  @override
  _WelcomePageListState createState() => _WelcomePageListState();
}

class _WelcomePageListState extends State<WelcomePageList>
    with SingleTickerProviderStateMixin {
  PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    List<Widget> _getPageChildren = [
      if (widget.idList != null && widget.idList.isNotEmpty)
        SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: widget.idList.map((id) {
              String text = "";
              id.forEach((k, v) {
                text += "$k ==> $v\n";
              });
              return Text(
                text,
                style: Theme.of(context).textTheme.title,
              );
            }).toList(),
          ),
        ),
      for (var i = 0; i < widget.survey.welcomeScreens.length; i++)
        WelcomePage(data: widget.survey.welcomeScreens[i]),
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.survey.title),
      ),
      body: Stack(
        children: <Widget>[
          PageView(
            controller: _pageController,
            children: _getPageChildren,
          ),
          SafeArea(
            child: Container(
              margin: EdgeInsets.only(bottom: 15),
              padding: const EdgeInsets.all(20.0),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: DotsIndicator(
                  color:
                      _getPageChildren.length == 1 ? Colors.white : Colors.grey,
                  controller: _pageController,
                  itemCount: _getPageChildren.length,
                  onPageSelected: (int page) {
                    _pageController.animateToPage(
                      page,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.ease,
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
