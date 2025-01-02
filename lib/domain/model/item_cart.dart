class ItemCartClass {
  final String name;
  final String image;
  final double finalPrice;
  final List<dynamic> finalProperties;
  final int quantity;

  double get payPrice => finalPrice + 15.00;


    ItemCartClass({
        required this.name,
        required this.image,
        required this.finalPrice,
        required this.finalProperties,
        required this.quantity
    });
}