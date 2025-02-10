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
          title: const Text('Emergency Manual Home'),
          onTap: () {context.push('/emergency');},
        ),
        ListTile(
          leading: const Icon(Icons.heart_broken),
          title: const Text('ACLS - Asystole/PEA'),
          onTap: () {context.pushNamed('emergencypage',pathParameters: {'pageTitle': 'ACLS-AsystolePEA'});},
        ),
        ListTile(
          leading: const Icon(Icons.heart_broken),
          title: const Text('ACLS - VFib/VT'),
          onTap: () {context.pushNamed('emergencypage',pathParameters: {'pageTitle': 'ACLS-VFVT'});},
        ),
      ],),
    );
  }

}