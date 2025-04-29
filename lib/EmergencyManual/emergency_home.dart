import 'package:flutter/material.dart';
import 'package:sherlock/result.dart';
import 'package:sherlock/sherlock.dart';

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
  
  // TODO: Make responsive - if screen is small, make the gridview scrollable

  /// List of Scenarios to display (initialized as every scenario,
  /// but can be replaced by search results)
  List<Map<String,dynamic>> _toBeListed = emergencyTopics;

  /// SearchBar Widget
  late Widget _searchBar;

  /// Text controller for the SearchBar
  final _controller = TextEditingController();

  /// Sherlock Instance for searching
  final Sherlock _sherlock = Sherlock(elements: emergencyTopics);

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
    buildSearchBar();
  }

  void buildSearchBar() {
    _searchBar = Row(
      children: [
        const SizedBox(width: 15.0,),
        Expanded(
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(45.0),
                borderSide: const BorderSide(
                  width: 2.0,
                  color: Color(0xFFFF0000),
                ),
              ),
              hintText: 'Search Scenarios',
              prefixIcon: const Icon(Icons.search),
              suffixIcon: IconButton( // Gives button at end of SearchBar to clear input
                icon: const Icon(Icons.close),
                onPressed: () {
                  _controller.clear();
                  searchTopics('');
                },
                tooltip: 'Clear',
              )
            ),
            onChanged: (String input) {searchTopics(input);},
            onSubmitted: (String input) {searchTopics(input);},
            controller: _controller,
          ),
        ),
        const SizedBox(width: 15.0,),
      ],
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

  void searchTopics(String input) async {
    if (input == '') {
      setState(() {
        _toBeListed = emergencyTopics;
        generateTileButtons();
      });
    } else {
      /// Searches for the emergency topics using Sherlock
      List<Result> searchResults = await _sherlock.search(input: input); 

      setState(() {          
        _toBeListed = searchResults.sorted().unwrap();
        generateTileButtons();
      });
    }

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
          const SizedBox(height: 10),
          _searchBar,
          const SizedBox(height: 5),
          Expanded(child: _buttonGrid),
        ],
      ),
    );
  }
}
  