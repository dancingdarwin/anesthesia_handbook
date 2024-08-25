import 'package:flutter/material.dart';
import 'package:sherlock/completion.dart';
import 'package:sherlock/result.dart';
import 'package:sherlock/sherlock.dart';
import 'package:sherlock/widget.dart';

import '../util.dart';
import './emergency_drawer.dart';
import './emergency_topics.dart';

class EmergencyHome extends StatefulWidget {
  const EmergencyHome({super.key});

  @override
  State<EmergencyHome> createState() => _EmergencyHomeState();
}

class _EmergencyHomeState extends State<EmergencyHome> {
  /// Displays the Emergency Page with a list of all scenarios with a search bar

  /// List of Scenarios to display (initialized as every scenario,
  /// but can be replaced by search results)
  List<Map<String,dynamic>> _toBeListed = emergencyTopics;

  /// GridView of TileButtons
  Widget _buttonGrid = GridView.extent(
      primary: false,
      padding: const EdgeInsets.all(20),
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      maxCrossAxisExtent: 300,
      children: const [],
  );

  @override
  void initState() {
    super.initState();
    generateTileButtons();
  }

  SherlockSearchBar buildSearchBar() {
    return SherlockSearchBar(
      sherlock: Sherlock(elements: emergencyTopics),
      sherlockCompletion: SherlockCompletion(elements: emergencyTopics, where: 'name'),
      sherlockCompletionMinResults: 1,
      onSearch: searchTopics,
      completionsBuilder: (context,completions) => SherlockCompletionsBuilder(
        completions: completions,
        buildCompletion: (completion) => Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            children: [
              Text(
                completion,
                style: const TextStyle(fontSize: 14),
              ),
              const Spacer(),
              const Icon(Icons.check),
              const Icon(Icons.close)
            ],
          ),
        ),
      ),
    );
  }

  void generateTileButtons() {
    /// Generates a GridView of TileButtons based on list of scenarios to display
    List<Widget> allButtons = _toBeListed.map(
      (topic) => TileButton(
        onPressed: () {goEmergencyPage(context, topic['pageTitle']);},
        icon: topic['icon'],
        backgroundColor: topic['backgroundColor'],
        iconColor: topic['iconColor'],
        label: topic['name'],
        labelColor: topic['iconColor'],
      ),
    ).toList();

    _buttonGrid = GridView.extent(
      primary: false,
      padding: const EdgeInsets.all(20),
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      maxCrossAxisExtent: 300,
      children: allButtons,
    );
  }

  void searchTopics(String input,Sherlock sherlock) async {
    /// Searches for the emergency topics using Sherlock
    List<Result> searchResults = await sherlock.search(input: input); 

    setState(() {          
      _toBeListed = searchResults.sorted().unwrap();
      generateTileButtons();
    });
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Emergency Manual', style: TextStyle(color: theme.colorScheme.onError),
        ),
        backgroundColor: theme.colorScheme.error,
      ),
      drawer: const EmergencyDrawer(),
      drawerEdgeDragWidth: MediaQuery.of(context).size.width,
      drawerEnableOpenDragGesture: true,
      body: Column(
        children: [
          buildSearchBar(),
          _buttonGrid,
        ],
      ),
    );
  }
}
  