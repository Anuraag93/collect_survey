import 'package:bloc/bloc.dart';
import 'package:core/src/blocs/survey_event.dart';
import 'package:core/src/blocs/survey_state.dart';
import 'package:core/src/model/model.dart';
import 'package:core/src/service/database_service.dart';

import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

class SurveyBloc<T> extends Bloc<SurveyEvent, SurveyState> {
  DatabaseService<T> _db;
  List<int> _surveyEnteredList = [];

  SurveyBloc({@required DatabaseService<T> db}) : _db = db;
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
      yield await _mapUserInputToState(input: event.input);
    }
  }

  Future<SurveyState> _mapFetchApiToState({String api}) async {
    var response = await http.get(api);
    if (response.statusCode == 200) {
      _survey = surveyFromJson(response.body);
      _openDatabase(_survey);
      return SurveyFromApi(survey: _survey);
    } else {
      print("Request failed with status: ${response.statusCode}.");
      return NoSurvey(error: response.statusCode.toString());
    }
  }

  SurveyState _mapLoadSurveyToState({String json}) {
    _survey = surveyFromJson(json);
    _openDatabase(_survey);
    return SurveyFromJson(survey: _survey);
  }

  Future<SurveyState> _mapUserInputToState(
      {Map<String, dynamic> input, String tableName}) async {
    //save to the db with table name
    int id = await _db.insertDB(input);
    print("id => $id");
    if (id != null) {
      _surveyEnteredList.add(id);
      return SurveyAdded(survey: _survey);
    } else {
      return NoSurvey(error: "survey is null");
    }
  }

  void _openDatabase(Survey s) {
    String tableName = s.title.replaceAll(" ", "_");
    List<ColumnData> columns = s.fields.map((f) {
      return ColumnData(
          name: f.id,
          dataType: _enterType(f.type),
          isNull: f.validations.required ? "not null" : "null");
    }).toList();

    _db.openDB(tableName, columns);
  }

  String _enterType(String type) {
    switch (type.toLowerCase()) {
      case "short_text":
        return "text";
        break;
      case "dropdown":
        return "text";
        break;
      case "number":
        return "integer";
        break;
      case "email":
        return "text";
        break;
      case "phone_number":
        return "text";
      case "rating":
        return "integer";
        break;
      case "date":
        return "text";
        break;
      case "yes_no":
        return "text";
        break;
      default:
        return "text";
    }
  }
}
