import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/src/services/sqflite_database_service.dart';
import 'package:mobile/src/ui/screens/screens.dart';

void main() => runApp(
      BlocProviderTree(
        blocProviders: [
          BlocProvider<SurveyBloc>(
            builder: (context) => SurveyBloc(db: SqfliteDatabaseService()),
          )
        ],
        child: MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Collect Survey',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}
