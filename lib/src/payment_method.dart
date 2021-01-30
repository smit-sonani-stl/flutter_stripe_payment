import 'package:stripe_payment/src/token.dart';

import 'card_form_payment_request.dart';

class PaymentMethodRequest {
  final BillingAddress billingAddress;
  final CreditCard card;
  final Token token;
  final Map<String, String> metadata;

  PaymentMethodRequest({
    this.billingAddress,
    this.card,
    this.token,
    this.metadata,
  }) {
    assert(card != null || token != null);
  }

  Map<String, Object> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.card != null) {
      data['card'] = card.toJson();
    }
    if (this.token != null) {
      data['token'] = token.toJson();
    }
    if (this.billingAddress != null) {
      data['billingAddress'] = this.billingAddress.toJson();
    }
    if (this.metadata != null) {
      if (this.metadata != null) data['metadata'] = this.metadata;
    }
    return data;
  }
}

class BECSInfo {
  final String name;
  final String email;
  final String accountNumber;
  final String bsbNumber;

  BECSInfo({
    this.name,
    this.email,
    this.accountNumber,
    this.bsbNumber,
  });

  Map<String, Object> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.name != null) {
      data['name'] = this.name;
    }
    if (this.email != null) {
      data['email'] = this.email;
    }
    if (this.accountNumber != null) {
      data['accountNumber'] = this.accountNumber;
    }
    if (this.bsbNumber != null) {
      data['bsbNumber'] = this.bsbNumber;
    }
    return data;
  }
}

class PaymentMethodRequestBECS {
  final BECSInfo becsInfo;

  PaymentMethodRequestBECS({
    this.becsInfo,
  });

  Map<String, Object> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.becsInfo != null) {
      data['BECSInfo'] = this.becsInfo.toJson();
    }
    return data;
  }
}

class PaymentMethod {
  BillingDetails billingDetails;
  CreditCard card;
  AUBECSAccount auBECSAccount;
  num created;
  String customerId;
  String id;
  bool livemode;
  String type;

  PaymentMethod(
      {this.billingDetails,
      this.card,
      this.auBECSAccount,
      this.created,
      this.customerId,
      this.id,
      this.livemode,
      this.type});

  factory PaymentMethod.fromJson(Map<dynamic, dynamic> json) {
    return PaymentMethod(
      billingDetails: json['billingDetails'] != null
          ? BillingDetails.fromJson(json['billingDetails'])
          : null,
      card: json['card'] != null ? CreditCard.fromJson(json['card']) : null,
      auBECSAccount: json['au_becs_debit'] != null
          ? AUBECSAccount.fromJson(json['au_becs_debit'])
          : null,
      created: json['created'],
      customerId: json['customerId'],
      id: json['id'],
      livemode: json['livemode'],
      type: json['type'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.created != null) if (this.created != null)
      data['created'] = this.created;
    if (this.customerId != null) data['customerId'] = this.customerId;
    if (this.id != null) data['id'] = this.id;
    if (this.livemode != null) data['livemode'] = this.livemode;
    if (this.type != null) data['type'] = this.type;
    if (this.billingDetails != null) {
      data['billingDetails'] = this.billingDetails.toJson();
    }
    if (this.card != null) {
      data['card'] = this.card.toJson();
    }
    if (this.auBECSAccount != null) {
      data['au_becs_debit'] = this.auBECSAccount.toJson();
    }
    return data;
  }
}

class BillingDetails {
  BillingAddress address;
  String email;
  String name;
  String phone;

  BillingDetails({this.address, this.email, this.name, this.phone});

  factory BillingDetails.fromJson(Map<dynamic, dynamic> json) {
    return BillingDetails(
      address: json['address'] != null
          ? BillingAddress.fromJson(json['address'])
          : null,
      email: json['email'],
      name: json['name'],
      phone: json['phone'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.email != null) data['email'] = this.email;
    if (this.name != null) data['name'] = this.name;
    if (this.phone != null) data['phone'] = this.phone;
    if (this.address != null) {
      data['address'] = this.address.toJson();
    }
    return data;
  }
}
