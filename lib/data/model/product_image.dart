class ProductImageModel {
  final String thumbnail;
  const ProductImageModel({required this.thumbnail});
  factory ProductImageModel.fromMap(Map<String, dynamic> map) {
    return ProductImageModel(
      thumbnail:
          'http://startflutter.ir/api/files/${map['collectionId']}/${map['id']}/${map['image']}',
    );
  }
}
