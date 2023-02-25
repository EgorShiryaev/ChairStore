import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/utils/price_ui_convector.dart';
import '../../dependency_injection.dart';
import '../cubits/delivery_address_cubit/delivery_address_cubit.dart';
import '../cubits/delivery_address_cubit/delivery_address_state.dart';
import '../themes/page_theme.dart';
import '../widgets/gradient_button.dart';
import '../widgets/pages/order_page/delivery_map.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  static const routeName = '/order';

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  String uiPrice = '';
  double price = 0;

  void goBack() {
    Navigator.pop(context);
  }

  void setPrice(double newPrice) {
    if (newPrice != price) {
      setState(() {
        uiPrice = PriceUiConvector.toPriceFormat(newPrice);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final pageTheme = Theme.of(context).extension<PageTheme>()!;
    return BlocProvider<DeliveryAddressCubit>(
      create: (context) => getIt<DeliveryAddressCubit>(),
      child: WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: Scaffold(
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
                    'Choose an address for delivery',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  SizedBox(height: pageTheme.paddingBetweenElements),
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: const DeliveryMap(),
                    ),
                  ),
                  SizedBox(height: pageTheme.paddingBetweenElements),
                  BlocConsumer<DeliveryAddressCubit, DeliveryAddressState>(
                    listener: (context, state) {
                      if (state is SelectedDeliveryAddressState) {
                        setPrice(state.deliveryPrice);
                      }
                    },
                    builder: (context, state) {
                      if (state is SelectedDeliveryAddressState) {
                        return GradientButton(
                          label: 'Order delivery $uiPrice',
                          onPress: goBack,
                        );
                      }
                      return const SizedBox();
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
