
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PurchasePayment extends StatelessWidget {
  const PurchasePayment({
    super.key,
    required this.icon
  });

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      width: double.infinity,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            blurRadius: 4,
            color: Colors.black87,
            offset: Offset(0, 2)
          )
        ]
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Total", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                Text("350.55 USD", style: TextStyle(fontSize: 15))
              ],
            ),
        
            MaterialButton(
              onPressed: (){},
              color: Colors.black,
              height: 45,
              minWidth: 150,
              shape: const StadiumBorder(),
              child: Row(
                children: [
                  FaIcon(
                    icon,
                    color: Colors.white),
                  const SizedBox(width: 15),
                  const Text("Pay", style: TextStyle(color: Colors.white, fontSize: 17),)
                ],
              ),
              )
        
          ],
        ),
      ),
    );
  }
}