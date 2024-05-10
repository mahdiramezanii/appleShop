abstract class BusketEvent {}

class FetchBusketEvent extends BusketEvent {}

class PaymentRequestEvnt extends BusketEvent {}

class InitialPaymentRequestEvent extends BusketEvent {}

class RemoveItemBusket extends BusketEvent {
  int busket_id;

  RemoveItemBusket({
    required this.busket_id,
  });
}
