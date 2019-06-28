import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/src/ui/screens/thankyou_page.dart';

class ThankyouPageList extends StatefulWidget {
  @override
  _ThankyouPageListState createState() => _ThankyouPageListState();
}

class _ThankyouPageListState extends State<ThankyouPageList> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  SurveyBloc _bloc;
  PageController _pageController;
  @override
  void initState() {
    _pageController = PageController(viewportFraction: 0.8);
    _bloc = BlocProvider.of<SurveyBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: _bloc,
      builder: (BuildContext context, SurveyState state) {
        if (state is SurveyAdded) {
          final screens = state.survey.thankyouScreens;
          return Scaffold(
            key: _scaffoldKey,
            appBar: AppBar(),
            body: PageView.builder(
              controller: _pageController,
              physics: BouncingScrollPhysics(),
              itemCount: screens.length,
              itemBuilder: (BuildContext context, int index) {
                return ThankyouPage(
                    content: screens[index], scaffoldKey: _scaffoldKey);
              },
            ),
          );
        } else {
          return Scaffold(
            appBar: AppBar(),
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}
