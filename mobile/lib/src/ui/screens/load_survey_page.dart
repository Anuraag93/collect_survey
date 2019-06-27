import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoadSurveyPage extends StatefulWidget {
  @override
  _LoadSurveyPageState createState() => _LoadSurveyPageState();
}

class _LoadSurveyPageState extends State<LoadSurveyPage> {
  SurveyBloc _bloc;
  @override
  void initState() {
    _bloc = BlocProvider.of<SurveyBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SurveyEvent, SurveyState>(
      bloc: _bloc,
      builder: (BuildContext context, SurveyState state) {
        if (state is NoSurvey) {
          return Scaffold(
            appBar: AppBar(),
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (state is SurveyFromApi) {
          return _buildSurvey(state.survey);
        } else if (state is SurveyFromJson) {
          return _buildSurvey(state.survey);
        }
      },
    );
  }

  Widget _buildSurvey(Survey survey) {
    final fields = survey.fields;

    return Scaffold(
      appBar: AppBar(
        title: Text(survey.title),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: Column(
          children: fields.map((f) {
            switch (f.type.toLowerCase()) {
              case "short_text":
                break;
              case "dropdown":
                break;
              case "number":
                break;
              case "email":
                break;
              case "phone_number":
                break;
              case "rating":
                break;
              case "date":
                break;
              case "yes_no":
                break;
              default:
            }
          }).toList(),
        ),
      ),
    );
  }
}
