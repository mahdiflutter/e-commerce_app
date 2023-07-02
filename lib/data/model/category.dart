class CategoryModel {
  String? id;
  String? title;
  String? color;
  String? icon;
  String? thumbnail;
  CategoryModel({
    required this.id,
    required this.title,
    required this.color,
    required this.icon,
    required this.thumbnail,
  });
  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      id: map['id'],
      title: map['title'],
      color: map['color'],
      icon:
          'http://startflutter.ir/api/files/${map['collectionId']}/${map['id']}/${map['icon']}',
      thumbnail:
          'http://startflutter.ir/api/files/${map['collectionId']}/${map['id']}/${map['thumbnail']}',
    );
  }
}
