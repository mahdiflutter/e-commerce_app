class BannerModel {
  final String id;
  final String collectionId;
  final String thumbnail;
  final String categoryId;
  BannerModel({
    required this.id,
    required this.collectionId,
    required this.thumbnail,
    required this.categoryId,
  });
  factory BannerModel.fromMap(Map<String, dynamic> map) {
    return BannerModel(
      id: map['id'],
      collectionId: map['collectionId'],
      thumbnail:
          'http://startflutter.ir/api/files/${map['collectionId']}/${map['id']}/${map['thumbnail']}',
      categoryId: map['categoryId'],
    );
  }
}
