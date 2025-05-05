import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// TODO: Draw entries from emergency_topics.dart
class DirectoryDrawer extends StatelessWidget {
  const DirectoryDrawer({super.key});
 
  @override
  Widget build(BuildContext context) {
    List<Widget> listButtons = [
      ListTile(
        leading: const Icon(Icons.home),
        title: const Text('Directory Home'),
        onTap: () {context.push('/directory');},
      ),
      ListTile(
        leading: const Icon(Icons.key),
        title: const Text('Codes'),
        onTap: () {context.push('/directory/codes');},
      ),
      ListTile(
        leading: const Icon(Icons.phone),
        title: const Text('Phone Numbers'),
        onTap: () {context.push('/directory/phone');},
      ),
    ];
        
    return Drawer(
      child: ListView(
      padding: EdgeInsets.zero,
      children: listButtons,),
    );
  }

}