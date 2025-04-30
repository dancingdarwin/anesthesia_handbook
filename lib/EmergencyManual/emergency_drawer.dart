import 'package:anesthesia_handbook/EmergencyManual/emergency_topics.dart';
import 'package:anesthesia_handbook/util.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// TODO: Draw entries from emergency_topics.dart
class EmergencyDrawer extends StatelessWidget {
  const EmergencyDrawer({super.key});
 
  @override
  Widget build(BuildContext context) {
    List<Widget> listButtons = [
      ListTile(
          leading: const Icon(Icons.home),
          title: const Text('Emergency Manual Home'),
          onTap: () {context.push('/emergency');},
        ),
    ];

    List<Widget> allTopics = emergencyTopics.map(
      (topic) => ListTile(
        onTap: () {goEmergencyPage(context, topic['pageTitle']);},
        leading: Icon(topic['icon']),
        title: Text(topic['name']),
      ),
    ).toList();

    listButtons.addAll(allTopics);
    
    return Drawer(
      child: ListView(
      padding: EdgeInsets.zero,
      children: listButtons,),
    );
  }

}