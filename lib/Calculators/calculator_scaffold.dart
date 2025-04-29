import 'package:flutter/material.dart';
import 'calculator_drawer.dart';

class CalculatorScaffold extends StatelessWidget {
  const CalculatorScaffold({super.key,required this.child, required this.title});
  final Widget child;
  final String title;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          title,
          style: TextStyle(color: theme.colorScheme.onPrimary),
        ),
        backgroundColor: theme.colorScheme.primary,
      ),
      drawer: const CalculatorDrawer(),
      drawerEdgeDragWidth: MediaQuery.of(context).size.width,
      drawerEnableOpenDragGesture: true,
      body: SafeArea(child: child),
    );
  }
}

