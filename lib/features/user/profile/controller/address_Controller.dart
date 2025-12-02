import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:huge_basket/features/user/profile/model/address_model.dart';

class AddressController extends GetxController {
  final _box = Hive.box<AddressModel>('addresses');
  RxList<AddressModel> addresses = <AddressModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    addresses.value = _box.values.toList();
  }

  void addAddress(AddressModel model) {
    _box.add(model);
    addresses.add(model);
  }

  void updateAddress(int index, AddressModel updated) {
    _box.putAt(index, updated);
    addresses[index] = updated;
  }

  void deleteAddress(int index) {
    _box.deleteAt(index);
    addresses.removeAt(index);
  }

  void selectAddress(int selectedIndex) {
    for (int i = 0; i < addresses.length; i++) {
      final updated = addresses[i].copyWith(isDefault: i == selectedIndex);
      _box.putAt(i, updated);
      addresses[i] = updated;
    }
  }
}
