import 'dart:convert';

class PaymentIntentResponse {
    final String id;
    final String object;
    final int amount;
    final int amountCapturable;
    final AmountDetails amountDetails;
    final int amountReceived;
    final dynamic application;
    final dynamic applicationFeeAmount;
    final AutomaticPaymentMethods automaticPaymentMethods;
    final dynamic canceledAt;
    final dynamic cancellationReason;
    final String captureMethod;
    final String clientSecret;
    final String confirmationMethod;
    final int created;
    final String currency;
    final dynamic customer;
    final dynamic description;
    final dynamic invoice;
    final dynamic lastPaymentError;
    final dynamic latestCharge;
    final bool livemode;
    final Metadata metadata;
    final dynamic nextAction;
    final dynamic onBehalfOf;
    final dynamic paymentMethod;
    final PaymentMethodConfigurationDetails paymentMethodConfigurationDetails;
    final PaymentMethodOptionsCustom paymentMethodOptionsCustom;
    final List<String> paymentMethodTypes;
    final dynamic processing;
    final dynamic receiptEmail;
    final dynamic review;
    final dynamic setupFutureUsage;
    final dynamic shipping;
    final dynamic source;
    final dynamic statementDescriptor;
    final dynamic statementDescriptorSuffix;
    final String status;
    final dynamic transferData;
    final dynamic transferGroup;

    PaymentIntentResponse({
        required this.id,
        required this.object,
        required this.amount,
        required this.amountCapturable,
        required this.amountDetails,
        required this.amountReceived,
        required this.application,
        required this.applicationFeeAmount,
        required this.automaticPaymentMethods,
        required this.canceledAt,
        required this.cancellationReason,
        required this.captureMethod,
        required this.clientSecret,
        required this.confirmationMethod,
        required this.created,
        required this.currency,
        required this.customer,
        required this.description,
        required this.invoice,
        required this.lastPaymentError,
        required this.latestCharge,
        required this.livemode,
        required this.metadata,
        required this.nextAction,
        required this.onBehalfOf,
        required this.paymentMethod,
        required this.paymentMethodConfigurationDetails,
        required this.paymentMethodOptionsCustom,
        required this.paymentMethodTypes,
        required this.processing,
        required this.receiptEmail,
        required this.review,
        required this.setupFutureUsage,
        required this.shipping,
        required this.source,
        required this.statementDescriptor,
        required this.statementDescriptorSuffix,
        required this.status,
        required this.transferData,
        required this.transferGroup,
    });

    factory PaymentIntentResponse.fromJson(String str) => PaymentIntentResponse.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory PaymentIntentResponse.fromMap(Map<String, dynamic> json) => PaymentIntentResponse(
        id: json["id"],
        object: json["object"],
        amount: json["amount"],
        amountCapturable: json["amount_capturable"],
        amountDetails: AmountDetails.fromMap(json["amount_details"]),
        amountReceived: json["amount_received"],
        application: json["application"],
        applicationFeeAmount: json["application_fee_amount"],
        automaticPaymentMethods: AutomaticPaymentMethods.fromMap(json["automatic_payment_methods"]),
        canceledAt: json["canceled_at"],
        cancellationReason: json["cancellation_reason"],
        captureMethod: json["capture_method"],
        clientSecret: json["client_secret"],
        confirmationMethod: json["confirmation_method"],
        created: json["created"],
        currency: json["currency"],
        customer: json["customer"],
        description: json["description"],
        invoice: json["invoice"],
        lastPaymentError: json["last_payment_error"],
        latestCharge: json["latest_charge"],
        livemode: json["livemode"],
        metadata: Metadata.fromMap(json["metadata"]),
        nextAction: json["next_action"],
        onBehalfOf: json["on_behalf_of"],
        paymentMethod: json["payment_method"],
        paymentMethodConfigurationDetails: PaymentMethodConfigurationDetails.fromMap(json["payment_method_configuration_details"]),
        paymentMethodOptionsCustom: PaymentMethodOptionsCustom.fromMap(json["payment_method_options"]),
        paymentMethodTypes: List<String>.from(json["payment_method_types"].map((x) => x)),
        processing: json["processing"],
        receiptEmail: json["receipt_email"],
        review: json["review"],
        setupFutureUsage: json["setup_future_usage"],
        shipping: json["shipping"],
        source: json["source"],
        statementDescriptor: json["statement_descriptor"],
        statementDescriptorSuffix: json["statement_descriptor_suffix"],
        status: json["status"],
        transferData: json["transfer_data"],
        transferGroup: json["transfer_group"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "object": object,
        "amount": amount,
        "amount_capturable": amountCapturable,
        "amount_details": amountDetails.toMap(),
        "amount_received": amountReceived,
        "application": application,
        "application_fee_amount": applicationFeeAmount,
        "automatic_payment_methods": automaticPaymentMethods.toMap(),
        "canceled_at": canceledAt,
        "cancellation_reason": cancellationReason,
        "capture_method": captureMethod,
        "client_secret": clientSecret,
        "confirmation_method": confirmationMethod,
        "created": created,
        "currency": currency,
        "customer": customer,
        "description": description,
        "invoice": invoice,
        "last_payment_error": lastPaymentError,
        "latest_charge": latestCharge,
        "livemode": livemode,
        "metadata": metadata.toMap(),
        "next_action": nextAction,
        "on_behalf_of": onBehalfOf,
        "payment_method": paymentMethod,
        "payment_method_configuration_details": paymentMethodConfigurationDetails.toMap(),
        "payment_method_options": paymentMethodOptionsCustom.toMap(),
        "payment_method_types": List<dynamic>.from(paymentMethodTypes.map((x) => x)),
        "processing": processing,
        "receipt_email": receiptEmail,
        "review": review,
        "setup_future_usage": setupFutureUsage,
        "shipping": shipping,
        "source": source,
        "statement_descriptor": statementDescriptor,
        "statement_descriptor_suffix": statementDescriptorSuffix,
        "status": status,
        "transfer_data": transferData,
        "transfer_group": transferGroup,
    };
}

class AmountDetails {
    final Metadata tip;

    AmountDetails({
        required this.tip,
    });

    factory AmountDetails.fromJson(String str) => AmountDetails.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory AmountDetails.fromMap(Map<String, dynamic> json) => AmountDetails(
        tip: Metadata.fromMap(json["tip"]),
    );

    Map<String, dynamic> toMap() => {
        "tip": tip.toMap(),
    };
}

class Metadata {
    Metadata();

    factory Metadata.fromJson(String str) => Metadata.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Metadata.fromMap(Map<String, dynamic> json) => Metadata(
    );

    Map<String, dynamic> toMap() => {
    };
}

class AutomaticPaymentMethods {
    final String allowRedirects;
    final bool enabled;

    AutomaticPaymentMethods({
        required this.allowRedirects,
        required this.enabled,
    });

    factory AutomaticPaymentMethods.fromJson(String str) => AutomaticPaymentMethods.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory AutomaticPaymentMethods.fromMap(Map<String, dynamic> json) => AutomaticPaymentMethods(
        allowRedirects: json["allow_redirects"],
        enabled: json["enabled"],
    );

    Map<String, dynamic> toMap() => {
        "allow_redirects": allowRedirects,
        "enabled": enabled,
    };
}

class PaymentMethodConfigurationDetails {
    final String id;
    final dynamic parent;

    PaymentMethodConfigurationDetails({
        required this.id,
        required this.parent,
    });

    factory PaymentMethodConfigurationDetails.fromJson(String str) => PaymentMethodConfigurationDetails.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory PaymentMethodConfigurationDetails.fromMap(Map<String, dynamic> json) => PaymentMethodConfigurationDetails(
        id: json["id"],
        parent: json["parent"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "parent": parent,
    };
}

class PaymentMethodOptionsCustom {
    final AmazonPay amazonPay;
    final Card card;
    final Metadata cashapp;
    final Klarna klarna;
    final Link link;

    PaymentMethodOptionsCustom({
        required this.amazonPay,
        required this.card,
        required this.cashapp,
        required this.klarna,
        required this.link,
    });

    factory PaymentMethodOptionsCustom.fromJson(String str) => PaymentMethodOptionsCustom.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory PaymentMethodOptionsCustom.fromMap(Map<String, dynamic> json) => PaymentMethodOptionsCustom(
        amazonPay: AmazonPay.fromMap(json["amazon_pay"]),
        card: Card.fromMap(json["card"]),
        cashapp: Metadata.fromMap(json["cashapp"]),
        klarna: Klarna.fromMap(json["klarna"]),
        link: Link.fromMap(json["link"]),
    );

    Map<String, dynamic> toMap() => {
        "amazon_pay": amazonPay.toMap(),
        "card": card.toMap(),
        "cashapp": cashapp.toMap(),
        "klarna": klarna.toMap(),
        "link": link.toMap(),
    };
}

class AmazonPay {
    final dynamic expressCheckoutElementSessionId;

    AmazonPay({
        required this.expressCheckoutElementSessionId,
    });

    factory AmazonPay.fromJson(String str) => AmazonPay.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory AmazonPay.fromMap(Map<String, dynamic> json) => AmazonPay(
        expressCheckoutElementSessionId: json["express_checkout_element_session_id"],
    );

    Map<String, dynamic> toMap() => {
        "express_checkout_element_session_id": expressCheckoutElementSessionId,
    };
}

class Card {
    final dynamic installments;
    final dynamic mandateOptions;
    final dynamic network;
    final String requestThreeDSecure;

    Card({
        required this.installments,
        required this.mandateOptions,
        required this.network,
        required this.requestThreeDSecure,
    });

    factory Card.fromJson(String str) => Card.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Card.fromMap(Map<String, dynamic> json) => Card(
        installments: json["installments"],
        mandateOptions: json["mandate_options"],
        network: json["network"],
        requestThreeDSecure: json["request_three_d_secure"],
    );

    Map<String, dynamic> toMap() => {
        "installments": installments,
        "mandate_options": mandateOptions,
        "network": network,
        "request_three_d_secure": requestThreeDSecure,
    };
}

class Klarna {
    final dynamic preferredLocale;

    Klarna({
        required this.preferredLocale,
    });

    factory Klarna.fromJson(String str) => Klarna.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Klarna.fromMap(Map<String, dynamic> json) => Klarna(
        preferredLocale: json["preferred_locale"],
    );

    Map<String, dynamic> toMap() => {
        "preferred_locale": preferredLocale,
    };
}

class Link {
    final dynamic persistentToken;

    Link({
        required this.persistentToken,
    });

    factory Link.fromJson(String str) => Link.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Link.fromMap(Map<String, dynamic> json) => Link(
        persistentToken: json["persistent_token"],
    );

    Map<String, dynamic> toMap() => {
        "persistent_token": persistentToken,
    };
}
