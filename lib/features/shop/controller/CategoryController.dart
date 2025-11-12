import 'package:get/get.dart';
import '../models/category_model.dart';
import '../models/productModel.dart';
import '../models/subCategoryModel.dart';

import '../../../utils/constant/image_strings.dart';

class CategoryController extends GetxController {
  final RxList<CategoryModel> categories = <CategoryModel>[].obs;
  var selectedCategory = Rx<CategoryModel?>(null);

  @override
  void onInit() {
    super.onInit();

    categories.addAll([
      // 🥛 1. Dairy & Eggs
      CategoryModel(
        name: "Dairy & Eggs",
        categoryImage: HBImages.dairyAndEggs,
        subCategories: [
          SubCategoryModel(
            name: "Milk",
            products: [
              ProductModel(
                name: "Lactaid Fat Free Pure Milk",
                image: HBImages.lactaidFatFreePure,
                price: 15,
                quantity: "20 mg",
              ),
              ProductModel(
                name: "Lactaid Whole Pure Milk",
                image: HBImages.lactaidWholeMilk,
                price: 35,
                quantity: "22 mg",
              ),
              ProductModel(
                name: "Lactaid Fat Free Pure Milk",
                image: HBImages.alfazMilk,
                price: 15,
                quantity: "20 mg",
              ),
              ProductModel(
                name: "Lactaid Whole Pure Milk",
                image: HBImages.walmartBackgroundImage,
                price: 35,
                quantity: "22 mg",
              ),
              ProductModel(
                name: "Lactaid Fat Free Pure Milk",
                image: HBImages.walmartBackgroundImage,
                price: 15,
                quantity: "20 mg",
              ),
              ProductModel(
                name: "Lactaid Whole Pure Milk",
                image: HBImages.walmartBackgroundImage,
                price: 35,
                quantity: "22 mg",
              ),
              ProductModel(
                name: "Lactaid Fat Free Pure Milk",
                image: HBImages.walmartBackgroundImage,
                price: 15,
                quantity: "20 mg",
              ),
              ProductModel(
                name: "Lactaid Whole Pure Milk",
                image: HBImages.walmartBackgroundImage,
                price: 35,
                quantity: "22 mg",
              ),
            ],
          ),
          SubCategoryModel(
            name: "Butter & Cheese",
            products: [
              ProductModel(
                name: "Amul Salted Butter",
                image: HBImages.walmartBackgroundImage,
                price: 50,
                quantity: "500 gm",
              ),
            ],
          ),
          SubCategoryModel(
            name: "Eggs",
            products: [
              ProductModel(
                name: "Farm Fresh Brown Eggs (12 pcs)",
                image: HBImages.walmartBackgroundImage,
                price: 75,
                quantity: "12 pcs",
              ),
              ProductModel(
                name: "Omega 3 Enriched Eggs",
                image: HBImages.walmartBackgroundImage,
                price: 90,
                quantity: "6 pcs",
              ),
            ],
          ),
        ],
      ),

      // 🍞 2. Bakery
      CategoryModel(
        name: "Snacks",
        categoryImage: HBImages.snacks,
        subCategories: [
          SubCategoryModel(
            name: "Cakes",
            products: [
              ProductModel(
                name: "Chocolate Truffle Cake",
                image: HBImages.walmartBackgroundImage,
                price: 40,
                quantity: "500 gm",
              ),
              ProductModel(
                name: "Red Velvet Cake",
                image: HBImages.walmartBackgroundImage,
                price: 55,
                quantity: "1 kg",
              ),
            ],
          ),
          SubCategoryModel(
            name: "Cookies",
            products: [
              ProductModel(
                name: "Choco Chip Cookies",
                image: HBImages.walmartBackgroundImage,
                price: 25,
                quantity: "10 pcs",
              ),
              ProductModel(
                name: "Butter Cookies",
                image: HBImages.walmartBackgroundImage,
                price: 20,
                quantity: "8 pcs",
              ),
            ],
          ),
          SubCategoryModel(
            name: "Breads",
            products: [
              ProductModel(
                name: "Whole Wheat Bread",
                image: HBImages.walmartBackgroundImage,
                price: 30,
                quantity: "400 gm",
              ),
              ProductModel(
                name: "Garlic Bread Loaf",
                image: HBImages.walmartBackgroundImage,
                price: 45,
                quantity: "250 gm",
              ),
            ],
          ),
        ],
      ),

      // 🥦 3. Vegetables & Fruits
      CategoryModel(
        name: "SeaFood",
        categoryImage: HBImages.seaFood,
        subCategories: [
          SubCategoryModel(
            name: "Fresh Vegetables",
            products: [
              ProductModel(
                name: "Organic Tomatoes",
                image: HBImages.walmartBackgroundImage,
                price: 25,
                quantity: "1 kg",
              ),
              ProductModel(
                name: "Green Bell Peppers",
                image: HBImages.walmartBackgroundImage,
                price: 30,
                quantity: "500 gm",
              ),
            ],
          ),
          SubCategoryModel(
            name: "Fresh Fruits",
            products: [
              ProductModel(
                name: "Bananas",
                image: HBImages.walmartBackgroundImage,
                price: 40,
                quantity: "1 dozen",
              ),
              ProductModel(
                name: "Apples",
                image: HBImages.walmartBackgroundImage,
                price: 90,
                quantity: "1 kg",
              ),
            ],
          ),
          SubCategoryModel(
            name: "Leafy Greens",
            products: [
              ProductModel(
                name: "Baby Spinach",
                image: HBImages.walmartBackgroundImage,
                price: 35,
                quantity: "250 gm",
              ),
              ProductModel(
                name: "Fresh Coriander",
                image: HBImages.walmartBackgroundImage,
                price: 10,
                quantity: "1 bunch",
              ),
            ],
          ),
        ],
      ),

      // 🍗 4. Meat & Seafood
      CategoryModel(
        name: "Frozen Foods",
        categoryImage: HBImages.frozenFood,
        subCategories: [
          SubCategoryModel(
            name: "Chicken",
            products: [
              ProductModel(
                name: "Fresh Chicken Breast",
                image: HBImages.walmartBackgroundImage,
                price: 150,
                quantity: "500 gm",
              ),
              ProductModel(
                name: "Boneless Chicken Thigh",
                image: HBImages.walmartBackgroundImage,
                price: 180,
                quantity: "500 gm",
              ),
            ],
          ),
          SubCategoryModel(
            name: "Bakery",
            products: [
              ProductModel(
                name: "Fresh Prawns",
                image: HBImages.bakery,
                price: 220,
                quantity: "500 gm",
              ),
              ProductModel(
                name: "Rohu Fish Slices",
                image: HBImages.walmartBackgroundImage,
                price: 200,
                quantity: "1 kg",
              ),
            ],
          ),
        ],
      ),

      // 🍫 5. Snacks & Beverages
      CategoryModel(
        name: "Snacks & Beverages",
        categoryImage: HBImages.walmartBackgroundImage,
        subCategories: [
          SubCategoryModel(
            name: "Snacks",
            products: [
              ProductModel(
                name: "Lays Classic Salted",
                image: HBImages.walmartBackgroundImage,
                price: 20,
                quantity: "50 gm",
              ),
              ProductModel(
                name: "Kurkure Masala Munch",
                image: HBImages.walmartBackgroundImage,
                price: 15,
                quantity: "40 gm",
              ),
            ],
          ),
          SubCategoryModel(
            name: "Soft Drinks",
            products: [
              ProductModel(
                name: "Coca-Cola Can",
                image: HBImages.walmartBackgroundImage,
                price: 40,
                quantity: "300 ml",
              ),
              ProductModel(
                name: "Pepsi Can",
                image: HBImages.walmartBackgroundImage,
                price: 35,
                quantity: "300 ml",
              ),
            ],
          ),
          SubCategoryModel(
            name: "Juices",
            products: [
              ProductModel(
                name: "Real Mixed Fruit Juice",
                image: HBImages.walmartBackgroundImage,
                price: 90,
                quantity: "1 L",
              ),
              ProductModel(
                name: "Tropicana Orange Juice",
                image: HBImages.walmartBackgroundImage,
                price: 85,
                quantity: "1 L",
              ),
            ],
          ),
        ],
      ),
    ]);

    if (categories.isNotEmpty) {
      changeCategory(categories.first);
    }
  }

  void changeCategory(CategoryModel selected) {
    for (final category in categories) {
      category.isSelected.value = false;
    }
    selected.isSelected.value = true;
    selectedCategory.value = selected;
  }
}
