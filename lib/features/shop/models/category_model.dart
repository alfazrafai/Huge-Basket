import 'package:get/get_rx/src/rx_types/rx_types.dart';

class CategoryModel {
  final String categoryImage;
  final String name;
  final List<String> subCategory;
  RxBool isSelected = false.obs;

  CategoryModel({
    required this.categoryImage,
    required this.name,
    required this.subCategory,
    bool isSelected = false,
  }) {
    this.isSelected.value = isSelected;
  }
}
