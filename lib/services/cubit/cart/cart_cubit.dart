import 'package:bloc/bloc.dart';
import 'package:payment_app/domain/model/item_cart.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  void addItem(ItemCartClass item) {
    final List<ItemCartClass> tempItemList = List.from(state.itemsCart);
    if (tempItemList.contains(item)) {
      final index = tempItemList.indexOf(item);
      tempItemList.remove(item);
      tempItemList.insert(index, item..setQuantity = item.quantity + 1);
    }
    else{
      tempItemList.add(item);
    }
    emit(ModifyCartState(modifyItemsCart: tempItemList));
  }

  void decraseItemQuantity(ItemCartClass item) {
    final List<ItemCartClass> tempItemList = List.from(state.itemsCart);
    if (item.quantity == 1) {
      tempItemList.remove(item);
    } else {
      final index = tempItemList.indexOf(item);
      tempItemList.remove(item);
      tempItemList.insert(index, item..setQuantity = item.quantity - 1);
    }
    emit(ModifyCartState(modifyItemsCart: tempItemList));
  }

  void removeItem(ItemCartClass item) {
    final List<ItemCartClass> tempItemList = List.from(state.itemsCart);
    tempItemList.remove(item);
    emit(ModifyCartState(modifyItemsCart: tempItemList));
  }

  double get subTotal{
    double subtotal = 0.0;
    for (var item in state.itemsCart) {
      subtotal += item.finalPrice;
    }
    return subtotal;
  }

}
