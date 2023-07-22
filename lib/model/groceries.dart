class GroceryItem {
  final int quantity;
  final String name;
  final String imagePath;

  GroceryItem({
    required this.quantity,
    required this.name,
    required this.imagePath,
  });
  Map<String, dynamic> toJson() =>
      {'name': name, 'quantity': quantity, 'imageURL': imagePath};
  static GroceryItem fromJson(Map<String, dynamic> json) => GroceryItem(
      name: json['name'],
      quantity: json['quantity'],
      imagePath: json['imageURL']);
}

var beverages = [
  GroceryItem(
      quantity: 7,
      name: "Dite Coke",
      imagePath: "assets/images/beverages_images/diet_coke.png"),
  GroceryItem(
      quantity: 8,
      name: "Sprite Can",
      imagePath: "assets/images/beverages_images/sprite.png"),
  GroceryItem(
      quantity: 8,
      name: "Apple Juice",
      imagePath: "assets/images/beverages_images/apple_and_grape_juice.png"),
  GroceryItem(
      quantity: 9,
      name: "Orange Juice",
      imagePath: "assets/images/beverages_images/orange_juice.png"),
  GroceryItem(
      quantity: 10,
      name: "Coca Cola Can",
      imagePath: "assets/images/beverages_images/coca_cola.png"),
  GroceryItem(
      quantity: 11,
      name: "Pepsi Can",
      imagePath: "assets/images/beverages_images/pepsi.png"),
];
