import 'dart:io';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:payment_app/constants/credit_cards.dart';
import 'package:payment_app/domain/model/credit_card.dart';
import 'package:payment_app/pages/pages.dart';
import 'package:payment_app/pages/widgets/widgets.dart';
import 'package:payment_app/services/bloc/payment/payment_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const String route = '/home_page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.only(left: 20),
          child: Row(
            children: [
              Expanded(child: Text("Payment")),
            ],
          ),
        ),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.add))],
      ),
      body: const CardList(),
    );
  }
}

class CardList extends StatefulWidget {
  const CardList({
    super.key,
  });

  @override
  State<CardList> createState() => _CardListState();
}

class _CardListState extends State<CardList> with TickerProviderStateMixin {
  late bool _selected;
  late AnimationController _controllerSelection;
  late AnimationController _controllerMovement;
  int? _selectedIndex;

  @override
  void initState() {
    _controllerSelection = AnimationController(
        vsync: this,
        lowerBound: 0.11,
        upperBound: 0.35,
        duration: const Duration(milliseconds: 400));
    _controllerMovement = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 400));
    _selected = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height * 2.5 / 4;

    return Center(
      heightFactor: 1,
      child: AnimatedBuilder(
        animation: _controllerSelection,
        builder: (context, child) {
          final selectionValue = _controllerSelection.value;
          return Column(
            children: [
              Transform(
                alignment: Alignment.center,
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.001)
                  ..rotateX(selectionValue),
                child: SizedBox(
                  height: height,
                  width: MediaQuery.sizeOf(context).width,
                  child: GestureDetector(
                    onTap: () {
                      if (!_selected) {
                        _controllerSelection.forward().whenComplete(() {
                          setState(() {
                            _selected = true;
                          });
                        });
                      }
                    },
                    child: AbsorbPointer(
                      absorbing: !_selected,
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          ...List.generate(cards.length, (index) {
                            final card = cards[index];
                            return CreditCardTranslated(
                              index: index,
                              height: height / 1.5,
                              percentage: selectionValue,
                              yFactor: _getCurrentFactor(index),
                              card: card,
                              onTap: (card) {
                                _onTap(card, index);
                              },
                              animation: _controllerMovement,
                            );
                          }).reversed,
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              if (_selected)
                FadeIn(
                  duration: const Duration(milliseconds: 300),
                  child: MaterialButton(
                    onPressed: () {
                      _controllerSelection.reverse();
                      setState(() {
                        _selected = false;
                      });
                    },
                    color: const Color(0xff284879),
                    height: 45,
                    shape: const CircleBorder(),
                    child: const Icon(Icons.arrow_back_ios_rounded,
                        color: Colors.white),
                  ),
                ),
              const SizedBox(height: 20),
              PurchasePayment(
                  icon: Platform.isIOS
                      ? FontAwesomeIcons.apple
                      : FontAwesomeIcons.google)
            ],
          );
        },
      ),
    );
  }

  Future<void> _onTap(CreditCardCustom cardData, int index) async {
    context.read<PaymentBloc>().add(OnSelectedCard(card: cardData));
    setState(() {
      _selectedIndex = index;
    });
    const Duration duration = Duration(milliseconds: 500);
    _controllerMovement.forward();
    await Navigator.push(
        context,
        PageRouteBuilder(
            transitionDuration: duration,
            reverseTransitionDuration: duration,
            pageBuilder: (ctx, animation, _) => FadeTransition(
                opacity: animation, child: const PaymentScreen())));
    _controllerMovement.reverse(from: 1.0);
  }

  @override
  void dispose() {
    _controllerMovement.dispose();
    _controllerSelection.dispose();
    super.dispose();
  }

  _getCurrentFactor(int currentIndex) {
    if (_selectedIndex == null || _selectedIndex == currentIndex) {
      return 0;
    } else if (currentIndex > _selectedIndex!) {
      return -1;
    } else {
      return 1;
    }
  }
}

class CreditCardTranslated extends AnimatedWidget {
  const CreditCardTranslated(
      {required this.height,
      required this.percentage,
      required this.card,
      required this.index,
      required this.yFactor,
      required this.onTap,
      required this.animation,
      super.key})
      : super(listenable: animation);

  final double height;
  final double percentage;
  final CreditCardCustom card;
  final int index;
  final int yFactor;
  final Animation<double> animation;
  final ValueChanged<CreditCardCustom> onTap;

  @override
  Widget build(BuildContext context) {
    final space = height / 2.0;
    return Positioned(
        left: 0,
        right: 0,
        top: height / 1.2 + -index * space * percentage,
        child: Opacity(
          opacity: yFactor == 0 ? 1 : 1 - animation.value,
          child: Hero(
            tag: card,
            child: Transform(
                alignment: Alignment.center,
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.001)
                  ..translate(
                      0.0,
                      yFactor *
                          animation.value *
                          MediaQuery.sizeOf(context).height,
                      index * 50.0),
                child: GestureDetector(
                  onTap: () {
                    onTap(card);
                  },
                  child: CreditCardWidget(
                      isSwipeGestureEnabled: false,
                      cardNumber: card.cardNumber,
                      expiryDate: card.expiracyDate,
                      cardHolderName: card.cardHolderName,
                      cvvCode: card.cvv,
                      showBackView: false,
                      onCreditCardWidgetChange: (_) {}),
                )),
          ),
        ));
  }
}
