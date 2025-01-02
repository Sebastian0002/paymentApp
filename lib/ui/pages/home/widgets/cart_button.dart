import 'package:flutter/material.dart';
import 'package:payment_app/ui/pages/pages.dart';

class CarButton extends StatelessWidget {
  const CarButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      width: 50,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Center(
            child: InkWell(
              borderRadius: BorderRadius.circular(100),
              onTap: (){
                Navigator.pushNamed(context, CartPage.route);
              },
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.black38
                  )
                ),
                child: const CircleAvatar(
                  backgroundColor: Colors.transparent,
                  child: Icon(Icons.shopping_cart_outlined, size: 20,),
                ),
              )),
          ),

          Positioned(
            top: 0.5,
            right: 0,
            child: Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blue,
              ),
              width: 22,
              height: 22,
              child: const Center(
                child: Text(
                  "2",
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700)
                  )
                ),
            ),
          ),
        ],
      ),
    );
  }
}