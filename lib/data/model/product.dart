class ProductModel {
  String? id;
  String? name;
  int? price;
  int? discountPrice;
  String? thumbnail;
  int? quantity;
  String? description;
  String? category;
  num? persent;
  ProductModel({
    required this.id,
    required this.name,
    required this.price,
    required this.discountPrice,
    required this.thumbnail,
    required this.quantity,
    required this.description,
    required this.category,
  }) {
    persent = (((price! - (price! + discountPrice!)) / price!) * 100).round();
  }
  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id'],
      name: map['name'],
      price: map['price'],
      discountPrice: map['discount_price'],
      thumbnail:
          'http://startflutter.ir/api/files/${map['collectionId']}/${map['id']}/${map['thumbnail']}',
      quantity: map['quantity'],
      description: map['description'],
      category: map['category'],
    );
  }
}
