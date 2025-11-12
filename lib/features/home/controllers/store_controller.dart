import 'package:get/get.dart';
import 'package:huge_basket/utils/constant/image_strings.dart';

import '../model/store_model.dart';

class StoreController extends GetxController {
  final RxList<StoreModel> stores = <StoreModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadStores();
  }

  void loadStores() {
    stores.addAll([
      StoreModel(
        name: "Walmart",
        category: "Grocery",
        distance: "1 mile",
        address: "3456 Washington Street, Us, 4568",
        image: HBImages.walmartStoreShop,
        rating: 4.6,
      ),
      StoreModel(
        name: "Stop & Shop",
        category: "Grocery and General",
        distance: "2 mile",
        address: "3456 Washington Street, Us, 4568",
        image: HBImages.stopAndShop,
        rating: 4.5,
      ),
      StoreModel(
        name: "Safeway",
        category: "Grocery",
        distance: "3.5 mile",
        address: "3456 Washington Street, Us, 4568",
        image: HBImages.safeWayStoreShop,
        rating: 4.4,
      ),
      StoreModel(
        name: "Giant Food Stores",
        category: "Grocery",
        distance: "4 mile",
        address: "3456 Washington Street, Us, 4568",
        image: HBImages.giantFoodStoreShop,
        rating: 4.2,
      ),
      StoreModel(
        name: "Meijer",
        category: "Grocery",
        distance: "5 mile",
        address: "3456 Washington Street, Us, 4568",
        image: HBImages.meijerStoreShop,
        rating: 4.7,
      ),
      StoreModel(
        name: "Alfaz Super Market",
        category: "Grocery",
        distance: "5 mile",
        address: "3456 Washington Street, Us, 4568",
        image: HBImages.alfazStoreShop,
        rating: 4.7,
      ),
    ]);
  }
}
