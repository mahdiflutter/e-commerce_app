class VariantTypeModel {
  final String id;
  final String name;
  final String title;
  final Types type;
  VariantTypeModel({
    required this.id,
    required this.name,
    required this.title,
    required this.type,
  });
  factory VariantTypeModel.fromMap(Map<String, dynamic> map) {
    return VariantTypeModel(
      id: map['id'],
      name: map['name'],
      title: map['title'],
      type: _initType(
        map['type'],
      ),
    );
  }
}

Types _initType(String type) {
  switch (type) {
    case 'Color':
      return Types.COLOR;
    case 'Storage':
      return Types.STORAGE;
    case 'Voltage':
      return Types.VOLTAGE;
    default:
      return Types.NULL;
  }
}

enum Types {
  COLOR,
  STORAGE,
  VOLTAGE,
  NULL,
}
