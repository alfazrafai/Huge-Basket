import 'package:get/get.dart';
import '../model/address_model.dart';

class AddressController extends GetxController {
  final RxList<AddressModel> addresses = <AddressModel>[
    AddressModel(
      addressLine: "799 Lost Creek Road, Seattle, Fort Washington, Us, 19034",
      isDefault: true,
    ),
    AddressModel(
      addressLine: "799 Lost Creek Road, Seattle, Fort Washington, Us, 19034",
    ),
  ].obs;

  void selectAddress(int index) {
    for (int i = 0; i < addresses.length; i++) {
      addresses[i] = addresses[i].copyWith(isDefault: i == index);
    }
  }

  void deleteAddress(int index) {
    addresses.removeAt(index);
  }

  void addNewAddress(String address) {
    addresses.add(AddressModel(addressLine: address));
  }
}
