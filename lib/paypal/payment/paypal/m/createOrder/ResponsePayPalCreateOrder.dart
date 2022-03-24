
class ResponsePayPalCreateOrder {
  String? id;
  String? status;
  List<PayPalLinks>? links;

  //set  manuel
  String linkApprove = "";

  ResponsePayPalCreateOrder fromJson(Map<String, dynamic> json) {
    id = json['id'];
    status = json['status'];
    if (json['links'] != null) {
      links = <PayPalLinks>[];
      json['links'].forEach((v) {
        links!.add(new PayPalLinks().fromJson(v));
      });
    }
    return this;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['status'] = this.status;
    if (this.links != null) {
      data['links'] = this.links!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  @override
  String toString() {
    return 'ResponsePayPalCreateOrder{id: $id, status: $status, links: $links, linkApprove: $linkApprove}';
  }
}

class PayPalLinks {
  String? href;
  String? rel;
  String? method;

  PayPalLinks fromJson(Map<String, dynamic> json) {
    href = json['href'];
    rel = json['rel'];
    method = json['method'];
    return this;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['href'] = this.href;
    data['rel'] = this.rel;
    data['method'] = this.method;
    return data;
  }

  @override
  String toString() {
    return 'PayPalLinks{href: $href, rel: $rel, method: $method}';
  }
}

