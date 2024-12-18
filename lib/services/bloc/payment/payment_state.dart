part of 'payment_bloc.dart';

sealed class PaymentState extends Equatable {
  const PaymentState({
    this.amount = 0, 
    this.moneyIso = 'USD',
    this.isSelectedCard = false,
    this.isShowDetails = false,
    this.selectedCard
  });

  final double amount;
  final String moneyIso;
  final bool isSelectedCard;
  final CreditCardCustom? selectedCard;
  final bool isShowDetails;

  PaymentInitialState copyWith ({
    double? amount,
    String? moneyIso,
    bool? isSelectedCard,
    CreditCardCustom? selectedCard,
    bool? isShowDetails
  }) => 
    PaymentInitialState(
      amount: amount ?? this.amount,
      moneyIso: moneyIso ?? this.moneyIso,
      isSelectedCard: isSelectedCard ?? this.isSelectedCard,
      selectedCard: selectedCard ?? this.selectedCard,
      isShowDetails: isShowDetails ?? this.isShowDetails
    );

  @override
  List<Object?> get props => [amount, moneyIso, isSelectedCard, selectedCard, isShowDetails];
}

final class PaymentInitialState extends PaymentState {

  const PaymentInitialState({
    super.amount,
    super.isSelectedCard,
    super.moneyIso,
    super.selectedCard,
    super.isShowDetails
  });

}
