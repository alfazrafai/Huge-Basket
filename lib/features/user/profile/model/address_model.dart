class AddressModel {
  final String addressLine;
  final bool isDefault;

  AddressModel({required this.addressLine, this.isDefault = false});

  AddressModel copyWith({String? addressLine, bool? isDefault}) {
    return AddressModel(
      addressLine: addressLine ?? this.addressLine,
      isDefault: isDefault ?? this.isDefault,
    );
  }
}
