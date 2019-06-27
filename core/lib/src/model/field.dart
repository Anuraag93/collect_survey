import 'package:core/src/model/field_properties.dart';
import 'package:core/src/model/validations.dart';

class Field {
    String id;
    String title;
    Validations validations;
    String type;
    FieldProperties properties;

    Field({
        this.id,
        this.title,
        this.validations,
        this.type,
        this.properties,
    });

    factory Field.fromJson(Map<String, dynamic> json) => new Field(
        id: json["id"],
        title: json["title"],
        validations: Validations.fromJson(json["validations"]),
        type: json["type"],
        properties: json["properties"] == null ? null : FieldProperties.fromJson(json["properties"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "validations": validations.toJson(),
        "type": type,
        "properties": properties == null ? null : properties.toJson(),
    };
}