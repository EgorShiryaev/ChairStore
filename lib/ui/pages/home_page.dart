import 'package:flutter/material.dart';

import '../../themes/list_view_theme.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool sortingIsAlphabetically = true;

  void changeIsLessFilter() {
    setState(() {
      sortingIsAlphabetically = !sortingIsAlphabetically;
    });
  }

  @override
  Widget build(BuildContext context) {
    final listViewTheme = Theme.of(context).extension<ListViewTheme>()!;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: changeIsLessFilter,
          icon: sortingIsAlphabetically
              ? const Icon(Icons.sort_rounded)
              : Transform.scale(
                  scaleY: -1,
                  alignment: Alignment.center,
                  child: const Icon(Icons.sort_rounded),
                ),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: listViewTheme.padding.copyWith(bottom: 0),
            sliver: SliverList(
              delegate: SliverChildListDelegate(
                [
                  Text(
                    'Recommended for You',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  SizedBox(height: listViewTheme.paddingBetweenElements)
                ],
              ),
            ),
          ),
          SliverPadding(
            padding: listViewTheme.padding,
            sliver: SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: listViewTheme.paddingBetweenElements,
                crossAxisSpacing: listViewTheme.paddingBetweenElements,
              ),
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return Container(
                    alignment: Alignment.center,
                    color: Colors.primaries[(index % 9)],
                    child: Text('grid item $index'),
                  );
                },
                childCount: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
