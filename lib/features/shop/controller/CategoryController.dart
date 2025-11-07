import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../../utils/constant/image_strings.dart';
import '../models/category_model.dart';

class CategoryController extends GetxController {
  final RxList<CategoryModel> categories = <CategoryModel>[
    CategoryModel(
      categoryImage: HBImages.walmartBackgroundImage,
      name: "Dairy & Eggs",
      subCategory: ['Milk', 'Butter Milk', 'Dahi'],
    ),
    CategoryModel(
      categoryImage: HBImages.walmartBackgroundImage,
      name: "Snacks",
      subCategory: ['Oil', 'Butter Milk', 'Dahi'],
    ),
    CategoryModel(
      categoryImage: HBImages.walmartBackgroundImage,
      name: "Seafood",
      subCategory: ['Cake', 'Butter Milk', 'Dahi'],
    ),
    CategoryModel(
      categoryImage: HBImages.walmartBackgroundImage,
      name: "Frozen Foods",
      subCategory: ['Cake', 'Butter Milk', 'Dahi'],
    ),
    CategoryModel(
      categoryImage: HBImages.walmartBackgroundImage,
      name: "Item",
      subCategory: ['Cake', 'Butter Milk', 'Dahi'],
    ),
  ].obs;

  var selectedCategory = 'Item'.obs;

  List<String> get selectedSubCategory {
    return categories
        .firstWhere((c) => c.name == selectedCategory.value)
        .subCategory;
  }

  void changeCategory(String newCategory) {
    selectedCategory.value = newCategory;
    print('Selected Category: $newCategory');
  }
}
