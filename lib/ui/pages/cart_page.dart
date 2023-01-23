import 'package:flutter/material.dart';

import '../widgets/pages/cart_page/cart_page_body.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  static const tabIndex = 2;

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        bottom: false,
        child: CartPageBody(),
      ),
    );
  }
}
