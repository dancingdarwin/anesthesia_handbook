import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

import 'package:anesthesia_handbook/EmergencyManual/emergency_card.dart';
import './emergency_drawer.dart';

class EmergencyPage extends StatefulWidget {
  final String pageTitle;
  const EmergencyPage({super.key, required this.pageTitle});

  @override
  State<EmergencyPage> createState() => _EmergencyPageState();
}

class _EmergencyPageState extends State<EmergencyPage> {
  /// Content of Markdown file.
  String _text = '';

  /// List of Emergency Cards to display.
  List<EmergencyCard> _children = [];

  String _barTitle = '';

  @override
  void initState() {
    super.initState();
    getText();

    _barTitle = switch (widget.pageTitle) {
      'ACLS-AsystolePEA' => 'ACLS - Asystole/PEA',
      _ => 'Emergency Manual'
    };
  }

  Future<String> getText() async {
    /// Loads in the Markdown Content
    
    final String response;
    try {
      response = await rootBundle.loadString('assets/EmergencyText/${widget.pageTitle}.md');
    } catch(_) {
      throw UnimplementedError('Emergency manual text not found!');
    }

    setState(() { 
      _text = response;
      _children = parseText();
    }); 

    return response;
  }

  List<EmergencyCard> parseText() {
    /// Takes the Markdown content and split it into Emergency Cards.
    List<EmergencyCard> parsed = [];
    List<String> allSteps = _text.split('#');

    for (String step in allSteps) {
      // Create an emergency card for each step

      String heading;
      String body;

      int idx = step.indexOf('\n');

      if (idx == -1) {
        continue;
      } else {
        heading = step.substring(0,idx).trim();
        body = step.substring(idx + 1).trim();
      }

      parsed.add(EmergencyCard(body: body, heading: heading));
    }

    return parsed;
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          _barTitle, style: TextStyle(color: theme.colorScheme.onError),
        ),
        backgroundColor: theme.colorScheme.error,
      ),
      drawer: const EmergencyDrawer(),
      drawerEdgeDragWidth: MediaQuery.of(context).size.width,
      body: ListView(
        padding: const EdgeInsets.all(8),
        shrinkWrap: true,
        children: _children,
      ),
    );
  }


}