class Attachment {
    String type;
    String href;

    Attachment({
        this.type,
        this.href,
    });

    factory Attachment.fromJson(Map<String, dynamic> json) => new Attachment(
        type: json["type"],
        href: json["href"],
    );

    Map<String, dynamic> toJson() => {
        "type": type,
        "href": href,
    };
}