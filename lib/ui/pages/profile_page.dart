import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/utils/database_helper.dart';
import '../../core/utils/navigation_helper.dart';
import '../cubits/auth_cubit/auth_cubit.dart';
import '../cubits/auth_cubit/auth_state.dart';
import '../widgets/modals/confirm_modal.dart';
import '../widgets/modals/error_modal.dart';
import '../widgets/pages/profile_page/profile_page_body.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  static const tabIndex = 3;

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  void showModal() {
    ConfirmModal.show(
      context,
      message: 'Are you sure you want to log out of your account?',
      yesCallback: BlocProvider.of<AuthCubit>(context).logout,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            tooltip: 'Logout',
            onPressed: showModal,
            icon: const Icon(Icons.logout),
          ),
        ],
        shape: const Border(
          bottom: BorderSide(
            color: Color(0xffF3F6F8),
            width: 1,
          ),
        ),
      ),
      body: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is UnAuthState) {
            DatabaseHelper.clearData(context).whenComplete(
              () => NavigationHelper.replacementToLoginPage(context),
            );
          } else if (state is ErrorAuthState) {
            ErrorModal.show(context, message: state.message);
          }
        },
        child: const ProfilePageBody(),
      ),
    );
  }
}
