
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../ui/cubits/cart_cubit/cart_cubit.dart';

class DatabaseHelper {
  static Future<void> clearData(BuildContext context) {
    return BlocProvider.of<CartCubit>(context).clear();
  }
}
