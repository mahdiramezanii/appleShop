import 'package:apple_shop/bloc/busket/busket_event.dart';
import 'package:apple_shop/bloc/busket/busket_state.dart';
import 'package:apple_shop/data/repository/busket_repository.dart';
import 'package:apple_shop/util/payment_hamdler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BusketBloc extends Bloc<BusketEvent, BusketState> {
  final IBusketRepository _repository;
  PaymentHandler _paymentHandler;

  BusketBloc(this._paymentHandler, this._repository)
      : super(InitialBusketState()) {
    on<FetchBusketEvent>((event, emit) async {
      var response = await _repository.fetchBucketList();
      var total_price = await _repository.getTotalPrice();

      emit(ResponsebusketState(
        response: response,
        total_price: total_price,
      ));
    });

    on<InitialPaymentRequestEvent>((event, emit) async {
      var total_price = await _repository.getTotalPrice();

      _paymentHandler.initialPayment(total_price);
    });

    on<PaymentRequestEvnt>((event, emit) async {
      _paymentHandler.requestPayment();
    });

    on<RemoveItemBusket>((event, emit) async {
      await _repository.removeBusketItem(event.busket_id);

      var response = await _repository.fetchBucketList();
      var total_price = await _repository.getTotalPrice();

      emit(ResponsebusketState(
        response: response,
        total_price: total_price,
      ));
    });
  }
}
