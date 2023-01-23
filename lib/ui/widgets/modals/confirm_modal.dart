import 'package:flutter/material.dart';

import 'modal_action.dart';

class ConfirmModal extends StatefulWidget {
  final String message;
  final void Function() yesCallback;

  const ConfirmModal({
    super.key,
    required this.message,
    required this.yesCallback,
  });

  static void show(
    BuildContext context, {
    required String message,
    required void Function() yesCallback,
  }) {
    showDialog(
      context: context,
      builder: (context) => ConfirmModal(
        message: message,
        yesCallback: yesCallback,
      ),
    );
  }

  @override
  State<ConfirmModal> createState() => _ConfirmModalState();
}

class _ConfirmModalState extends State<ConfirmModal> {
  void hideModal() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'Information',
        style: Theme.of(context).textTheme.headlineMedium,
      ),
      content: Text(
        widget.message,
        style: Theme.of(context).textTheme.bodyMedium,
      ),
      actions: [
        ModalAction(
          text: 'No',
          onPress: hideModal,
        ),
        ModalAction(
          text: 'Yes',
          onPress: widget.yesCallback,
          isNegative: true,
        ),
      ],
    );
  }
}
