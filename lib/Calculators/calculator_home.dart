import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import '../util.dart';
import 'calculator_scaffold.dart';

class CalculatorHome extends StatelessWidget {
  const CalculatorHome({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return CalculatorScaffold(
      title: 'Calculators',
      child: GridView.extent(
          maxCrossAxisExtent: 300,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          primary: false,
          padding: const EdgeInsets.all(20),
          children: <Widget>[
            TileButton(
              onPressed: () {context.go('/calculator/bodycomp');},
              icon: Icons.accessibility_new,
              label: 'Body Composition',
              backgroundColor: theme.colorScheme.primary,
              iconColor: theme.colorScheme.onPrimary,
              labelColor: theme.colorScheme.onPrimary,
            ),
            TileButton(
              onPressed: () {context.go('/calculator/equipment');},
              icon: Icons.construction,
              label: 'Equipment',
              backgroundColor: theme.colorScheme.secondary,
              iconColor: theme.colorScheme.onSecondary,
              labelColor: theme.colorScheme.onSecondary,
            ),
            /* TileButton(
              onPressed: () {context.go('/calculator/drugs');},
              icon: Icons.medication,
              label: 'Drugs',
              backgroundColor: theme.colorScheme.tertiary,
              iconColor: theme.colorScheme.onTertiary,
              labelColor: theme.colorScheme.onTertiary,
            ), */
            TileButton(
              onPressed: () {context.go('/calculator/fluids');},
              icon: Icons.water_drop,
              label: 'Fluids/Blood',
              backgroundColor: theme.colorScheme.error,
              iconColor: theme.colorScheme.onError,
              labelColor: theme.colorScheme.onError,
            ),
            TileButton(
              onPressed: () {context.go('/calculator/insulin');},
              icon: FontAwesomeIcons.syringe,
              label: 'Insulin',
              backgroundColor: Colors.green,
              iconColor: Colors.white,
              labelColor: Colors.white,
            ),
            TileButton(
              onPressed: () {context.go('/calculator/ca1');},
              icon: Icons.checklist,
              label: 'CA-1 Checklists',
              backgroundColor: theme.colorScheme.primary,
              iconColor: theme.colorScheme.onPrimary,
              labelColor: theme.colorScheme.onPrimary,
            ),
            TileButton(
              onPressed: () {context.go('/calculator/pump');},
              icon: Icons.favorite,
              label: 'Pump Cases',
              backgroundColor: theme.colorScheme.secondary,
              iconColor: theme.colorScheme.onSecondary,
              labelColor: theme.colorScheme.onSecondary,
            ),
          ]
        )
      );
  }
}

