import 'package:flutter/material.dart';

import '../../../themes/search_field_theme.dart';

class SearchField extends StatefulWidget {
  final TextEditingController controller;
  final void Function() clear;
  final void Function(String) onChanged;

  const SearchField({
    super.key,
    required this.controller,
    required this.clear,
    required this.onChanged,
  });

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  void clear() {
    setState(() {});
    widget.clear();
    FocusScope.of(context).unfocus();
  }

  void onChanged(String value) {
    setState(() {});
    widget.onChanged(value);
  }

  @override
  Widget build(BuildContext context) {
    final searchFieldTheme = Theme.of(context).extension<SearchFieldTheme>()!;
    return TextField(
      controller: widget.controller,
      decoration: InputDecoration(
        filled: true,
        fillColor: searchFieldTheme.fillColor,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: searchFieldTheme.radius,
        ),
        suffixIcon: widget.controller.text.isEmpty
            ? const Icon(Icons.search)
            : IconButton(
                onPressed: clear,
                icon: const Icon(Icons.clear_rounded),
              ),
      ),
      onChanged: onChanged,
    );
  }
}
