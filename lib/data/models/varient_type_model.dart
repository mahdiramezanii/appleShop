class VarientType {
  String id;
  String title;
  String name;
  VarientTypeEnum type;

  VarientType({
    required this.id,
    required this.title,
    required this.name,
    required this.type,
  });

  factory VarientType.fromJson(Map<String, dynamic> jsonMapObject) {
    return VarientType(
      id: jsonMapObject["id"],
      title: jsonMapObject["title"],
      name: jsonMapObject["name"],
      type: _getTypeVaribent(jsonMapObject["type"]),
    );
  }
}

VarientTypeEnum _getTypeVaribent(String type) {
  switch (type) {
    case "Color":
      return VarientTypeEnum.COLOR;

    case "Storages":
      return VarientTypeEnum.STORAGES;

    case "Voltage":
      return VarientTypeEnum.VOLTAGE;

    default:
      return VarientTypeEnum.COLOR;
  }
}

enum VarientTypeEnum {
  COLOR,
  VOLTAGE,
  STORAGES,
}
