import 'package:flutter/material.dart';

import '../../themes/search_field_theme.dart';

class SearchField extends StatefulWidget {
  final String value;
  final void Function(String) onChanged;
  final void Function() clear;

  const SearchField({
    super.key,
    required this.value,
    required this.onChanged,
    required this.clear,
  });

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  @override
  Widget build(BuildContext context) {
    final searchFieldTheme = Theme.of(context).extension<SearchFieldTheme>()!;
    return TextField(
      decoration: InputDecoration(
        filled: true,
        fillColor: searchFieldTheme.fillColor,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: searchFieldTheme.radius,
        ),
        suffixIcon: widget.value.isEmpty
            ? const Icon(Icons.search)
            : IconButton(
                onPressed: widget.clear,
                icon: const Icon(Icons.clear_rounded),
              ),
      ),
      onChanged: widget.onChanged,
    );
  }
}
