import 'dart:convert';





// import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:relocker_sa/paypal/payment/paypal/m/PayPalConstant.dart';
import 'package:relocker_sa/paypal/payment/paypal/m/createOrder/ResponsePayPalCreateOrder.dart';
import 'package:relocker_sa/paypal/payment/tools/ToolsPayment.dart';


typedef PayPalOrderCreateCallBack = Function ( bool status ,String msg, ResponsePayPalCreateOrder response );

class PayPalOrderCreateAPI {
  PayPalOrderCreateCallBack callBack;

  String url = "";

 Map<String, dynamic> body_map =    Map<String, dynamic>();


  double price;
  ResponsePayPalCreateOrder response = ResponsePayPalCreateOrder();

  PayPalOrderCreateAPI(this.price, this.callBack) {
    validate();
  }


  Future validate() async {

    //check interent
       bool Internet = await ToolsPayment.isConnected();
       if(Internet == false ) {
         String msg = "No Internet Connection";
         return callBack( false, msg, response);
       }

       await startAPI();
  }



  //--------------------------------------------------------------------------- header and body

  Future startAPI(  )  async {
   url = PayPalConstant.urlAuthAndOrder ;

    //body
   body_map["username"] = PayPalConstant.clientId ;
   body_map["password"] = PayPalConstant.secret ;
   body_map["price"] =  price.toString() ;
   body_map["enviroment"] = PayPalConstant.enviroment;
   body_map["currency"] = PayPalConstant.currency;


    await _post_http();
  }


  //------------------------------------------------------------------------------- webserive

  Future _post_http() async {

    Uri uri = Uri.parse(url);

    var response = await http.post(
        uri,
        body: body_map
    );
    // print(  "_post_http() - success: "  + response.body.toString()  );

    parseJson( response.body);

  }

//-------------------------------------------------------------------------------- parse

  void parseJson(String json) {
    try {
      // print(   "parseJson() - start  "   );
      var mapJson = jsonDecode(json);
      // print(   "parseJson() - mapJson: $mapJson "  );

      response = ResponsePayPalCreateOrder().fromJson(mapJson);
      //  print(  "parseJson() - response $response ");

      //check empty data
      if (response == null) {
        callBack(false, "Order not Created, response not downlaod", response);
        return;
      }


      //check vaieed links
      if( response.links == null ) {
        callBack(false, "Order not Created, links is empty", response);
        return;
      }

      //search for link approve
      /**
          {
          "href": "https://www.paypal.com/checkoutnow?token=10S21510TL7071830",
          "rel": "approve",
          "method": "GET"
          },
       */
      PayPalLinks palLinks = response.links!.firstWhere((element) =>
      element.rel == "approve"
      );
      //print("parseJson() - palLinks: " + palLinks.toString() );

      //check found link approve
      if( palLinks == null ) {
        callBack(false, "Order not Created, approve link not found", response);
        return;
      }

      //set link
      response.linkApprove = palLinks.href ?? "";
      print("parseJson() - linkApprove: " + response.linkApprove );

      //check found
      bool emptyLinkApprove =  response.linkApprove == null || response.linkApprove.length == 0;
      if( emptyLinkApprove ) {
        callBack(false, "Order not Created, empty link approve", response);
        return;
      }

      //callback
      callBack(true, response.status!, response);
    } catch (e) {
      print(  "parseJson() - excep: " + e.toString());
      callBack(false, e.toString(), response);
    }
  }

}
