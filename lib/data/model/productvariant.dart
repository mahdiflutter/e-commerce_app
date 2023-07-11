import 'package:e_commerce_app/data/model/variant.dart';
import 'package:e_commerce_app/data/model/variant_type.dart';

class ProductVariantModel {
  final VariantTypeModel variantType;
  final List<VariantModel> variants;
  ProductVariantModel({
    required this.variantType,
    required this.variants,
  });
}
