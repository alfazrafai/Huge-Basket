import 'package:get/get.dart';

class MainNavController extends GetxController {
  /// 🧭 Current selected bottom tab index
  final RxInt selectedIndex = 0.obs;

  /// 🧭 Change tab
  void changeTab(int index) {
    selectedIndex.value = index;
  }
}
