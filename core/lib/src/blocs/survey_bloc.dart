import 'package:bloc/bloc.dart';
import 'package:core/src/blocs/survey_event.dart';
import 'package:core/src/blocs/survey_state.dart';
import 'package:core/src/model/model.dart';

import 'package:http/http.dart' as http;

class SurveyBloc extends Bloc<SurveyEvent, SurveyState> {
  @override
  SurveyState get initialState => NoSurvey();

  @override
  Stream<SurveyState> mapEventToState(SurveyEvent event) async* {
    if (event is FetchSurveyWithApiPressed) {
      yield await _mapFetchApiToState(api: event.api);
    } else if (event is LoadSurvey) {
      yield _mapLoadSurveyToState(json: event.json);
    }
  }

  Future<SurveyState> _mapFetchApiToState({String api}) async {
    var response = await http.get(api);
    if (response.statusCode == 200) {
      final s = surveyFromJson(response.body);
      return SurveyFromApi(survey: s);
    } else {
      print("Request failed with status: ${response.statusCode}.");
      return NoSurvey(error: response.statusCode.toString());
    }
  }

  SurveyState _mapLoadSurveyToState({String json}) {
    final s = surveyFromJson(json);
    return SurveyFromJson(survey: s);
  }
}
