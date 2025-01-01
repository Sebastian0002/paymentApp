import 'package:payment_app/domain/model/item_category.dart';

class Item {
    final String name;
    final String image;
    final double price;
    final String stars;
    final String description;
    final int likes;
    final Category category;
    final Properties? properties;

    Item({
        required this.name,
        required this.image,
        required this.price,
        required this.stars,
        required this.description,
        required this.likes,
        required this.category,
        this.properties,
    });
}

class Properties {
    final List<dynamic>? colors;
    final List<dynamic>? storages;
    final List<dynamic>? sizes;

    Properties({
        this.colors = const [],
        this.storages = const [],
        this.sizes = const [],
    });
}
