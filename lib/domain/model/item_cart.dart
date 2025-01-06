class ItemCartClass with ModifyCart {
  final String name;
  final String image;
  final double price;
  final List<dynamic> finalProperties;

  double get finalPrice => price * quantity;
  String get formattedPrice => finalPrice.toStringAsFixed(2);


    ItemCartClass({
        required this.name,
        required this.image,
        required this.price,
        required this.finalProperties,
    });
}

mixin ModifyCart {
  int quantity = 0;
  set setQuantity(int quantity) => this.quantity = quantity;
}