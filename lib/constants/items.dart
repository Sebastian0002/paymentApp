import 'package:flutter/material.dart';
import 'package:payment_app/domain/model/item.dart';
import 'package:payment_app/domain/model/item_cart.dart';
import 'package:payment_app/domain/model/item_category.dart';

const String _asset = 'assets/';

List<Item> items = [
  Item(
    name: "AirPods Pro 2nd Gen",
    image: "${_asset}airpods2.png",
    price: 300.55,
    stars: "4.0",
    description:
        "AirPods Pro 2nd Gen are Apple’s premium earbuds with advanced noise cancellation, adaptive transparency, personalized spatial audio, touch controls, and up to 6 hours of battery. The case has Find My tracking and MagSafe charging.",
    likes: 97,
    category: Category.headphones,
  ),
  Item(
    name: "Play Station 5",
    image: "${_asset}ps5.png",
    price: 999.99,
    stars: "4.8",
    description:
        "The PS5 is Sony's next-gen gaming console with 4K graphics, fast load times via an SSD, and immersive gameplay with ray tracing and 3D audio. It supports a vast game library and features the innovative DualSense controller.",
    likes: 50,
    category: Category.consoles,
  ),
  Item(
    name: "Xbox One",
    image: "${_asset}Xbox_one.png",
    price: 899.95,
    stars: "4.7",
    description:
        "The Xbox One is a Microsoft gaming console with HD graphics, entertainment apps, and online gaming via Xbox Live. It supports backward compatibility and features a library of games and multimedia capabilities.",
    likes: 35,
    category: Category.consoles,
  ),
  Item(
      name: "iPhone 16 Pro Max",
      image: "${_asset}iphone16.png",
      price: 1400,
      stars: "4.9",
      description:
          "The iPhone 16 Pro Max, released in September 2024, is Apple's most advanced smartphone to date. It features a 6.9-inch Super Retina XDR OLED display with a 120Hz refresh rate, providing vibrant visuals and smooth interactions.",
      likes: 100,
      category: Category.smartphones,
      properties: Properties(
          storages: [1024, 512, 256],
          colors: ["Blue", "Green", "Grey", "Black"])),
  Item(
      name: "iPhone 15 Pro Max",
      image: "${_asset}iphone15.png",
      price: 1000,
      stars: "4.5",
      description:
          "The iPhone 15 Pro Max is Apple’s flagship smartphone for 2023, featuring a lightweight titanium design, a 6.7-inch Super Retina XDR display with ProMotion technology, and the powerful A17 Pro chip. It introduces a 5x telephoto zoom camera, improved computational photography, and USB-C connectivity.",
      likes: 55,
      category: Category.smartphones,
      properties: Properties(
          storages: [512, 256, 128],
          colors: ["Blue", "Grey", "Black", "White"])),
  Item(
      name: "Samsung Galaxy S24 Ultra",
      image: "${_asset}galaxyS24.png",
      price: 990.99,
      stars: "4.5",
      description:
          "The Samsung Galaxy S24 Ultra, released in early 2024, is Samsung's flagship smartphone. It features a 6.8-inch Dynamic AMOLED 2X display with a 120Hz refresh rate, delivering vibrant visuals and smooth performance.",
      likes: 55,
      category: Category.smartphones,
      properties: Properties(storages: [
        1024,
        512,
      ], colors: [
        "Blue",
        "Green",
      ])),
  Item(
      name: "MacBook Pro",
      image: "${_asset}macBook.png",
      price: 4099.99,
      stars: "5.0",
      description:
          "The MacBook Pro is Apple's premium laptop, designed for professional users who need high performance and portability. Available in 14-inch and 16-inch models, it features a Liquid Retina XDR display with"
          " ProMotion for smooth visuals, and a powerful M-series chip (M2 Pro, M2 Max) that offers exceptional speed and efficiency for demanding tasks like video editing, software development, and 3D rendering.",
      likes: 55,
      category: Category.laptops,
      properties: Properties(storages: [
        2048,
        1024,
        512,
      ], colors: [
        "Metal grey",
        "Silver",
        "Gold",
      ])),
  Item(
      name: "Asus ROG Strix Scar 16",
      image: "${_asset}rogLaptop.png",
      price: 2199.99,
      stars: "4.9",
      description:
          "Equipped with the latest NVIDIA RTX 40-Series GPUs, this laptop delivers outstanding gaming performance. Its 16-inch display offers a balance between portability and screen real estate, making it ideal for gamers seeking high performance on the go.",
      likes: 55,
      category: Category.laptops,
      properties: Properties(storages: [
        2048,
        1024,
        512,
      ])),
  Item(
      name: "AirForce One",
      image: "${_asset}Nike_Air_Force_One.png",
      price: 150,
      stars: "4.5",
      description:
          "The Nike Air Force 1 is a popular and iconic line of sneakers first released by Nike in 1982. Originally designed by Bruce Kilgore, the Air Force 1 was the first basketball shoe to feature Nike’s Air cushioning technology, which helped revolutionize comfort in athletic footwear.",
      likes: 55,
      category: Category.clothes,
      properties: Properties(sizes: ["6", "7", "8", "9"])),
  Item(
      name: "T-Shirt Nike",
      image: "${_asset}Tshirtpng.png",
      price: 20.99,
      stars: "4.1",
      description:
          "A classic crewneck t-shirt made from Nike, breathable cotton, designed for comfort and style. Featuring a simple yet versatile design, it’s perfect for casual wear or layering.",
      likes: 70,
      category: Category.clothes,
      properties: Properties(sizes: ["S", "M", "L", "XL"])),
];

String getStorageReference(int storage) => storage < 1000 ? "GB" : "TB";

String getConvertedStorage(int storage) =>
    storage < 1000 ? storage.toString() : storage.toString().substring(0,1);

List<ItemCategory> categoryItems = [
  ItemCategory(name: "All", category: Category.all, isSelected: true),
  ItemCategory(name: "Laptops", category: Category.laptops),
  ItemCategory(name: "Headphones", category: Category.headphones),
  ItemCategory(name: "Consoles", category: Category.consoles),
  ItemCategory(name: "Smartphones", category: Category.smartphones),
  ItemCategory(name: "Clothes", category: Category.clothes),
];

List<BottomNavigationBarItem> bottomItems = [
  const BottomNavigationBarItem(
      icon: Icon(Icons.home), backgroundColor: Colors.white, label: "Home"),
  const BottomNavigationBarItem(
      icon: Icon(Icons.search), backgroundColor: Colors.white, label: "Search"),
  const BottomNavigationBarItem(
      icon: Icon(Icons.favorite),
      backgroundColor: Colors.white,
      label: "Favorites"),
  const BottomNavigationBarItem(
      icon: Icon(Icons.person_sharp),
      backgroundColor: Colors.white,
      label: "Profile"),
];

ItemCartClass itemCart = ItemCartClass(
  name: items[3].name, 
  image: items[3].image, 
  finalPrice: items[3].price, 
  finalProperties: [
    items[3].properties?.storages?[0],
    items[3].properties?.colors?[0],
  ],
  quantity: 1
);
