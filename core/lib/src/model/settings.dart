class Settings {
    String language;
    String progressBar;
    bool showProgressBar;

    Settings({
        this.language,
        this.progressBar,
        this.showProgressBar,
    });

    factory Settings.fromJson(Map<String, dynamic> json) => new Settings(
        language: json["language"],
        progressBar: json["progress_bar"],
        showProgressBar: json["show_progress_bar"],
    );

    Map<String, dynamic> toJson() => {
        "language": language,
        "progress_bar": progressBar,
        "show_progress_bar": showProgressBar,
    };
}