part of 'cart_cubit.dart';

sealed class CartState {
  final List<ItemCartClass> itemsCart;
  final double deliveryFee;
  final String currency;
  const CartState(
      {required this.itemsCart,
      this.deliveryFee = 15.00,
      this.currency = 'USD'});
  double get _subTotal {
    double subtotal = 0.0;
    for (var item in itemsCart) {
      subtotal += item.finalPrice;
    }
    return subtotal;
  }

  double get total => _subTotal != 0.0 ? (_subTotal + deliveryFee) : _subTotal;
  String get formattedSubtotal => _subTotal.toStringAsFixed(2);
  String get formattedTotal => total.toStringAsFixed(2);
}

final class CartInitial extends CartState {
  CartInitial() : super(itemsCart: const []);
}

final class ModifyCartState extends CartState {
  final List<ItemCartClass> modifyItemsCart;
  ModifyCartState({required this.modifyItemsCart})
      : super(itemsCart: modifyItemsCart);
}
