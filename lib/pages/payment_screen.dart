import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:payment_app/pages/pages.dart';
import 'package:payment_app/pages/widgets/widgets.dart';
import 'package:payment_app/services/bloc/payment/payment_bloc.dart';

class PaymentScreen extends StatelessWidget {

  
  const PaymentScreen({
    super.key,
    });


  @override
  Widget build(BuildContext context) {
    final cardData = context.read<PaymentBloc>().state.selectedCard!;
    final Color? color = Colors.grey[700];
    return PopScope(
      canPop: true,
      onPopInvokedWithResult: (_, __) {
        context.read<PaymentBloc>().add(OnUnselectedCard());
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Card payment section"),
        ),
      
        body: Padding(
          padding: const EdgeInsets.only(top: 40),
          child: BlocBuilder<PaymentBloc, PaymentState>(
            builder: (context, state) {
              return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Hero(
                        tag: cardData,
                        child: CreditCardWidget(
                          cardNumber: cardData.cardNumber, 
                          expiryDate: cardData.expiracyDate, 
                          cardHolderName: cardData.cardHolderName, 
                          cvvCode: cardData.cvv, 
                          showBackView: false,
                          obscureCardCvv: !state.isShowDetails, 
                          obscureCardNumber: !state.isShowDetails,
                          onCreditCardWidgetChange: (_){}),
                      ),
                  
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Column(
                          children: [
                            MaterialButton(
                              onPressed: (){
                                Navigator.push(context, MaterialPageRoute(builder: (_)=> CardDetailsScreen(cardData: cardData)));
                              }, 
                              shape: const CircleBorder(),
                              color: Colors.white,
                              height: 40,
                              child: Icon(Icons.info_outline, color: color),  
                            ),
                            Text("SEE CARD DETAILS", style: TextStyle(color: color))
                          ],
                        ),
                      ),
                      BoxShortDetailsCard(card: cardData),
                      const SizedBox(height: 50),
                      const PurchasePayment(icon: FontAwesomeIcons.creditCard)
                    ],
                  );
            },
          ),
        ),
      ),
    );
  }
}
