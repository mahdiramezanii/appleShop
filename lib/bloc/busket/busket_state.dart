import 'package:apple_shop/data/models/bucket_model.dart';
import 'package:dartz/dartz.dart';

abstract class BusketState {}

class InitialBusketState extends BusketState {}

class ResponsebusketState extends BusketState {
  Either<String, List<Bucket>> response;

  ResponsebusketState({
    required this.response,
  });
  
}
