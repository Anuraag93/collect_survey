import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThankyouPageList extends StatefulWidget {
  @override
  _ThankyouPageListState createState() => _ThankyouPageListState();
}

class _ThankyouPageListState extends State<ThankyouPageList> {
  SurveyBloc _bloc;
  @override
  void initState() {
    _bloc = BlocProvider.of<SurveyBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: _bloc,
      builder: (BuildContext context, SurveyState state) {
        if (state is NoSurvey) {
          return Scaffold(
            appBar: AppBar(),
            body: CircularProgressIndicator(),
          );
        } else if (state is SurveyAdded) {
          return Scaffold(
            appBar: AppBar(),
            body: Container(
              color: Colors.teal,
            ),
          );
        }
      },
    );
  }
}
