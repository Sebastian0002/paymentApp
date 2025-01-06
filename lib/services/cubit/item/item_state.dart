part of 'item_cubit.dart';

sealed class ItemState {
  final List<Item> currentItemsCategory;
  final EnumItemCategory category;
  final List<ItemCategory> categories;
  const ItemState(
      {required this.currentItemsCategory,
      required this.category,
      this.categories = const []});
}

final class ItemInitial extends ItemState {
  ItemInitial()
      : super(
            currentItemsCategory: items,
            category: EnumItemCategory.all,
            categories: categoryItems);
}

final class ChangeCategoryItemState extends ItemState {
  final List<Item> newItemsCategory;
  final EnumItemCategory newCategory;
  final List<ItemCategory> changeOnCategoryList;
  ChangeCategoryItemState(
      {required this.newItemsCategory,
      required this.newCategory,
      required this.changeOnCategoryList})
      : super(
            currentItemsCategory: newItemsCategory,
            category: newCategory,
            categories: changeOnCategoryList);
}
