class WelcomeScreenProperties {
    bool showButton;
    String description;
    String buttonText;

    WelcomeScreenProperties({
        this.showButton,
        this.description,
        this.buttonText,
    });

    factory WelcomeScreenProperties.fromJson(Map<String, dynamic> json) => new WelcomeScreenProperties(
        showButton: json["show_button"],
        description: json["description"],
        buttonText: json["button_text"],
    );

    Map<String, dynamic> toJson() => {
        "show_button": showButton,
        "description": description,
        "button_text": buttonText,
    };
}
