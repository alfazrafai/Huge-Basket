import 'package:get/get.dart';
import 'package:huge_basket/features/shop/models/subCategoryModel.dart';

class CategoryModel {
  final String name;
  final String categoryImage;
  final List<SubCategoryModel> subCategories;
  RxBool isSelected = false.obs;

  CategoryModel({
    required this.name,
    required this.categoryImage,
    required this.subCategories,
    bool isSelected = false,
  }) {
    this.isSelected.value = isSelected;
  }
}
