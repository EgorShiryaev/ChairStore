import 'package:google_maps_flutter/google_maps_flutter.dart';

abstract class DeliveryAddressState {}

class NotSelectedDeliveryAddressState extends DeliveryAddressState {}

class SelectedDeliveryAddressState extends DeliveryAddressState {
  final LatLng deliveryLocation;
  final double deliveryPrice;

  SelectedDeliveryAddressState({
    required this.deliveryLocation,
    required this.deliveryPrice,
  });
}
