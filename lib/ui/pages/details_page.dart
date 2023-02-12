import 'package:flutter/material.dart';

import '../themes/details_page_theme.dart';
import '../widgets/asset_icon.dart';
import '../widgets/pages/details_page/details_page_body.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key});

  static const routeName = '/details';

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    final detailsPageTheme = Theme.of(context).extension<DetailsPageTheme>()!;
    return WillPopScope(
      onWillPop: () async {
        ScaffoldMessenger.of(context).clearSnackBars();
        return true;
      },
      child: Scaffold(
        backgroundColor: detailsPageTheme.backgroundColor,
        appBar: AppBar(
          actions: [
            IconButton(
              tooltip: 'Cart',
              onPressed: () {
                Navigator.pop(context, true);
              },
              icon: const AssetIcon(iconName: 'cart'),
            ),
          ],
          backgroundColor: detailsPageTheme.backgroundColor,
        ),
        body: const DetailsPageBody(),
      ),
    );
  }
}
