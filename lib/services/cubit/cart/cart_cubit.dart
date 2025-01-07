import 'package:bloc/bloc.dart';
import 'package:payment_app/domain/model/item_cart.dart';
import 'package:payment_app/domain/model/stripe_custom_response.dart';
import 'package:payment_app/services/stripe_service.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());
  final _stripe = StripeService();

  bool _itemExist(ItemCartClass item) =>
     state.itemsCart.any((e) => e.id == item.id);

  ItemCartClass _getItem(ItemCartClass item) =>
      state.itemsCart.firstWhere((e) => e.id == item.id);

  void addItem(ItemCartClass item) {
    final List<ItemCartClass> tempItemList = List.from(state.itemsCart);

    if (_itemExist(item)) {
      final ItemCartClass element = _getItem(item);
      final index = tempItemList.indexOf(element);
      tempItemList.remove(element);
      tempItemList.insert(
          index, element..setQuantity = state.itemsCart[index].quantity + 1);
    } else {
      tempItemList.add(item);
    }
    emit(ModifyCartState(modifyItemsCart: tempItemList));
  }

  void decraseItemQuantity(ItemCartClass item) {
    final List<ItemCartClass> tempItemList = List.from(state.itemsCart);
    final ItemCartClass element = _getItem(item);
    if (element.quantity == 1) {
      tempItemList.remove(element);
    } else {
      final index = tempItemList.indexOf(element);
      tempItemList.remove(element);
      tempItemList.insert(index, element..setQuantity = element.quantity - 1);
    }
    emit(ModifyCartState(modifyItemsCart: tempItemList));
  }

  void removeItem(ItemCartClass item) {
    final List<ItemCartClass> tempItemList = List.from(state.itemsCart);
    tempItemList.remove(_getItem(item));
    emit(ModifyCartState(modifyItemsCart: tempItemList));
  }

  Future<StripeCustomResponse> doPay()async{
    final String amount = (state.total*100).floor().toString();
    final res = await _stripe.normalPay(amount: amount, currency: state.currency);
    if(res.res) emit(CartInitial());
    return res;
  }
}