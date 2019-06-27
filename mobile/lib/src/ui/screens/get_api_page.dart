import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiver/strings.dart';

class GetApiPage extends StatefulWidget {
  @override
  _GetApiPageState createState() => _GetApiPageState();
}

class _GetApiPageState extends State<GetApiPage> {
  final _controller = TextEditingController.fromValue(
      TextEditingValue(text: Constants.kDefaultFetchAPI));
  SurveyBloc _bloc;
  @override
  void initState() {
    _bloc = BlocProvider.of<SurveyBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Collect Survey Home Page'),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Enter the API to fetch the survey',
              ),
              SizedBox(height: 10),
              TextField(
                controller: _controller,
                maxLines: null,
              ),
              SizedBox(height: 10),
              RaisedButton(
                child: Text("Fetch"),
                onPressed: () {
                  final api = _controller.text;
                  if (!isBlank(api)) {
                    _bloc.dispatch(FetchSurveyWithApiPressed(api: api));
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
