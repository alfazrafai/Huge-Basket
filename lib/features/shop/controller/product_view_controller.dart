import 'package:get/get.dart';

class ProductViewController extends GetxController {
  /// 🧩 true = GridView, false = ListView
  final RxBool isGridView = true.obs;

  void toggleView() {
    isGridView.value = !isGridView.value;
  }
}
