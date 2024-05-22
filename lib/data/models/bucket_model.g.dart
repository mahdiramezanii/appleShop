// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bucket_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BucketAdapter extends TypeAdapter<Bucket> {
  @override
  final int typeId = 0;

  @override
  Bucket read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Bucket(
      id: fields[0] as String,
      collectionId: fields[1] as String,
      collectionName: fields[2] as String,
      discount_price: fields[3] as int,
      name: fields[4] as String,
      price: fields[5] as int,
      quantity: fields[6] as int,
      thumbnail: fields[7] as String,
    )
      ..percent = fields[8] as num?
      ..realPrice = fields[9] as int?;
  }

  @override
  void write(BinaryWriter writer, Bucket obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.collectionId)
      ..writeByte(2)
      ..write(obj.collectionName)
      ..writeByte(3)
      ..write(obj.discount_price)
      ..writeByte(4)
      ..write(obj.name)
      ..writeByte(5)
      ..write(obj.price)
      ..writeByte(6)
      ..write(obj.quantity)
      ..writeByte(7)
      ..write(obj.thumbnail)
      ..writeByte(8)
      ..write(obj.percent)
      ..writeByte(9)
      ..write(obj.realPrice);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BucketAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
