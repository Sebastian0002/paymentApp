part of 'cart_cubit.dart';

sealed class CartState {
  final List<ItemCartClass> itemsCart;
  final double deliveryFee;
  const CartState({required this.itemsCart, this.deliveryFee = 15.00});
}

final class CartInitial extends CartState {
  CartInitial() : super(itemsCart: const []);
}

final class ModifyCartState extends CartState {
  final List<ItemCartClass> modifyItemsCart;
  ModifyCartState(
      {required this.modifyItemsCart})
      : super(itemsCart: modifyItemsCart);
}

final class CheckoutCartState extends CartState {
  final String currency = 'USD';
  final List<ItemCartClass> finalItems;
  final double currentDeliveryFee;
  CheckoutCartState(
      {required this.finalItems, required this.currentDeliveryFee})
      : super(itemsCart: finalItems);
}
