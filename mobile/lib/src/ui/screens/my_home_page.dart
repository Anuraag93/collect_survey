import 'package:flutter/material.dart';
import 'package:core/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/src/services/load_save_json_service.dart';
import 'package:mobile/src/ui/screens/get_api_page.dart';
import 'package:mobile/src/ui/screens/welcome_page_list.dart';
import 'package:quiver/strings.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  SurveyBloc _bloc;

  @override
  void initState() {
    _bloc = BlocProvider.of<SurveyBloc>(context);
    _loadJson();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SurveyEvent, SurveyState>(
      bloc: _bloc,
      builder: (BuildContext context, SurveyState state) {
        if (state is NoSurvey) {
          return GetApiPage();
        } else if (state is SurveyFromApi) {
          _saveJson(state.survey);
          return WelcomePageList(survey: state.survey, idList: state.idList);
        } else if (state is SurveyFromJson) {
          return WelcomePageList(survey: state.survey, idList: state.idList);
        } else if (state is SurveyAdded) {
          return WelcomePageList(survey: state.survey, idList: state.idList);
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

  void _saveJson(Survey s) async {
    await LoadSaveJsonService.saveSurvey(surveyToJson(s));
  }

  void _loadJson() async {
    final json = await LoadSaveJsonService.loadSurvey();
    if (!isBlank(json)) {
      _bloc.dispatch(LoadSurvey(json: json));
    }
  }
}
