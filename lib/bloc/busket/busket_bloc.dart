import 'package:apple_shop/bloc/busket/busket_event.dart';
import 'package:apple_shop/bloc/busket/busket_state.dart';
import 'package:apple_shop/data/repository/busket_repository.dart';
import 'package:apple_shop/di/service_locator.dart';
import 'package:apple_shop/util/extentions/extentions.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uni_links/uni_links.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:zarinpal/zarinpal.dart';

class BusketBloc extends Bloc<BusketEvent, BusketState> {
  final IBusketRepository _repository = locator.get();
  PaymentRequest _paymentRequest = PaymentRequest();

  BusketBloc() : super(InitialBusketState()) {
    on<FetchBusketEvent>((event, emit) async {
      var response = await _repository.fetchBucketList();
      var total_price = await _repository.getTotalPrice();

      emit(ResponsebusketState(
        response: response,
        total_price: total_price,
      ));
    });

    on<InitialPaymentRequestEvent>((event, emit) async {


      _paymentRequest.setIsSandBox(true);
      _paymentRequest.setAmount(1000);
      _paymentRequest.setMerchantID("b3b73736-7999-4b64-b2e7-f14c42ee52a7");
      _paymentRequest.setDescription("خرید تستی از اپلیکیشن مهدی رمضانی");
      _paymentRequest.setCallbackURL("expertflutter://shop");

      linkStream.listen((deepLink) {
        if (deepLink!.toLowerCase().contains("authority")) {
          String? authority = deepLink.extractValueFromQuery("Authority");
          String? statusCode = deepLink.extractValueFromQuery("Status");

          ZarinPal()
              .verificationPayment(statusCode!, authority!, _paymentRequest,
                  (isPaymentSuccess, refID, paymentRequest) {
            if (isPaymentSuccess) {
              print(refID!);
            } else {
              print("Erorr");
            }
          });
        }
      });
    });

    on<PaymentRequestEvnt>((event, emit) async {
      ZarinPal().startPayment(_paymentRequest, (status, paymentGatewayUri) {
        if (status == 100) {
          launchUrl(
            Uri.parse(paymentGatewayUri!),
            mode: LaunchMode.externalApplication,
          );
        }
      });
    });
  }
}
