// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AddressModelAdapter extends TypeAdapter<AddressModel> {
  @override
  final int typeId = 1;

  @override
  AddressModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AddressModel(
      address: fields[0] as String,
      unit: fields[1] as String,
      city: fields[2] as String,
      state: fields[3] as String,
      zip: fields[4] as String,
      instructions: fields[5] as String,
      isDefault: fields[6] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, AddressModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.address)
      ..writeByte(1)
      ..write(obj.unit)
      ..writeByte(2)
      ..write(obj.city)
      ..writeByte(3)
      ..write(obj.state)
      ..writeByte(4)
      ..write(obj.zip)
      ..writeByte(5)
      ..write(obj.instructions)
      ..writeByte(6)
      ..write(obj.isDefault);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AddressModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
