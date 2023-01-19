import 'package:flutter/material.dart';

import '../../../logic/repositories/auth_repository.dart';
import '../../themes/list_view_theme.dart';
import '../asset_icon.dart';

class ProfilePageBody extends StatelessWidget {
  const ProfilePageBody({super.key});

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
            if (userEmail != null)
              Center(
                child: Padding(
                  padding: EdgeInsets.only(
                    top: listViewTheme.paddingBetweenElements,
                  ),
                  child: Text(userEmail!, style: textTheme.headlineMedium),
                ),
              )
          ],
        );
      },
    );
  }
}
