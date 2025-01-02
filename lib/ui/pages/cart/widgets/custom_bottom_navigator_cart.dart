import 'package:flutter/material.dart';
import 'package:payment_app/services/stripe_service.dart';
import 'package:payment_app/ui/theme/custom_colors.dart';

class CustomBottomNavigatorCart extends StatelessWidget {
  const CustomBottomNavigatorCart({super.key, required this.payPrice});

  final double payPrice;

  @override
  Widget build(BuildContext context) {
    final stripe = StripeService();
    bool hasHomeIndicator() {
      final viewPadding = MediaQuery.of(context).viewPadding;
      return viewPadding.bottom > 0;
    }
    return Container(
      decoration: const BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(blurRadius: 2, color: Colors.black54, offset: Offset(0, 1))
      ]),
      width: MediaQuery.sizeOf(context).width,
      height: hasHomeIndicator() ? 100 : 70,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: MaterialButton(
            onPressed: () async{
              stripe.payWithNewCard(
                amount: '12.00', 
                currency: 'US'
              );
            },
            minWidth: MediaQuery.sizeOf(context).width*0.45,
            color: CustomColors.primary,
            child: Text("Pay for \$$payPrice",
                style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600)),
          ),
        ),
      ),
    );
  }
}