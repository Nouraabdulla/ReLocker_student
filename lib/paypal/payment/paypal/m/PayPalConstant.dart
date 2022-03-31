// class PayPalConstant {
//   /**
//    make price is 1 dollar for testing only
//    */
//   static const forcePriceIsOneDollar = false;

//   //----------------------------------------- clientId and secret

//   //DL App ( live )
//   static const clientId =
//       "AbCCl71VVar2zkC2S5WHzIXTD3_1OAF6aXKRIGj5e_SU1g2nB4kMqCe13YHua0udgMhVwZcmhirWp4Gx";
//   static const secret =
//       "ECtv55I-Pra7gJRPbCYkKLJwC0agqL-BuFvfQS4jxA82vcbU4EkEZXJvEpfBds9bNQRbvGZ_MOqB-nNN";

//   /**
//    *

// -------------------------------------------
// PayPal account:
// Nada.zh7@hotmail.com
// Client ID:
// AbCCl71VVar2zkC2S5WHzIXTD3_1OAF6aXKRIGj5e_SU1g2nB4kMqCe13YHua0udgMhVwZcmhirWp4Gx
// Secret:
// Hide
// Note: There can only be a maximum of two client-secrets. These client-secrets can either be in “Enabled” status or “Disabled” status.

// Created	Secret	Status	Action
// ECtv55I-Pra7gJRPbCYkKLJwC0agqL-BuFvfQS4jxA82vcbU4EkEZXJvEpfBds9bNQRbvGZ_MOqB-nNN
//    */

//   //----------------------------------------- enviroment

//   /**
//       //keyword ( sandbox, live )
//    */
//   static const enviroment = "live";

//   //----------------------------------------- currency
//   /**
//    * exmaple:  USD, EUR, THB
//    see all curency avalaible
//       https://developer.paypal.com/api/rest/reference/currency-codes/
//    */
//   static const currency = "THB";

//   //----------------------------------------- base url

//   @Deprecated("Instead use url (urlAuthAndOrderPaypal)")
//   static var urlAuth =
//       "https://samolaapp.000webhostapp.com/paypal/auth/index.php";

//   static var urlAuthAndOrder =
//       "https://relockerksu.000webhostapp.com/paypal/auth_and_order/index.php";
//   static var urlCapture =
//       "https://relockerksu.000webhostapp.com/paypal/capture/index.php";
// }

class PayPalConstant {
  /**
   make price is 1 dollar for testing only
   */
  static const forcePriceIsOneDollar = true;

  //----------------------------------------- clientId and secret

  //DL App ( live )
  static const clientId =
      "AR5XgaqmaB_w1PrkS7I5lj98_oc1tYrQLN-kWzhewzKaciofOe0oJDJ9MKwaJL6-IsxkhrNVyIhv8Nkk";
  static const secret =
      "EPzEtC2vQjMRoOEEx3JucCUyGT1Za8SP2q9tDCFMH1gSQGHYWgkFFX0xAUJope2H_N1hZZp8dQW73GG2";

  /**
      ++++++++++++ app live "Relocver live 2 "
      date : 2022-03-31

      client id
      AR5XgaqmaB_w1PrkS7I5lj98_oc1tYrQLN-kWzhewzKaciofOe0oJDJ9MKwaJL6-IsxkhrNVyIhv8Nkk

      secure key
      EPzEtC2vQjMRoOEEx3JucCUyGT1Za8SP2q9tDCFMH1gSQGHYWgkFFX0xAUJope2H_N1hZZp8dQW73GG2

   */

  //----------------------------------------- enviroment

  /**
      //keyword ( sandbox, live )
   */
  static const enviroment = "live";

  //----------------------------------------- currency
  /**
   * exmaple:  USD, EUR, THB
   see all curency avalaible
      https://developer.paypal.com/api/rest/reference/currency-codes/
   */
  static const currency = "THB";

  //----------------------------------------- base url

  static var urlAuthAndOrder =
      "https://relockerksu.000webhostapp.com/paypal/auth_and_order/index.php";
  static var urlCapture =
      "https://relockerksu.000webhostapp.com/paypal/capture/index.php";
}
