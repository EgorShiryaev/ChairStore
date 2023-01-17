import 'package:flutter/material.dart';

import 'modal_action.dart';

class ErrorModal extends StatefulWidget {
  final String message;
  const ErrorModal({
    super.key,
    required this.message,
  });

  static void show(BuildContext context, {required String message}) {
    showDialog(
      context: context,
      builder: (context) => ErrorModal(message: message),
    );
  }

  @override
  State<ErrorModal> createState() => _ErrorModalState();
}

class _ErrorModalState extends State<ErrorModal> {
  void hideModal() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Error'),
      content: Text(widget.message),
      actions: [
        ModalAction(
          text: 'Ok',
          onPress: hideModal,
        ),
      ],
    );
  }
}
