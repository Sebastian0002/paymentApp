import 'package:flutter/material.dart';
import 'package:payment_app/ui/theme/custom_colors.dart';

class BodyHomeItems extends StatelessWidget {
  const BodyHomeItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(        
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Categories", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),),
              GestureDetector(
                onTap: (){},
                child: Text("See all", style: TextStyle(color: CustomColors.primary, fontWeight: FontWeight.w600, fontSize: 16)))
            ],
          )
        ],
      ),
    );
  }
}