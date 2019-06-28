import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/src/ui/screens/thankyou_page_list.dart';
import 'package:mobile/src/ui/widgets/widgets.dart';
import 'package:mobile/src/ui/widgets/yes_no_field.dart';
import 'package:quiver/strings.dart';

class LoadSurveyPage extends StatefulWidget {
  @override
  _LoadSurveyPageState createState() => _LoadSurveyPageState();
}

class _LoadSurveyPageState extends State<LoadSurveyPage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  SurveyBloc _bloc;
  Map<String, dynamic> _formInput;
  List<String> _validationFields = [];
  bool _isValid = false;
  // String _tableName;

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
        if (state is SurveyFromJson) {
          return _buildSurvey(state.survey);
        } else if (state is SurveyFromApi) {
          return _buildSurvey(state.survey);
        } else if (state is SurveyAdded) {
          return _buildSurvey(state.survey);
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

  Widget _buildSurvey(Survey survey) {
    // _tableName = survey.title.replaceAll(" ", "_");
    // print("_tableName => $_tableName");

    final fields = survey.fields;
    if (_formInput == null) {
      _formInput = {};
      _validationFields.clear();
      fields.forEach((f) {
        _formInput[f.id] = null;
        if (f.validations?.required != null && f.validations.required == true) {
          _validationFields.add(f.id);
        }
      });
    }
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(survey.title),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: _saveSurvey,
          )
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: Column(
            children: fields.map((f) {
              switch (f.type.toLowerCase()) {
                case "short_text":
                  return ShortTextField(
                    field: f,
                    onChanged: (value) {
                      _formInput[f.id] = value;
                    },
                  );
                  break;
                case "dropdown":
                  return DropdownField(
                    field: f,
                    onChanged: (value) {
                      _formInput[f.id] = value;
                    },
                  );
                  break;
                case "number":
                  return NumberField(
                    field: f,
                    onChanged: (value) {
                      _formInput[f.id] = value;
                    },
                  );
                  break;
                case "email":
                  return EmailField(
                    field: f,
                    onChanged: (value) {
                      _formInput[f.id] = value;
                    },
                  );
                  break;
                case "phone_number":
                  return PhoneNumberField(
                    field: f,
                    onChanged: (value) {
                      _formInput[f.id] = value;
                    },
                  );
                  break;
                case "rating":
                  return RatingField(
                    field: f,
                    onChanged: (value) {
                      _formInput[f.id] = value.toInt();
                    },
                  );
                  break;
                case "date":
                  return DateField(
                    field: f,
                    onChanged: (value) {
                      _formInput[f.id] = value;
                    },
                  );
                  break;
                case "yes_no":
                  return YesNoField(
                    field: f,
                    onChanged: (value) {
                      _formInput[f.id] = value;
                    },
                  );
                  break;
                default:
                  return ShortTextField(
                    field: f,
                    onChanged: (value) {
                      _formInput[f.id] = value;
                    },
                  );
              }
            }).toList(),
          ),
        ),
      ),
    );
  }

  void _saveSurvey() {
    _isValid = true;
    _validationFields.forEach((v) {
      String error = "Please enter the $v field";
      final value = _formInput[v];
      if (value != null) {
        if (value is String && isBlank(value)) {
          error = "Please enter the $v field";
          return _showSnackbar(error);
        } else if (value is int && value < 0) {
          error = "Please enter a greater value than 0 for  $v field";
          return _showSnackbar(error);
        } else if (value is YesNo) {
          if (value == YesNo.unknown) {
            error = "Please select yes or no for  $v field";
            return _showSnackbar(error);
          } else if (value == YesNo.yes) {
            _formInput[v] = "YES";
          } else if (value == YesNo.no) {
            _formInput[v] = "NO";
          }
        }
      } else {
        return _showSnackbar(error);
      }
    });

    if (_isValid) {
      print("validation Field over => $_formInput");
      //save to database [_formInput]
      _bloc.dispatch(SaveUserInput(input: _formInput));
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => ThankyouPageList()));
    }
  }

  void _showSnackbar(String error) {
    _isValid = false;
    _scaffoldKey.currentState.removeCurrentSnackBar();
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text(error),
    ));
  }
}
