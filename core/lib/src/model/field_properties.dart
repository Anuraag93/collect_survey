import 'package:core/src/model/choice.dart';

class FieldProperties {
    bool alphabeticalOrder;
    List<Choice> choices;
    int steps;
    String shape;
    String structure;
    String separator;

    FieldProperties({
        this.alphabeticalOrder,
        this.choices,
        this.steps,
        this.shape,
        this.structure,
        this.separator,
    });

    factory FieldProperties.fromJson(Map<String, dynamic> json) => new FieldProperties(
        alphabeticalOrder: json["alphabetical_order"] == null ? null : json["alphabetical_order"],
        choices: json["choices"] == null ? null : new List<Choice>.from(json["choices"].map((x) => Choice.fromJson(x))),
        steps: json["steps"] == null ? null : json["steps"],
        shape: json["shape"] == null ? null : json["shape"],
        structure: json["structure"] == null ? null : json["structure"],
        separator: json["separator"] == null ? null : json["separator"],
    );

    Map<String, dynamic> toJson() => {
        "alphabetical_order": alphabeticalOrder == null ? null : alphabeticalOrder,
        "choices": choices == null ? null : new List<dynamic>.from(choices.map((x) => x.toJson())),
        "steps": steps == null ? null : steps,
        "shape": shape == null ? null : shape,
        "structure": structure == null ? null : structure,
        "separator": separator == null ? null : separator,
    };
}