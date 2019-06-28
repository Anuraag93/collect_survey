import 'package:core/src/model/survey.dart';

import 'package:equatable/equatable.dart';

abstract class SurveyState extends Equatable {
  SurveyState([List props = const []]) : super(props);
}

class NoSurvey extends SurveyState {
  final String error;

  NoSurvey({this.error});
  @override
  String toString() => 'NoSurvey';
}

class SurveyFromApi extends SurveyState {
  final Survey survey;

  SurveyFromApi({this.survey});
  @override
  String toString() => 'SurveyFromApi';
}

class SurveyFromJson extends SurveyState {
  final Survey survey;

  SurveyFromJson({this.survey});
  @override
  String toString() => 'SurveyFromJson';
}

class SurveyAdded extends SurveyState {
  final Survey survey;

  SurveyAdded({this.survey});
  @override
  String toString() => 'SurveyAdded';
}
