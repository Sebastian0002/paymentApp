import 'package:bloc/bloc.dart';
import 'package:payment_app/constants/items.dart';
import 'package:payment_app/domain/model/item.dart';
import 'package:payment_app/domain/model/item_category.dart';

part 'item_state.dart';

class ItemCubit extends Cubit<ItemState> {
  ItemCubit() : super(ItemInitial()){
    state.categories[0].setSelected = true;
  }

  void setFilterCategory(EnumItemCategory category) {
    final List<Item> newItems = [];
    final List<ItemCategory> newListCategories = [];

    category == EnumItemCategory.all
        ? newItems.addAll(items)
        : newItems.addAll(items.where((item) => item.category == category));
    for (var item in state.categories) {
        item.category == category
        ?newListCategories.add(item..setSelected = true)
        :newListCategories.add(item..setSelected = false);
    }
    emit(ChangeCategoryItemState(
        newItemsCategory: newItems,
        newCategory: category,
        changeOnCategoryList: state.categories));
  }
}
