import 'package:payment_app/domain/model/credit_card.dart';

const List<CreditCardCustom> cards = <CreditCardCustom>[
    CreditCardCustom(
      cardNumberHidden: '**** 4242',
      cardNumber: '4242424242424242',
      brand: 'visa',
      cvv: '213',
      expiracyDate: '01/25',
      cardHolderName: 'Jhoann Martinez'
    ),
    CreditCardCustom(
      cardNumberHidden: '**** 5555',
      cardNumber: '5555555555554444',
      brand: 'mastercard',
      cvv: '213',
      expiracyDate: '01/25',
      cardHolderName: 'Hollman Gonzalez'
    ),
    CreditCardCustom(
      cardNumberHidden: '**** 3782',
      cardNumber: '378282246310005',
      brand: 'american express',
      cvv: '2134',
      expiracyDate: '01/25',
      cardHolderName: 'Sebastian Contreras'
    ),
    CreditCardCustom(
      cardNumberHidden: '**** 0005',
      cardNumber: '6200000000000005',
      brand: 'union pay',
      cvv: '195',
      expiracyDate: '01/26',
      cardHolderName: 'Sebastian Contreras'
    ),
    
  ];