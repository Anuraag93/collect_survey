import 'package:core/src/model/attachment.dart';
import 'package:core/src/model/thankyou_screen_properties.dart';

class ThankyouScreen {
    String title;
    ThankyouScreenProperties properties;
    Attachment attachment;

    ThankyouScreen({
        this.title,
        this.properties,
        this.attachment,
    });

    factory ThankyouScreen.fromJson(Map<String, dynamic> json) => new ThankyouScreen(
        title: json["title"],
        properties: ThankyouScreenProperties.fromJson(json["properties"]),
        attachment: json["attachment"] == null ? null : Attachment.fromJson(json["attachment"]),
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "properties": properties.toJson(),
        "attachment": attachment == null ? null : attachment.toJson(),
    };
}