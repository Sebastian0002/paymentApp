part of 'payment_bloc.dart';

sealed class PaymentEvent extends Equatable {
  const PaymentEvent();

  @override
  List<Object> get props => [];
}

class OnSelectedCard extends PaymentEvent {

  final CreditCardCustom card;
  const OnSelectedCard({required this.card});

}

class OnUnselectedCard extends PaymentEvent {}


class SwitchShowDetailsCardEvent extends PaymentEvent {}
