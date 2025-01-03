import 'package:flutter/material.dart';
import 'package:payment_app/domain/model/item.dart';
import 'package:payment_app/ui/pages/description/description_page.dart';

class CardItem extends StatelessWidget {
  const CardItem({super.key, required this.item});

  final Item item;

  @override
  Widget build(BuildContext context) {
    const Duration duration = Duration(milliseconds: 300);
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            PageRouteBuilder(
            transitionDuration: duration ,
            reverseTransitionDuration: duration,
            pageBuilder: (ctx, animation, _) => FadeTransition(
                opacity: animation, child: DescriptionPage(item: item))));
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
            child: Hero(
              tag: 'Image-hero-${item.image}',
              child: Image.asset(item.image)),
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
                        child: Text(
                          item.name,
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 12,
                              color: Colors.grey[600]),
                        )),
                    Row(
                      children: [
                        const Icon(Icons.star_rate_rounded,
                            color: Colors.amber),
                        Text(item.stars.toString()),
                      ],
                    ),
                  ],
                ),
                Text(
                  '\$${item.formattedPrice}',
                  style: const TextStyle(
                      fontSize: 17, fontWeight: FontWeight.w700),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
