class ResponsePaypalCaptureOrder {

  String? name;
  List<PaypalDetailsError>? details;
  String? id;
  String? status;
  List<PurchaseUnits>? purchaseUnits;
  Payer? payer;
  List<Links>? links;


  ResponsePaypalCaptureOrder fromJson(Map<String, dynamic> json) {
    name = json['name'];
    if (json['details'] != null) {
      details = <PaypalDetailsError>[];
      json['details'].forEach((v) {
        details!.add(new PaypalDetailsError().fromJson(v));
      });
    }
    id = json['id'];
    status = json['status'];
    if (json['purchase_units'] != null) {
      purchaseUnits = <PurchaseUnits>[];
      json['purchase_units'].forEach((v) {
        purchaseUnits!.add(new PurchaseUnits.fromJson(v));
      });
    }
    payer = json['payer'] != null ? new Payer.fromJson(json['payer']) : null;
    if (json['links'] != null) {
      links = <Links>[];
      json['links'].forEach((v) {
        links!.add(new Links.fromJson(v));
      });
    }
    return this;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    if (this.details != null) {
      data['details'] = this.details!.map((v) => v.toJson()).toList();
    }
    data['id'] = this.id;
    data['status'] = this.status;
    if (this.purchaseUnits != null) {
      data['purchase_units'] =
          this.purchaseUnits!.map((v) => v.toJson()).toList();
    }
    if (this.payer != null) {
      data['payer'] = this.payer!.toJson();
    }
    if (this.links != null) {
      data['links'] = this.links!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PaypalDetailsError {
  String? issue;
  String? description;

  PaypalDetailsError fromJson(Map<String, dynamic> json) {
    issue = json['issue'];
    description = json['description'];
    return this;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['issue'] = this.issue;
    data['description'] = this.description;
    return data;
  }
}

class PurchaseUnits {
  String? referenceId;
  Shipping? shipping;
  Payments? payments;

  PurchaseUnits({this.referenceId, this.shipping, this.payments});

  PurchaseUnits.fromJson(Map<String, dynamic> json) {
    referenceId = json['reference_id'];
    shipping = json['shipping'] != null
        ? new Shipping.fromJson(json['shipping'])
        : null;
    payments = json['payments'] != null
        ? new Payments.fromJson(json['payments'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['reference_id'] = this.referenceId;
    if (this.shipping != null) {
      data['shipping'] = this.shipping!.toJson();
    }
    if (this.payments != null) {
      data['payments'] = this.payments!.toJson();
    }
    return data;
  }
}

class Shipping {
  Name? name;
  Address? address;

  Shipping({this.name, this.address});

  Shipping.fromJson(Map<String, dynamic> json) {
    name = json['name'] != null ? new Name.fromJson(json['name']) : null;
    address =
    json['address'] != null ? new Address.fromJson(json['address']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.name != null) {
      data['name'] = this.name!.toJson();
    }
    if (this.address != null) {
      data['address'] = this.address!.toJson();
    }
    return data;
  }
}



class Address {

  String? addressLine1;
  String? addressLine2;
  String? adminArea2;
  String? adminArea1;
  String? postalCode;
  String? countryCode;

  Address(
      {this.addressLine1,
        this.addressLine2,
        this.adminArea2,
        this.adminArea1,
        this.postalCode,
        this.countryCode});

  Address.fromJson(Map<String, dynamic> json) {
    addressLine1 = json['address_line_1'];
    addressLine2 = json['address_line_2'];
    adminArea2 = json['admin_area_2'];
    adminArea1 = json['admin_area_1'];
    postalCode = json['postal_code'];
    countryCode = json['country_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['address_line_1'] = this.addressLine1;
    data['address_line_2'] = this.addressLine2;
    data['admin_area_2'] = this.adminArea2;
    data['admin_area_1'] = this.adminArea1;
    data['postal_code'] = this.postalCode;
    data['country_code'] = this.countryCode;
    return data;
  }
}

class Payments {
  List<Captures>? captures;

  Payments({this.captures});

  Payments.fromJson(Map<String, dynamic> json) {
    if (json['captures'] != null) {
      captures = <Captures>[];
      json['captures'].forEach((v) {
        captures!.add(new Captures.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.captures != null) {
      data['captures'] = this.captures!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Captures {
  String? id;
  String? status;
  Amount? amount;
  bool? finalCapture;
  SellerProtection? sellerProtection;
  SellerReceivableBreakdown? sellerReceivableBreakdown;
  List<Links>? links;
  String? createTime;
  String? updateTime;

  Captures(
      {this.id,
        this.status,
        this.amount,
        this.finalCapture,
        this.sellerProtection,
        this.sellerReceivableBreakdown,
        this.links,
        this.createTime,
        this.updateTime});

  Captures.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    status = json['status'];
    amount =
    json['amount'] != null ? new Amount.fromJson(json['amount']) : null;
    finalCapture = json['final_capture'];
    sellerProtection = json['seller_protection'] != null
        ? new SellerProtection.fromJson(json['seller_protection'])
        : null;
    sellerReceivableBreakdown = json['seller_receivable_breakdown'] != null
        ? new SellerReceivableBreakdown.fromJson(
        json['seller_receivable_breakdown'])
        : null;
    if (json['links'] != null) {
      links = <Links>[];
      json['links'].forEach((v) {
        links!.add(new Links.fromJson(v));
      });
    }
    createTime = json['create_time'];
    updateTime = json['update_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['status'] = this.status;
    if (this.amount != null) {
      data['amount'] = this.amount!.toJson();
    }
    data['final_capture'] = this.finalCapture;
    if (this.sellerProtection != null) {
      data['seller_protection'] = this.sellerProtection!.toJson();
    }
    if (this.sellerReceivableBreakdown != null) {
      data['seller_receivable_breakdown'] =
          this.sellerReceivableBreakdown!.toJson();
    }
    if (this.links != null) {
      data['links'] = this.links!.map((v) => v.toJson()).toList();
    }
    data['create_time'] = this.createTime;
    data['update_time'] = this.updateTime;
    return data;
  }
}

class Amount {
  String? currencyCode;
  String? value;

  Amount({this.currencyCode, this.value});

  Amount.fromJson(Map<String, dynamic> json) {
    currencyCode = json['currency_code'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['currency_code'] = this.currencyCode;
    data['value'] = this.value;
    return data;
  }
}

class SellerProtection {
  String? status;
  List<String>? disputeCategories;

  SellerProtection({this.status, this.disputeCategories});

  SellerProtection.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    disputeCategories = json['dispute_categories'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['dispute_categories'] = this.disputeCategories;
    return data;
  }
}

class SellerReceivableBreakdown {
  Amount? grossAmount;
  Amount? paypalFee;
  Amount? netAmount;

  SellerReceivableBreakdown({this.grossAmount, this.paypalFee, this.netAmount});

  SellerReceivableBreakdown.fromJson(Map<String, dynamic> json) {
    grossAmount = json['gross_amount'] != null
        ? new Amount.fromJson(json['gross_amount'])
        : null;
    paypalFee = json['paypal_fee'] != null
        ? new Amount.fromJson(json['paypal_fee'])
        : null;
    netAmount = json['net_amount'] != null
        ? new Amount.fromJson(json['net_amount'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.grossAmount != null) {
      data['gross_amount'] = this.grossAmount!.toJson();
    }
    if (this.paypalFee != null) {
      data['paypal_fee'] = this.paypalFee!.toJson();
    }
    if (this.netAmount != null) {
      data['net_amount'] = this.netAmount!.toJson();
    }
    return data;
  }
}

class Links {
  String? href;
  String? rel;
  String? method;

  Links({this.href, this.rel, this.method});

  Links.fromJson(Map<String, dynamic> json) {
    href = json['href'];
    rel = json['rel'];
    method = json['method'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['href'] = this.href;
    data['rel'] = this.rel;
    data['method'] = this.method;
    return data;
  }
}

class Payer {
  Name? name;
  String? emailAddress;
  String? payerId;
  Address? address;

  Payer({this.name, this.emailAddress, this.payerId, this.address});

  Payer.fromJson(Map<String, dynamic> json) {
    name = json['name'] != null ? new Name.fromJson(json['name']) : null;
    emailAddress = json['email_address'];
    payerId = json['payer_id'];
    address =
    json['address'] != null ? new Address.fromJson(json['address']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.name != null) {
      data['name'] = this.name!.toJson();
    }
    data['email_address'] = this.emailAddress;
    data['payer_id'] = this.payerId;
    if (this.address != null) {
      data['address'] = this.address!.toJson();
    }
    return data;
  }
}

//
// class Name {
//   String? fullName;
//
//
//   Name.fromJson(Map<String, dynamic> json) {
//     fullName = json['full_name'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['full_name'] = this.fullName;
//     return data;
//   }
// }


class Name {
  String? fullName;
  String? givenName;
  String? surname;

  Name({this.givenName, this.surname});

  Name.fromJson(Map<String, dynamic> json) {
    givenName = json['given_name'];
    surname = json['surname'];
    fullName = json['full_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['given_name'] = this.givenName;
    data['surname'] = this.surname;
    data['full_name'] = this.fullName;
    return data;
  }
}
