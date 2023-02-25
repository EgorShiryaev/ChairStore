import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../configs.dart';
import '../../../cubits/delivery_address_cubit/delivery_address_cubit.dart';
import '../../../cubits/delivery_address_cubit/delivery_address_state.dart';

class DeliveryMap extends StatefulWidget {
  const DeliveryMap({super.key});

  @override
  State<DeliveryMap> createState() => _DeliveryMapState();
}

class _DeliveryMapState extends State<DeliveryMap> {
  LatLng? deliveriedCoordinates;

  void setDeliveryCoordinates(LatLng coordinates) {
    setState(() {
      deliveriedCoordinates = coordinates;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<DeliveryAddressCubit, DeliveryAddressState>(
      listener: (context, state) {
        if (state is SelectedDeliveryAddressState) {
          setDeliveryCoordinates(state.deliveryLocation);
        }
      },
      child: GoogleMap(
        myLocationButtonEnabled: true,
        myLocationEnabled: true,
        initialCameraPosition: const CameraPosition(
          target: STORE_LOCATION,
          zoom: 15,
        ),
        onTap: BlocProvider.of<DeliveryAddressCubit>(context)
            .selectDeliveryAddress,
        markers: {
          if (deliveriedCoordinates != null)
            Marker(
              markerId: const MarkerId('delivery'),
              position: deliveriedCoordinates!,
              draggable: true,
              onDrag: BlocProvider.of<DeliveryAddressCubit>(context)
                  .selectDeliveryAddress,
            )
        },
      ),
    );
  }
}
