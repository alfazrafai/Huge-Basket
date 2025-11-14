import '../../shop/models/category_model.dart';

import '../../../utils/constant/image_strings.dart';
import '../../shop/models/productModel.dart';
import '../../shop/models/subCategoryModel.dart';

class StoreCategoryData {
  static Map<String, List<CategoryModel>> data = {
    // 🟦 STORE 1 — Walmart
    "store_1": [
      CategoryModel(
        name: "Dairy & Eggs",
        categoryImage: HBImages.dairyAndEggs,
        subCategories: [
          SubCategoryModel(
            name: "Milk",
            products: [
              ProductModel(
                name: "Amul Gold Milk 500ml",
                image: HBImages.alfazMilk,
                price: 32,
                quantity: "500 ml",
              ),
              ProductModel(
                name: "Amul Toned Milk",
                image: HBImages.walmartBackgroundImage,
                price: 24,
                quantity: "500 ml",
              ),
            ],
          ),
        ],
      ),
    ],

    // 🟩 STORE 2 — D-Mart
    "store_2": [
      CategoryModel(
        name: "Snacks",
        categoryImage: HBImages.snacks,
        subCategories: [
          SubCategoryModel(
            name: "Chips",
            products: [
              ProductModel(
                name: "Lays Classic Salted",
                image: HBImages.walmartBackgroundImage,
                price: 20,
                quantity: "50 gm",
              ),
            ],
          ),
        ],
      ),
    ],

    // 🟥 STORE 3 — Reliance
    "store_3": [
      CategoryModel(
        name: "Frozen Food",
        categoryImage: HBImages.frozenFood,
        subCategories: [
          SubCategoryModel(
            name: "Chicken",
            products: [
              ProductModel(
                name: "Frozen Chicken Breast",
                image: HBImages.walmartBackgroundImage,
                price: 180,
                quantity: "500 gm",
              ),
            ],
          ),
        ],
      ),
    ],
  };
}
