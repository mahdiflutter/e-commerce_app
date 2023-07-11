class VariantModel {
  final String id;
  final String name;
  final int priceChange;
  final String productId;
  final String typeId;
  final String value;
  VariantModel({
    required this.id,
    required this.name,
    required this.priceChange,
    required this.productId,
    required this.typeId,
    required this.value,
  });
  factory VariantModel.fromMap(Map<String, dynamic> map) {
    return VariantModel(
      id: map['id'],
      name: map['name'],
      priceChange: map['price_change'],
      productId: map['product_id'],
      typeId: map['type_id'],
      value: map['value'],
    );
  }
}
