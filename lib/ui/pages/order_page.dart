import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../themes/page_theme.dart';
import '../widgets/filled_button.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  static const routeName = '/order';

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  void goBack() {
    Navigator.pop(context);
  }

  static const _storeCoordinates = LatLng(
    37.786412407301405,
    -122.41010317171919,
  );

  @override
  Widget build(BuildContext context) {
    final pageTheme = Theme.of(context).extension<PageTheme>()!;
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: pageTheme.padding.copyWith(top: 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: pageTheme.paddingBetweenElements),
              Text(
                'You order is accepted',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              SizedBox(height: pageTheme.paddingBetweenElements),
              Text(
                'You can pick up your order at 70 Waller St, San Francisco',
                style: Theme.of(context).textTheme.titleSmall,
              ),
              SizedBox(height: pageTheme.paddingBetweenElements),
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: GoogleMap(
                    myLocationButtonEnabled: false,
                    initialCameraPosition: const CameraPosition(
                      target: _storeCoordinates,
                      zoom: 15,
                    ),
                    markers: {
                      const Marker(
                        markerId: MarkerId('store'),
                        position: _storeCoordinates,
                        draggable: false,
                      )
                    },
                  ),
                ),
              ),
              SizedBox(height: pageTheme.paddingBetweenElements),
              GradientButton(label: 'Continue shopping', onPress: goBack)
            ],
          ),
        ),
      ),
    );
  }
}
