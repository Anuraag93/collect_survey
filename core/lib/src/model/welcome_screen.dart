import 'package:core/src/model/welcome_screen_properties.dart';

class WelcomeScreen {
    String title;
    WelcomeScreenProperties properties;

    WelcomeScreen({
        this.title,
        this.properties,
    });

    factory WelcomeScreen.fromJson(Map<String, dynamic> json) => new WelcomeScreen(
        title: json["title"],
        properties: WelcomeScreenProperties.fromJson(json["properties"]),
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "properties": properties.toJson(),
    };
}
