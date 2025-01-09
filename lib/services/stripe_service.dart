import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
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

  Future<StripeCustomResponse> doPay({
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
}
