import 'package:get/get.dart';
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
      subCategory: ['Oil', 'Chips', 'Cookies'],
    ),
    CategoryModel(
      categoryImage: HBImages.walmartBackgroundImage,
      name: "Seafood",
      subCategory: ['Fish', 'Prawns', 'Crab'],
    ),
    CategoryModel(
      categoryImage: HBImages.walmartBackgroundImage,
      name: "Frozen Foods",
      subCategory: ['Ice Cream', 'Pizza', 'Fries'],
    ),
    CategoryModel(
      categoryImage: HBImages.walmartBackgroundImage,
      name: "Beverages",
      subCategory: ['Juice', 'Soda', 'Water'],
    ),
  ].obs;

  var selectedSubCategories = <String>[].obs;

  @override
  void onInit() {
    super.onInit();

    //  Select the first category by default
    if (categories.isNotEmpty) {
      categories.first.isSelected.value = true;
      selectedSubCategories.value = categories.first.subCategory;
    }
  }

  void changeCategory(CategoryModel selected) {
    for (final category in categories) {
      category.isSelected.value = false; // reset all
    }
    selected.isSelected.value = true; // select this one
    selectedSubCategories.value = selected.subCategory;
  }
}
