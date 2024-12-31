class ItemCategory {

  final String name;
  final Category category;
  final bool? isSelected;


  ItemCategory({
    required this.name,
    required this.category,
    this.isSelected = false
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