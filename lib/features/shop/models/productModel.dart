class Product {
  final String image;
  final String title;
  final double price;
  final String weight;
  bool isAdded;
  int quantity;

  Product({
    required this.image,
    required this.title,
    required this.price,
    required this.weight,
    this.isAdded = false,
    this.quantity = 0,
  });
}
