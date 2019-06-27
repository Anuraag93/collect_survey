import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

@immutable
abstract class SurveyEvent extends Equatable {
  SurveyEvent([List props = const []]) : super(props);
}

class FetchSurveyWithApiPressed extends SurveyEvent {
  final String api;

  FetchSurveyWithApiPressed({@required this.api}) : super([api]);

  @override
  String toString() {
    return 'FetchSurveyWithApiPressed { api: $api}';
  }
}

class LoadSurvey extends SurveyEvent {
  final String json;

  LoadSurvey({@required this.json}) : super([json]);

  @override
  String toString() {
    return 'LoadSurvey { json: $json}';
  }
}
