import 'package:anesthesia_handbook/Directory/directory_drawer.dart';
import 'package:anesthesia_handbook/util.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:sherlock/result.dart';
import 'package:sherlock/sherlock.dart';

import 'package:toastification/toastification.dart';

import 'dart:convert';

class PhonePage extends StatefulWidget {
  const PhonePage({super.key});

  @override
  State<PhonePage> createState() => _PhonePageState();
}

class _PhonePageState extends State<PhonePage> {
  // JSON list of door codes
  List<Map<String,dynamic>> _entries = [];

  // List of Codes to display
  List<Map<String,dynamic>> _toBeListed = [];

  /// GridView of TileButtons
  Widget _entriesList = ListView(
      padding: const EdgeInsets.all(0),
      children: const [],
  );

  /// SearchBar Widget
  late Widget _searchBar;

  /// Text controller for the SearchBar
  final _controller = TextEditingController();

  /// Sherlock Instance for searching
  late final Sherlock _sherlock;


  @override
  void initState() {
    super.initState();
    getCodes();
    buildSearchBar();
  }

  void getCodes() async {
    final String response = await rootBundle.loadString('assets/PhoneNumbers.json');
    setState(() { 
      _entries = (json.decode(response) as List).cast<Map<String, dynamic>>(); 
      _toBeListed = _entries;
      _sherlock = Sherlock(
        elements: _entries,
      );
      generateCodesList();
    });
  }

  void generateCodesList() {
    List<Widget> allTiles = [
      const Card(
        child: ListTile(
          title: Text('Tap to call or long press to copy'),
          leading: Icon(Icons.info),
        ),),
    ];

    /// Generates a list of tiles from the list of phone numbers
    allTiles.addAll(_toBeListed.map(
      (code) => Card(
        child: ListTile(
          onLongPress: () async {
            await Clipboard.setData(ClipboardData(text: code['Phone Number']));
            /// Show a toast message when the code is copied to clipboard
            toastification.show(
              title: Text('Copied ${code['Phone Number']} to clipboard'),
              autoCloseDuration: const Duration(seconds: 2),
            );
          },
          onTap: () {
            launchURL('tel:${code['Phone Number']}');
          },
          title: Text(code['Entity']),
          subtitle: Text(code['Phone Number'] as String),
          leading: const Icon(Icons.phone),
        ),
      ),
    ));

    setState(() {
        _entriesList = ListView(
          padding: const EdgeInsets.all(0),
        children: allTiles,
        );
      }
    );
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
              hintText: 'Search Phone Numbers',
              prefixIcon: const Icon(Icons.search),
              suffixIcon: IconButton( // Gives button at end of SearchBar to clear input
                icon: const Icon(Icons.close),
                onPressed: () {
                  _controller.clear();
                  searchCodes('');
                },
                tooltip: 'Clear',
              )
            ),
            onChanged: (String input) {searchCodes(input);},
            onSubmitted: (String input) {searchCodes(input);},
            controller: _controller,
          ),
        ),
        const SizedBox(width: 15.0,),
      ],
    );
  }

  void searchCodes(String input) async {
    if (input == '') {
      setState(() {
        _toBeListed = _entries;
        generateCodesList();
      });
    } else {
      /// Searches for the emergency topics using Sherlock
      List<Result> searchResults = await _sherlock.search(input: input); 
      if (searchResults.isNotEmpty) {
        /// If search results are not empty, set the list to the search results
        setState(() {
          _toBeListed = searchResults.sorted().unwrap();
          generateCodesList();
        });
      } else {
        /// If no search results, set the list to an empty list
        setState(() {
          _toBeListed = [];
          generateCodesList();
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // Show a toast message when the page is first opened
    // This is to inform the user that they can tap to call or long press to copy
    
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Door Codes', style: TextStyle(color: theme.colorScheme.onPrimary),
        ),
        backgroundColor: theme.colorScheme.primary,
      ),
      drawer: const DirectoryDrawer(),
      body: SafeArea(
        child: Column(
        children: [
          const SizedBox(height: 10),
          _searchBar,
          const SizedBox(height: 5),
          Expanded(child: _entriesList),
        ],
      ),
      ),
    );
  }
}

