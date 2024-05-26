class Properties {
  String title;
  String value;
  
  Properties({
    required this.title,
    required this.value,
  });

  factory Properties.fromJson(Map<String, dynamic> jsonObject) {
    return Properties(
      title: jsonObject["title"],
      value: jsonObject["value"],
    );
  }
}
