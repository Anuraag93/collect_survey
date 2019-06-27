import 'dart:convert';

import 'package:core/src/model/field.dart';
import 'package:core/src/model/settings.dart';
import 'package:core/src/model/thankyou_screen.dart';
import 'package:core/src/model/welcome_screen.dart';

Survey surveyFromJson(String str) => Survey.fromJson(json.decode(str));

String surveyToJson(Survey data) => json.encode(data.toJson());

class Survey {
    String id;
    String title;
    Settings settings;
    List<WelcomeScreen> welcomeScreens;
    List<ThankyouScreen> thankyouScreens;
    List<Field> fields;

    Survey({
        this.id,
        this.title,
        this.settings,
        this.welcomeScreens,
        this.thankyouScreens,
        this.fields,
    });

    factory Survey.fromJson(Map<String, dynamic> json) => new Survey(
        id: json["id"],
        title: json["title"],
        settings: Settings.fromJson(json["settings"]),
        welcomeScreens: new List<WelcomeScreen>.from(json["welcome_screens"].map((x) => WelcomeScreen.fromJson(x))),
        thankyouScreens: new List<ThankyouScreen>.from(json["thankyou_screens"].map((x) => ThankyouScreen.fromJson(x))),
        fields: new List<Field>.from(json["fields"].map((x) => Field.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "settings": settings.toJson(),
        "welcome_screens": new List<dynamic>.from(welcomeScreens.map((x) => x.toJson())),
        "thankyou_screens": new List<dynamic>.from(thankyouScreens.map((x) => x.toJson())),
        "fields": new List<dynamic>.from(fields.map((x) => x.toJson())),
    };
}