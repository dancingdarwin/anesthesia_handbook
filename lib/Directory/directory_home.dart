import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../util.dart';

class DirectoryHome extends StatelessWidget {
  const DirectoryHome({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Directory', style: TextStyle(color: theme.colorScheme.onPrimary),
        ),
        backgroundColor: theme.colorScheme.primary,
      ),
      body: SafeArea(
        child: GridView.extent(
          maxCrossAxisExtent: 300,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          primary: false,
          padding: const EdgeInsets.all(20),
          children: <Widget>[
            TileButton(
              onPressed: () {context.go('/directory/codes');},
              icon: Icons.key,
              label: 'Codes',
              backgroundColor: theme.colorScheme.error,
              iconColor: theme.colorScheme.onError,
              labelColor: theme.colorScheme.onError,
            ),
            TileButton(
              onPressed: () {context.go('/directory/phone');},
              icon: Icons.phone,
              label: 'Phone Numbers',
              backgroundColor: theme.colorScheme.primary,
              iconColor: theme.colorScheme.onPrimary,
              labelColor: theme.colorScheme.onPrimary,
            ),
          ],
        )
      ),
    );
  }
}

