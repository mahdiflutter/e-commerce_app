// import 'package:e_commerce_app/data/model/productvariant.dart';
import 'package:hive/hive.dart';
part 'order.g.dart';

@HiveType(typeId: 0)
class OrderModel {
  @HiveField(0)
  String? id;
  @HiveField(1)
  int? count;
  @HiveField(2)
  String? name;
  @HiveField(3)
  String? garanty;
  @HiveField(4)
  num? persent;
  @HiveField(5)
  int? realPrice;
  @HiveField(6)
  int? discountPrice;
  @HiveField(7)
  String? thumbnail;

  OrderModel({
    required this.id,
    required this.count,
    required this.name,
    required this.garanty,
    required this.persent,
    required this.realPrice,
    required this.discountPrice,
    required this.thumbnail,
  });
}
