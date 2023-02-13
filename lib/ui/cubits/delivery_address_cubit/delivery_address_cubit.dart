import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../configs.dart';
import '../../../logic/utils/distance_beetween_coordinates.dart';
import 'delivery_address_state.dart';

class DeliveryAddressCubit extends Cubit<DeliveryAddressState> {
  DeliveryAddressCubit() : super(NotSelectedDeliveryAddressState());

  void selectDeliveryAddress(LatLng deliveryLocation) {
    final price = _getDeliveryPrice(deliveryLocation);

    emit(
      SelectedDeliveryAddressState(
        deliveryLocation: deliveryLocation,
        deliveryPrice: price,
      ),
    );
  }

  void clearSelectedDeliveryAddress() {
    emit(
      NotSelectedDeliveryAddressState(),
    );
  }

  double _getDeliveryPrice(LatLng deliveryLocation) {
    if (state is SelectedDeliveryAddressState) {
      final previousState = state as SelectedDeliveryAddressState;
      final previousDeliveryLocation = previousState.deliveryLocation;

      if (previousDeliveryLocation.latitude == deliveryLocation.latitude &&
          previousDeliveryLocation.longitude == deliveryLocation.longitude) {
        return previousState.deliveryPrice;
      }
    }

    final distance = distanceBetweenCoordinatesInMeters(
      STORE_LOCATION,
      deliveryLocation,
    );
    return distance * DELIVERY_PRICE_OF_METER;
  }
}
