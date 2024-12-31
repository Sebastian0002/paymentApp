import 'package:flutter/material.dart';
import 'package:payment_app/domain/model/item.dart';
import 'package:payment_app/ui/pages/description/description_page.dart';

class CardItem extends StatelessWidget {
  const CardItem({super.key, required this.item});

  final Item item;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (_)=> const DescriptionPage()));
      },
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            width: 160,
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey[200],
            ),
            child: Image.asset(item.image),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 95,
                      child: Text(item.name, style: TextStyle( fontWeight: FontWeight.w600, fontSize: 12,color: Colors.grey[600]),)),
                    Row(
                      children: [
                        const Icon(Icons.star_rate_rounded, color: Colors.amber),
                        Text(item.stars.toString()),
                      ],
                    ),
                  ],
                ),
                Text('\$${item.price}', style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w700),)
              ],
            ),
          ),
        ],
      ),
    );
  }
}