import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:relocker_sa/paypal/payment/tools/ToolsPayment.dart';

typedef WebviewPaymentUrlChange = Function(String urlChangeTo);

class WebviewPaymentPage extends StatefulWidget {
  String? url;
  ValueChanged<WebviewPaymentState>? stateListener;
  WebviewPaymentUrlChange? urlChange;

  WebviewPaymentPage({
    required String this.url,
    required WebviewPaymentUrlChange this.urlChange,
    required ValueChanged<WebviewPaymentState> this.stateListener,
  });

  @override
  WebviewPaymentState createState() {
    var state = WebviewPaymentState(url: url!, urlChange: urlChange!);
    stateListener!(state);
    return state;
  }
}

class WebviewPaymentState extends State<WebviewPaymentPage> {
  int progress = 0;

  String? url;

  WebviewPaymentUrlChange? urlChange;

  WebviewPaymentState(
      {required String this.url,
      required WebviewPaymentUrlChange this.urlChange});

  //------------------------------------------------------------------- build

  @override
  Widget build(BuildContext context) {
    print("myWebview - WebviewPaymentState - build");

    var stack = Stack(children: [
      //all screen size
      Placeholder(
          strokeWidth: 0,
          color: Colors.transparent,
          fallbackWidth: ToolsPayment.getWidth(context, ""),
          fallbackHeight: ToolsPayment.getHeight(context, "")),

      //webview
      widgetWebview(),

      //progress
      Align(child: progressViewLinear(), alignment: Alignment.topLeft)
    ]);

    return Container(
      child: stack,
      color: Colors.white,
    );
  }

  //--------------------------------------------------------------- webview widget

  Widget widgetWebview() {
    URLRequest uri = URLRequest(url: Uri.parse(url!));

    return InAppWebView(
        initialUrlRequest: uri,
        onProgressChanged: (InAppWebViewController controller, int progress) {
          this.progress = progress;

          //check
          if (this.progress == 100) {
            print("myWebview - onProgressChanged - progress: " +
                progress.toString());
            progressStatus = false;
            setState(() {});
          }
        },
        onLoadStart: (controller, url) {
          print("myWebview - url: " + url.toString());
          urlChange!(url.toString());
        });
  }

  //-------------------------------------------------------------- progress

  var progressStatus = true;

  Widget progressViewLinear() {
    if (progressStatus) {
      return LinearProgressIndicator(
          value: progress.toDouble(),
          backgroundColor: Colors.blue[200],
          valueColor: AlwaysStoppedAnimation<Color>(Colors.blue));
    } else {
      return Placeholder(
          strokeWidth: 0,
          color: Colors.transparent,
          fallbackWidth: 0,
          fallbackHeight: 0);
    }
  }
}
