import 'package:bloc/bloc.dart';
import 'package:core/src/blocs/survey_event.dart';
import 'package:core/src/blocs/survey_state.dart';
import 'package:core/src/model/model.dart';

import 'package:http/http.dart' as http;

class SurveyBloc extends Bloc<SurveyEvent, SurveyState> {
  Survey _survey;
  @override
  SurveyState get initialState => NoSurvey();

  @override
  Stream<SurveyState> mapEventToState(SurveyEvent event) async* {
    if (event is FetchSurveyWithApiPressed) {
      yield await _mapFetchApiToState(api: event.api);
    } else if (event is LoadSurvey) {
      yield _mapLoadSurveyToState(json: event.json);
    } else if (event is SaveUserInput) {
      yield _mapUserInputToState(
          tableName: event.tableName, input: event.input);
    }
  }

  Future<SurveyState> _mapFetchApiToState({String api}) async {
    var response = await http.get(api);
    if (response.statusCode == 200) {
      _survey = surveyFromJson(response.body);
      return SurveyFromApi(survey: _survey);
    } else {
      print("Request failed with status: ${response.statusCode}.");
      return NoSurvey(error: response.statusCode.toString());
    }
  }

  SurveyState _mapLoadSurveyToState({String json}) {
    _survey = surveyFromJson(json);
    return SurveyFromJson(survey: _survey);
  }

  SurveyState _mapUserInputToState(
      {Map<String, dynamic> input, String tableName}) {
    //save to the db with table name

    if (_survey != null) {
      return SurveyAdded(survey: _survey);
    } else {
      return NoSurvey(error: "survey is null");
    }
  }
}
