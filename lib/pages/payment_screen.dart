import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:payment_app/bloc/card/card_bloc.dart';
import 'package:payment_app/domain/model/credit_card.dart';
import 'package:payment_app/pages/pages.dart';
import 'package:payment_app/pages/widgets/widgets.dart';

class PaymentScreen extends StatelessWidget {
  
  static String route = "/payment_screen";
  
  const PaymentScreen({
    super.key,
    required this.cardData
    });

  final CreditCardCustom cardData;


  @override
  Widget build(BuildContext context) {
    final Color? color = Colors.grey[700];
    return Scaffold(
      appBar: AppBar(
        title: const Text("Card payment section"),
      ),

      body: Padding(
        padding: const EdgeInsets.only(top: 40),
        child: BlocBuilder<CardBloc, CardState>(
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
    );
  }
}
