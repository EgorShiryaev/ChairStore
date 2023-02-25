import 'package:flutter/material.dart';

import '../widgets/pages/order_history_page/order_history_page_body.dart';



class OrderHistoryPage extends StatelessWidget {
  const OrderHistoryPage({super.key});

   static const routeName = '/orderHistory';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const OrderHistoryPageBody(),
    );
  }
}
