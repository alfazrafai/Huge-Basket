import 'package:get/get.dart';
import '../model/address_model.dart';

class AddressController extends GetxController {
  RxList<AddressModel> addresses = <AddressModel>[
    AddressModel(
      address: "3153 Abia Martin Drive",
      unit: "3153",
      city: "Seattle",
      state: "Washington",
      zip: "19034",
      instructions: "Leave at the front porch.",
      isDefault: true,
    ),
    AddressModel(
      address: "799 Lost Creek Road",
      unit: "799",
      city: "Fort Washington",
      state: "US",
      zip: "19034",
      instructions: "Call when arrived.",
      isDefault: false,
    ),
  ].obs;

  // Add Address
  void addAddress(AddressModel model) {
    addresses.add(model);
  }

  // Update Address
  void updateAddress(int index, AddressModel updatedModel) {
    addresses[index] = updatedModel;
  }

  // Delete Address
  void deleteAddress(int index) {
    addresses.removeAt(index);
  }

  // Select default (only 1 default)
  void selectAddress(int index) {
    for (int i = 0; i < addresses.length; i++) {
      addresses[i] = addresses[i].copyWith(isDefault: i == index);
    }
  }
}
