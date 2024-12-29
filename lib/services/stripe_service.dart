import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:payment_app/domain/model/credit_card.dart';
import 'package:payment_app/domain/model/payment_intent_response.dart';
import 'package:payment_app/domain/model/stripe_custom_response.dart';

class StripeService {
  //We're going to create a Singleton to manage the same instance around all the application.
  StripeService._();
  static final StripeService _instance = StripeService._();
  factory StripeService() => _instance;

  static const String _paymentApi = 'https://api.stripe.com/v1/payment_intents';
  static const String _secretKey =
      'sk_test_51QWXP2FGFaaC8gsOnhxmoWoUX1QvzAijVKmaMjtGDlThLhsZ5Tf9o272tyZVWfRuadKInmeppNDJspG8WBOjaZPu004Jnehbph';
  static const String _publishableKey =
      'pk_test_51QWXP2FGFaaC8gsOwGvS5uTM7DitiQQz9rUZFJ6SGMQYdWcXinhYerpQntAnMRVAhLlus5nYMWYZFChV27DZGmsA00OtzfFUYu';

  void init() {
    Stripe.publishableKey = _publishableKey;
  }

  Future payWithExistingCard({
    required String amount,
    required String currency,
    required CreditCardCustom card
  }) async {

    try {
      final paymentMethod = await Stripe.instance.createPaymentMethod(
      params: PaymentMethodParams.card(
        paymentMethodData: PaymentMethodData(
          billingDetails: BillingDetails(
            name: card.cardHolderName,  // Usamos el nombre del titular de la tarjeta
          ),
        ),
      ),
    );
    
    await _doPayment(amount: amount, currency: currency, paymentMethod: paymentMethod);

    } catch (e) {
      log(e.toString());
    }
  }

  Future<StripeCustomResponse> payWithNewCard({
    required String amount,
    required String currency,
  }) async {
    try {
      final intent = await _createPaymentIntent(amount: amount, currency: currency);
      if(intent == null) return StripeCustomResponse(res: false, msg: 'Failed intent' );

      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: intent.clientSecret,
          merchantDisplayName: 'test',
        ));
      await Stripe.instance.presentPaymentSheet();

      return StripeCustomResponse(res: true);
    } on StripeException catch (e) {
      return StripeCustomResponse(res: false, msg: e.error.message);
    } catch (e){
      return StripeCustomResponse(res: false, msg: e.toString());
    }
  }

  Future payWithAppleGoogle({
    required String amount,
    required String currency,
  }) async {}

  Future<PaymentIntentResponse?> _createPaymentIntent({
    required String amount,
    required String currency,
  }) async {
    try {
      final Dio dio = Dio();

      final data = {"amount": amount, "currency": currency};

      final Options options = Options(
          contentType: Headers.formUrlEncodedContentType,
          headers: {
            'Authorization': 'Bearer $_secretKey', 
            'Content-Type' : 'application/x-www-form-urlencoded'
          });

      final res = await dio.post(_paymentApi, data: data, options: options);

      return PaymentIntentResponse.fromMap(res.data);
    } catch (e) {
      log("error: ${e.toString()}");
      return null;
    }
  }

  Future<StripeCustomResponse?> _doPayment(
      {required String amount,
      required String currency,
      required PaymentMethod paymentMethod}) async {

        try {
          final intent = await _createPaymentIntent(amount: amount, currency: currency);
          if(intent == null) return null;
          final paymentResult = await Stripe.instance.confirmSetupIntent(
            paymentIntentClientSecret: intent.clientSecret,
            params: PaymentMethodParams.cardFromMethodId(
              paymentMethodData: PaymentMethodDataCardFromMethod(paymentMethodId: paymentMethod.id)
            )
          );

          if(paymentResult.status == 'succeeded'){
            return StripeCustomResponse(res: true);
          }
          else{
            return StripeCustomResponse(res: false, msg: 'error to procesing payment');
          }

        } catch (e) {
          return StripeCustomResponse(res: false, msg: 'error: ${e.toString()}');
        }

      }
}
