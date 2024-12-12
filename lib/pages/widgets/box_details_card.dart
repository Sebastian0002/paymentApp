import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:payment_app/bloc/card/card_bloc.dart';
import 'package:payment_app/domain/model/credit_card.dart';

class BoxDetailsCard extends StatelessWidget {
  const BoxDetailsCard({super.key, required this.card});

  final CreditCardCustom card;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CardBloc, CardState>(
      builder: (context, state) {
        
        final cardBloc = context.read<CardBloc>();

        return Container(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "CARD INFORMATION",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                  ),
                  InkWell(
                    onTap: () {
                      cardBloc.add(ShowDetailsCardEvent(isShowDetails: !state.isShowDetails));
                    },
                    splashColor: Colors.transparent,
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 15),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey[400]!),
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        children: [
                          FaIcon(
                            state.isShowDetails ? FontAwesomeIcons.eye : FontAwesomeIcons.eyeSlash,
                            color: Colors.grey[700],
                            size: 18,
                          ),
                          const SizedBox(width: 10),
                          Text(state.isShowDetails ? "Hide info" : "Show info" )
                        ],
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 20),
              _RowInfo(
                  icon: Icons.credit_card_rounded,
                  title: "Card Owner",
                  value: card.cardHolderName),
              const SizedBox(height: 20),
              _RowInfo(
                  icon: Icons.numbers_rounded,
                  title: "Card Number",
                  value: state.isShowDetails 
                  ? card.cardNumber
                  : card.cardNumberHidden
                  ),
              const SizedBox(height: 20),
              _RowInfo(
                  icon: Icons.date_range_rounded,
                  title: "Expiry date",
                  value: card.expiracyDate),
              const SizedBox(height: 20),
              _RowInfo(
                icon: Icons.lock, 
                title: "CVV", 
                value: state.isShowDetails ? card.cvv : "***"),
            ],
          ),
        );
      },
    );
  }
}
class BoxShortDetailsCard extends StatelessWidget {
  const BoxShortDetailsCard({super.key, required this.card});

  final CreditCardCustom card;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CardBloc, CardState>(
      builder: (context, state) {
        
        final cardBloc = context.read<CardBloc>();

        return Container(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "SHORT DETAILS",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                  ),
                  InkWell(
                    onTap: () {
                      cardBloc.add(ShowDetailsCardEvent(isShowDetails: !state.isShowDetails));
                    },
                    splashColor: Colors.transparent,
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 15),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey[400]!),
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        children: [
                          FaIcon(
                            state.isShowDetails ? FontAwesomeIcons.eye : FontAwesomeIcons.eyeSlash,
                            color: Colors.grey[700],
                            size: 18,
                          ),
                          const SizedBox(width: 10),
                          Text(state.isShowDetails ? "Hide info" : "Show info" )
                        ],
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 20),
              _RowInfo(
                  icon: Icons.date_range_rounded,
                  title: "Expiry date",
                  value: card.expiracyDate),
              const SizedBox(height: 20),
              _RowInfo(
                icon: Icons.lock, 
                title: "CVV", 
                value: state.isShowDetails ? card.cvv : "***"),
            ],
          ),
        );
      },
    );
  }
}

class _RowInfo extends StatelessWidget {
  const _RowInfo({
    required this.icon,
    required this.title,
    required this.value,
  });
  final IconData icon;
  final String title;
  final String value;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 234, 234, 234),
                borderRadius: BorderRadius.circular(5)),
            child: Icon(icon),
          ),
          const SizedBox(width: 10),
          Text(title, style: TextStyle(fontSize: 15, color: Colors.grey[700])),
          Expanded(
              child: Text(value,
                  style: const TextStyle(
                      fontWeight: FontWeight.w600, fontSize: 16),
                  textAlign: TextAlign.right))
        ],
      ),
    );
  }
}
