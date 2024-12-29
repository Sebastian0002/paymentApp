import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:payment_app/domain/model/credit_card.dart';
import 'package:payment_app/ui/pages/widgets/widgets.dart';
import 'package:payment_app/services/bloc/blocs.dart';

class CardDetailsScreen extends StatelessWidget {
  
  const CardDetailsScreen({
    super.key,
    required this.cardData
    });

  final CreditCardCustom cardData;


  @override
  Widget build(BuildContext context) {
    final Color? color = Colors.grey[700];
    return Scaffold(
      appBar: AppBar(
        title: const Text("Card Details"),
      ),

      body: Padding(
        padding: const EdgeInsets.only(top: 40),
        child: BlocBuilder<PaymentBloc, PaymentState>(
          builder: (context, state) {
            return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CreditCardWidget(
                      cardNumber: cardData.cardNumber, 
                      expiryDate: cardData.expiracyDate, 
                      cardHolderName: cardData.cardHolderName, 
                      cvvCode: cardData.cvv, 
                      showBackView: false,
                      obscureCardCvv: !state.isShowDetails, 
                      obscureCardNumber: !state.isShowDetails,
                      onCreditCardWidgetChange: (_){}),
                
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              MaterialButton(
                                onPressed: (){}, 
                                shape: const CircleBorder(),
                                color: Colors.white,
                                height: 40,
                                child: Icon(Icons.delete, color: color),  
                              ),
                              Text("Delete card", style: TextStyle(color: color))
                            ],
                          ),
                          Column(
                            children: [
                              MaterialButton(
                                onPressed: (){}, 
                                shape: const CircleBorder(),
                                color: Colors.white,
                                height: 40,
                                child: Icon(Icons.more_horiz, color: color),  
                              ),
                              Text("More", style: TextStyle(color: color))
                            ],
                          ),
                        ],
                      ),
                    ),
                    BoxDetailsCard(card: cardData)
                  ],
                );
          },
        ),
      ),
    );
  }
}