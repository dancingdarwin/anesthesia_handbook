import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CalculatorDrawer extends StatelessWidget {
  const CalculatorDrawer({super.key});
  

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
      padding: EdgeInsets.zero,
      children: [
        ListTile(
          leading: const Icon(Icons.home),
          title: const Text('Calculators Home'),
          onTap: () {context.push('/calculator');},
        ),
        ListTile(
          leading: const Icon(Icons.accessibility_new),
          title: const Text('Body Composition'),
          onTap: () {context.push('/calculator/bodycomp');},
        ),
        ListTile(
          leading: const Icon(Icons.construction),
          title: const Text('Equipment'),
          onTap: () {context.push('/calculator/equipment');},
        ),
        ListTile(
          leading: const Icon(Icons.water_drop),
          title: const Text('Fluids/Blood'),
          onTap: () {context.push('/calculator/fluids');},
        ),
      ],),
    );
  }

}