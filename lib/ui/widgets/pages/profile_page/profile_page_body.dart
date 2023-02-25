import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../user.dart';
import '../../../cubits/order_history_cubit/order_history_cubit.dart';
import '../../../pages/order_history_page.dart';
import '../../../themes/list_view_theme.dart';
import '../../asset_icon.dart';
import '../../gradient_button.dart';

class ProfilePageBody extends StatefulWidget {
  const ProfilePageBody({super.key});

  @override
  State<ProfilePageBody> createState() => _ProfilePageBodyState();
}

class _ProfilePageBodyState extends State<ProfilePageBody> {
  void navigateToOrderHistoryPage() {
    BlocProvider.of<OrderHistoryCubit>(context).loadAll();
    Navigator.pushNamed(context, OrderHistoryPage.routeName);
  }

  @override
  Widget build(BuildContext context) {
    final listViewTheme = Theme.of(context).extension<ListViewTheme>()!;
    final textTheme = Theme.of(context).textTheme;
    return LayoutBuilder(
      builder: (context, constrains) {
        final iconSize = constrains.maxHeight > constrains.maxWidth
            ? constrains.maxWidth / 2
            : constrains.maxHeight / 2;
        return ListView(
          padding: listViewTheme.padding.copyWith(top: 25),
          children: [
            AssetIcon(
              iconName: 'person',
              color: Theme.of(context).colorScheme.tertiary,
              size: iconSize,
            ),
            if (user.email != null)
              Center(
                child: Padding(
                  padding: EdgeInsets.only(
                    top: listViewTheme.paddingBetweenElements,
                  ),
                  child: Text(user.email!, style: textTheme.headlineMedium),
                ),
              ),
            SizedBox(height: listViewTheme.paddingBetweenElements),
            GradientButton(
              label: 'Order history',
              onPress: navigateToOrderHistoryPage,
            ),
          ],
        );
      },
    );
  }
}
