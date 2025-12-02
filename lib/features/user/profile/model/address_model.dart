import 'package:hive/hive.dart';

part 'address_model.g.dart';

@HiveType(typeId: 1)
class AddressModel {
  @HiveField(0)
  final String address;

  @HiveField(1)
  final String unit;

  @HiveField(2)
  final String city;

  @HiveField(3)
  final String state;

  @HiveField(4)
  final String zip;

  @HiveField(5)
  final String instructions;

  @HiveField(6)
  final bool isDefault;

  AddressModel({
    required this.address,
    required this.unit,
    required this.city,
    required this.state,
    required this.zip,
    required this.instructions,
    this.isDefault = false,
  });

  /// 👇 ADD THIS BACK
  AddressModel copyWith({
    String? address,
    String? unit,
    String? city,
    String? state,
    String? zip,
    String? instructions,
    bool? isDefault,
  }) {
    return AddressModel(
      address: address ?? this.address,
      unit: unit ?? this.unit,
      city: city ?? this.city,
      state: state ?? this.state,
      zip: zip ?? this.zip,
      instructions: instructions ?? this.instructions,
      isDefault: isDefault ?? this.isDefault,
    );
  }

  String get addressLine => "$address, $unit, $city, $state, $zip";
}
