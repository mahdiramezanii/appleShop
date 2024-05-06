import 'package:apple_shop/bloc/busket/busket_event.dart';
import 'package:apple_shop/bloc/busket/busket_state.dart';
import 'package:apple_shop/data/datasource/busket_repository.dart';
import 'package:apple_shop/di/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BusketBloc extends Bloc<BusketEvent, BusketState> {
  final IBusketRepository _repository = locator.get();

  BusketBloc() : super(InitialBusketState()) {
    on<FetchBusketEvent>((event, emit) async {
      var response = await _repository.fetchBucketList();

      emit(ResponsebusketState(response: response));
    });
  }
}
