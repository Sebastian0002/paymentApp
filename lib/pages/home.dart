import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:payment_app/constants/credit_cards.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const String route = '/home_page';

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.only(left: 20),
          child: Row(
            children: [
              Expanded(child: Text("Payment")),
            ],
          ),
        ),
        actions: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.add))
        ],
      ),
      body: const CardList(),
    );
  }
}

class CardList extends StatelessWidget {
  const CardList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: cards.length,
      scrollDirection: Axis.vertical,
      itemBuilder: (BuildContext context, int index) {
        final card = cards[index];
        return Transform.translate(
          offset: Offset(5.0*index, (-150.0*index)),

          child: GestureDetector(
            onTap: (){
              log("hola mundo $index");
            },
            child: CreditCardWidget(
              isSwipeGestureEnabled: false,
              glassmorphismConfig: Glassmorphism(
                blurX: 10.0,
                blurY: 10.0,
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[
                    Colors.grey.withAlpha(20),
                    Colors.white.withAlpha(20),
                  ],
                  stops: const <double>[
                    0.3,
                    0,
                  ],
                ),
              ),
              cardNumber: card.cardNumber, 
              expiryDate: card.expiracyDate, 
              cardHolderName: card.cardHolderName, 
              cvvCode: card.cvv, 
              showBackView: false,
              onCreditCardWidgetChange: (_){}),
          ),
        );
      },
    );
  }
}
