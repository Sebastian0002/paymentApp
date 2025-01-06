class ItemCategory with ChangeSelectedCategory {
  final String name;
  final EnumItemCategory category;


  ItemCategory({
    required this.name,
    required this.category,
  });
}

mixin ChangeSelectedCategory{
  bool? isSelected = false;
  set setSelected (bool isSelected) => this.isSelected = isSelected;

}

enum EnumItemCategory {
  all,
  headphones,
  smartphones,
  laptops,
  consoles,
  clothes,
}