class ThankyouScreenProperties {
    bool showButton;
    bool shareIcons;
    String buttonMode;
    String buttonText;

    ThankyouScreenProperties({
        this.showButton,
        this.shareIcons,
        this.buttonMode,
        this.buttonText,
    });

    factory ThankyouScreenProperties.fromJson(Map<String, dynamic> json) => new ThankyouScreenProperties(
        showButton: json["show_button"],
        shareIcons: json["share_icons"],
        buttonMode: json["button_mode"],
        buttonText: json["button_text"],
    );

    Map<String, dynamic> toJson() => {
        "show_button": showButton,
        "share_icons": shareIcons,
        "button_mode": buttonMode,
        "button_text": buttonText,
    };
}