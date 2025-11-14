class StoreModel {
  final String name;
  final String category;
  final String distance;
  final String address;
  final String image;
  final String storeHeadingImage;
  final double rating;

  StoreModel({
    required this.name,
    required this.category,
    required this.distance,
    required this.address,
    required this.image,
    required this.storeHeadingImage,
    required this.rating,
  });

  @override
  String toString() {
    return 'StoreModel(name: $name, category: $category)';
  }
}
