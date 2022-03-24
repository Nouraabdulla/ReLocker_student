import 'dart:convert';




// import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:relocker_sa/paypal/payment/paypal/m/PayPalConstant.dart';
import 'package:relocker_sa/paypal/payment/paypal/m/capture/ResponsePaypalCaptureOrder.dart';
import 'package:relocker_sa/paypal/payment/tools/ToolsPayment.dart';


typedef PayPalOrderCaptureCallBack =  Function ( bool status ,String msg, ResponsePaypalCaptureOrder response );

class PayPalCaptureOrderAPI {
  PayPalOrderCaptureCallBack callBack;

  String url = "";

 Map<String, dynamic> body_map =    Map<String, dynamic>();


  String orderId;
  ResponsePaypalCaptureOrder response = ResponsePaypalCaptureOrder();

  PayPalCaptureOrderAPI(this.orderId, this.callBack) {
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
   url = PayPalConstant.urlCapture ;

    //body
   body_map["username"] = PayPalConstant.clientId ;
   body_map["password"] = PayPalConstant.secret ;
   body_map["enviroment"] = PayPalConstant.enviroment;
   body_map["order_id"] = orderId ;

    await _post_http();
  }

  //------------------------------------------------------------------------------- network

  Future _post_http() async {
    Uri uri = Uri.parse(url);
    var response = await http.post(
        uri,
        body: body_map
    );

    print(  "_post_http() - success: "  + response.body.toString()  );
    parseJson( response.body);

  }

//-------------------------------------------------------------------------------- parse

  void parseJson(String json) {
    try {

      var mapJson = jsonDecode(json);

      response = ResponsePaypalCaptureOrder().fromJson(mapJson);

      //check empty data
      if (response == null) {
        callBack(false, "Order not Created, response not downlaod", response);
        return;
      }

      //check have error
      /**
          "details": [
          {
          "issue": "ORDER_ALREADY_CAPTURED"
       */
      if( response.name != null ) {
        String msgIssue = response.details![0].issue!;
        callBack(false, msgIssue, response);
        return;
      }

      //check have order id  found
      /**
          {
          "id": "2AW204",
          "status": "COMPLETED",
       */
      if( response.id == null  ) {
        callBack(false,  "Order Capture not completed, no order id found", response);
        return;
      }

      //check have status is "completed" means the capture make ok
      /**
          {
          "id": "2AW204",
          "status": "COMPLETED",
       */
      if( response.status == null  ) {
        callBack(false,  "Order Capture not completed, not status found", response);
        return;
      }
      if( response.status !=  "COMPLETED"  ) {
        callBack(false,  "Order Capture not completed, status order is: " + response.status!, response);
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
