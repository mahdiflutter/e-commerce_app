// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class OrderModelAdapter extends TypeAdapter<OrderModel> {
  @override
  final int typeId = 0;

  @override
  OrderModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return OrderModel(
      id: fields[0] as String?,
      count: fields[1] as int?,
      name: fields[2] as String?,
      garanty: fields[3] as String?,
      persent: fields[4] as num?,
      realPrice: fields[5] as int?,
      discountPrice: fields[6] as int?,
      thumbnail: fields[7] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, OrderModel obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.count)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.garanty)
      ..writeByte(4)
      ..write(obj.persent)
      ..writeByte(5)
      ..write(obj.realPrice)
      ..writeByte(6)
      ..write(obj.discountPrice)
      ..writeByte(7)
      ..write(obj.thumbnail);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OrderModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
