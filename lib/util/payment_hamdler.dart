import 'package:apple_shop/util/extentions/extentions.dart';
import 'package:apple_shop/util/url_handller.dart';
import 'package:uni_links/uni_links.dart';
import 'package:zarinpal/zarinpal.dart';

abstract class PaymentHandler {
  Future<void> initialPayment(int totalPrice);
  Future<void> requestPayment();
  Future<void> verificationPayment(String deepLink);
}

class ZarinPalHamdllerPayment extends PaymentHandler {
  PaymentRequest _paymentRequest = PaymentRequest();
  UrlHandller _urlHandller;

  ZarinPalHamdllerPayment(this._urlHandller);

  @override
  Future<void> initialPayment(int totalPrice) async {
    _paymentRequest.setIsSandBox(true);
    _paymentRequest.setAmount(totalPrice);
    _paymentRequest.setMerchantID("b3b73736-7999-4b64-b2e7-f14c42ee52a7");
    _paymentRequest.setDescription("خرید تستی از اپلیکیشن مهدی رمضانی");
    _paymentRequest.setCallbackURL("expertflutter://shop");

    linkStream.listen((deepLink) {
      if (deepLink!.toLowerCase().contains("authority")) {
        verificationPayment(deepLink);
      }
    });
  }

  @override
  Future<void> requestPayment() async {
    ZarinPal().startPayment(_paymentRequest, (status, paymentGatewayUri) {
      if (status == 100) {
        _urlHandller.openUrl(paymentGatewayUri!);
      }
    });
  }

  @override
  Future<void> verificationPayment(String deepLink) async {
    String? authority = deepLink.extractValueFromQuery("Authority");
    String? statusCode = deepLink.extractValueFromQuery("Status");
    ZarinPal().verificationPayment(statusCode!, authority!, _paymentRequest,
        (isPaymentSuccess, refID, paymentRequest) {
      if (isPaymentSuccess) {
        print(refID!);
      } else {
        print("Erorr");
      }
    });
  }
}
