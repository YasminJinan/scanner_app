enum ProductCategory {
  coffee,
  iced,
  pastry,
}

class Product {
  final String name;
  final int price;
  final ProductCategory category;

  Product({required this.name, required this.price, required this.category});

  
}

final List<Product> menus = [
  Product(name: "Americano", price: 55000, category: ProductCategory.coffee),
  Product(name: "Cafe Latte", price: 37000, category: ProductCategory.coffee),
  Product(name: "Cappuccino", price: 8000, category: ProductCategory.coffee),
  Product(name: "Caramel Latte", price: 78000, category: ProductCategory.coffee),
  Product(name: "Vanilla Latte", price: 30000, category: ProductCategory.coffee),

  Product(name: "Iced Americano", price: 20000, category: ProductCategory.iced),
  Product(name: "Iced Latte", price: 24000, category: ProductCategory.iced),
  Product(name: "Iced Lemon Tea", price: 15000, category: ProductCategory.iced),
  Product(name: "Iced Peach Tea", price: 17000, category: ProductCategory.iced),

  Product(name: "Butter Croissant", price: 180000, category: ProductCategory.pastry),
  Product(name: "Chocolate Croissant", price: 310000, category:  ProductCategory.pastry),
  Product(name: "Banana Bread", price: 100000, category: ProductCategory.pastry),
  Product(name: "Cookies", price: 98000, category: ProductCategory.pastry),
];
