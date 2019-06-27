class Validations {
    bool required;

    Validations({
        this.required,
    });

    factory Validations.fromJson(Map<String, dynamic> json) => new Validations(
        required: json["required"],
    );

    Map<String, dynamic> toJson() => {
        "required": required,
    };
}