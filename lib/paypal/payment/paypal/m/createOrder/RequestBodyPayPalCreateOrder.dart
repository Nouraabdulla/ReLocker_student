
class RequestBodyPayPalCreateOrder {
  String? intent;
  List<PurchaseUnits>? purchaseUnits;


  RequestBodyPayPalCreateOrder fromJson(Map<String, dynamic> json) {
    intent = json['intent'];
    if (json['purchase_units'] != null) {
      purchaseUnits = <PurchaseUnits>[];
      json['purchase_units'].forEach((v) {
        purchaseUnits!.add(new PurchaseUnits().fromJson(v));
      });
    }
    return this;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['intent'] = this.intent;
    if (this.purchaseUnits != null) {
      data['purchase_units'] =
          this.purchaseUnits!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PurchaseUnits {
  Amount? amount;


  PurchaseUnits fromJson(Map<String, dynamic> json) {
    amount =
    json['amount'] != null ? new Amount().fromJson(json['amount']) : null;
    return this;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.amount != null) {
      data['amount'] = this.amount!.toJson();
    }
    return data;
  }
}

class Amount {
  String? currencyCode;
  String? value;

  Amount fromJson(Map<String, dynamic> json) {
    currencyCode = json['currency_code'];
    value = json['value'];
    return this;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['currency_code'] = this.currencyCode;
    data['value'] = this.value;
    return data;
  }
}
