import 'package:payment_app/constants/items.dart';
import 'package:payment_app/domain/model/item_category.dart';
import 'package:uuid/uuid.dart';

class Item {
  final String id = const Uuid().v4();
  final String name;
  final String image;
  final double price;
  final String stars;
  final String description;
  final int likes;
  final EnumItemCategory category;
  final Properties? properties;

  String? get defaultStorage => properties != null
      ? properties!.storages!.isNotEmpty
          ? 'Storage  ${getConvertedStorage(properties!.storages![0])} ${getStorageReference(properties!.storages![0])}'
          : null
      : null;
  String? get defaultColor => properties != null
      ? properties!.colors!.isNotEmpty
          ? 'Color ${properties!.colors![0]}'
          : null
      : null;
  String? get defaultSize => properties != null
      ? properties!.sizes!.isNotEmpty
          ? 'Size ${properties!.sizes![0]}'
          : null
      : null;

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

  String get formattedPrice => price.toStringAsFixed(2);
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
