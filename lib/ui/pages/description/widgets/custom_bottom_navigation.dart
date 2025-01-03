import 'package:flutter/material.dart';
import 'package:payment_app/domain/model/item.dart';
import 'package:payment_app/ui/pages/constants/constants.dart';
import 'package:payment_app/ui/theme/custom_colors.dart';

class CustomBottomNavigation extends StatelessWidget {
  const CustomBottomNavigation({super.key, required this.item});

  final Item item;

  @override
  Widget build(BuildContext context) {

    return Container(
      decoration: const BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(blurRadius: 2, color: Colors.black54, offset: Offset(0, 1))
      ]),
      width: MediaQuery.sizeOf(context).width,
      height: getHeightOfBottomNavigatior(context),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("\$${item.price.toString()}", style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w600),),
            const SizedBox(width: 20),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: MaterialButton(
                onPressed: () {},
                minWidth: MediaQuery.sizeOf(context).width*0.45,
                height: 55,
                color: CustomColors.primary,
                child: const Text("Add to cart",
                    style: TextStyle(color: Colors.white, fontSize: 16)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
