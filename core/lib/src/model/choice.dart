class Choice {
    String label;

    Choice({
        this.label,
    });

    factory Choice.fromJson(Map<String, dynamic> json) => new Choice(
        label: json["label"],
    );

    Map<String, dynamic> toJson() => {
        "label": label,
    };
}