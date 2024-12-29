class ItemCategory {

  String name;
  Category category;

  ItemCategory({
    required this.name,
    required this.category
  });
}

enum Category {
  all,
  headphones,
  smartphones,
  laptops,
  consoles,
  clothes,
}