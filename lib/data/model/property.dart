class PropertyModel {
  String? title;
  String? value;
  PropertyModel({required this.title, required this.value});
  factory PropertyModel.fromMap(Map<String, dynamic> map) {
    return PropertyModel(
      title: map['title'],
      value: map['value'],
    );
  }
}
