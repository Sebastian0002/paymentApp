import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:payment_app/constants/items.dart';
import 'package:payment_app/ui/theme/custom_colors.dart';

class ItemCart extends StatelessWidget {
  const ItemCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(left: 10, bottom: 10, top: 10),
          padding: const EdgeInsets.all(15),
          width: 130,
          height: 130,
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(20),
          ),
          child: Image.asset(itemCart.image, fit: BoxFit.contain),
        ),
        const SizedBox(width: 15),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(itemCart.name, style: const TextStyle( fontWeight: FontWeight.w500, fontSize: 16),)),
                    const SizedBox(width: 10),
                    GestureDetector(
                      onTap: () {},
                      child:
                          const Icon(Icons.close, color: Colors.grey, size: 22),
                    )
                  ],
                ),
                const SizedBox(height: 5),
                ...itemCart.finalProperties.map((e) {
                  return Text(
                    e != null ? e.toString() : '',
                    style: TextStyle(
                        color: Colors.grey[600],
                        fontWeight: FontWeight.w500,
                        fontSize: 13),
                  );
                }),
                const SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        "\$${itemCart.finalPrice}",
                        style: const TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 20),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Row(
                      children: [
                        InkWell(
                          borderRadius: BorderRadius.circular(10),
                          onTap: (){},
                          child: Container(
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.black54)
                            ),
                            child: const Icon(FontAwesomeIcons.minus, size: 20, color: Colors.black54,),
                          ),
                        ),
                        const SizedBox(width: 10),
                        const Text("1", style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),),
                        const SizedBox(width: 10),
                        InkWell(
                          borderRadius: BorderRadius.circular(10),
                          onTap: (){},
                          child: Container(
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: CustomColors.primary, width: 2)
                            ),
                            child: Icon(Icons.add, size: 20, color: CustomColors.primary),
                          ),
                        ),
                      ]
                    )
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
