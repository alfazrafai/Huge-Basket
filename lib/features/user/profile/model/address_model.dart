class AddressModel {
  final String address; // Street Address
  final String unit; // Unit / House No
  final String city;
  final String state;
  final String zip;
  final String instructions;
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

  // For Card Display (simple merged line)
  String get addressLine => "$address, $unit, $city, $state, $zip";

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
}
