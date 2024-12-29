import 'package:flutter/material.dart';
import 'package:payment_app/main.dart';

Future loadingPayment () async{

  return showDialog(context: navigationKey.currentContext!, 
  barrierDismissible: false,
  builder: (_) {
   return AlertDialog.adaptive(
    content: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          const Text("Doing the payment, wait a moment."),
          const SizedBox(height: 10),
          LinearProgressIndicator(color: Colors.blue[800], borderRadius: BorderRadius.circular(10))
        ],
      ),
    ),
   );
  }
  );
}

Future customAlertMessage ({
  required Widget title,
  required Widget content,
}) async{

  return showDialog(context: navigationKey.currentContext!, 
  barrierDismissible: false,
  builder: (_) {
   return AlertDialog.adaptive(
    title: title,
    content: content,
    actions: [
      MaterialButton(
        onPressed: () => navigationKey.currentState?.pop(),
        child: const Text("OK"))
    ],
   );
  }
  );
}