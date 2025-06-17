import 'package:anesthesia_handbook/Calculators/calculator_scaffold.dart';
import 'package:anesthesia_handbook/Calculators/patient_demo.dart';
import 'package:anesthesia_handbook/Calculators/patient_widget.dart';
import 'package:anesthesia_handbook/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sherlock/result.dart';
import 'package:sherlock/sherlock.dart';
import 'drug_data_pocketguide.dart';

class DrugCalc extends ConsumerStatefulWidget {
  final Map<String,dynamic> drug;
  const DrugCalc({super.key,required this.drug});

  @override
  ConsumerState<DrugCalc> createState() => _DrugCalcState();
}

class _DrugCalcState extends ConsumerState<DrugCalc> {
  Patient patientState = Patient();
  late String name;
  late String drugClass;
  late List<String> allRoutes;

  late int route;
  late List<Map<String,dynamic>> allDoses;
  late String doseString;
  late String preparationString;

  late String onsetString;
  late String durationString;

  late Color color;
  late bool striped;

  late DropdownButton routesMenu;


  @override
  void initState() {
    super.initState();
    name = widget.drug['name'] ?? 'Drug';
    route = 0;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  void buildMenu() {
      // Initialize the dropdown menu for routes
      routesMenu = DropdownButton<int>(
      value: route,
      hint: const Text('Route'),
      items: List.generate(allRoutes.length, (index) {
        return DropdownMenuItem(
          value: index,
          child: Text(allRoutes[index]),
        );
      }),
      onChanged: (int? newValue) {
        if (newValue != null) {
          setState(() {
            route = newValue;
            update();
          });
        }
      },
    );
  }

  void update() {
    // Initialize the drug information
    if (name != widget.drug['name']) {
      route = 0;
    }
    name = widget.drug['name'] ?? 'Drug';
    drugClass = widget.drug['class'] ?? 'Class';
    allDoses = widget.drug['doses'] ?? [];
    allRoutes = allDoses.map((dose) => dose['route'] as String).toList();

    if (drugClass == 'local') {
      onsetString = 'Onset: ${widget.drug['onset'] ?? 'Unknown'}';
    } else {
      onsetString = '';
    }

    preparationString = widget.drug['preparation'] ?? '';
    if (drugClass == 'opioid') {
      preparationString += '\nEquivalent Dose: ${widget.drug['equivalent'] ?? 'Unknown'}';
    }

    buildMenu();

    // Set the color and striped properties based on the drug class
    switch (drugClass) {
      case 'opioid':
        color = Color.fromARGB(97, 0, 113, 174);
        striped = false;
        break;
      case 'sedative':
        color = Colors.yellow;
        striped = false;
        break;
      case 'hypnotic':
        color = Colors.orange;
        striped = false;
        break;
      case 'vasopressor':
        color = const Color(0xffe1c9df);
        striped = false;
        break;
      case 'BB':
        color = const Color.fromARGB(255, 176, 135, 112);
        striped = false;
        break;
      case 'local':
        color = Colors.grey;
        striped = false;
        break;
      case 'paralytic':
        color = const Color.fromARGB(255, 255, 100, 89);
        striped = false;
        break;
      case 'anticholinergic':
        color = Colors.green;
        striped = false;
        break;
      case 'vasodilator':
        color = const Color.fromARGB(255, 223, 192, 221);
        striped = true;
        break;
      case 'benzoAntagonist':
        color = Colors.orange;
        striped = true;
        break;
      case 'opioidAntagonist':
        color = const Color.fromARGB(97, 0, 113, 174);
        striped = true;
        break;
      case 'paralyticAntagonist':
        color = Colors.red;
        striped = true;
        break;
      default:
        color = Colors.white;
        striped = false;
    }

    // Update the dose string based on the selected route
    Map<String,dynamic> dose = allDoses[route];
    doseString = "\u2022 ${dose['dose']} ${dose['unit']}";
    String weightType = widget.drug['weight'] ?? 'lbw';

    if (dose['unit'].contains('kg')) {
      doseString += " (${weightType.toUpperCase()})";
    }

    if (drugClass == 'local' && dose['duration'] != null) {
      durationString = 'Duration: ${dose['duration']}';
    } else {
      durationString = '';
    }

    double? weight = switch (widget.drug['weight']) {
      'lbw' => patientState.lbw,
      'tbw' => patientState.weight,
      'ibw' => patientState.ibw,
      _ => -1,
    };

    if (weight != null && weight > 0 && dose['unit'].contains('kg')) {
      // If the dose is per kg, calculate the total dose based on the patient's weight
      String newUnit = dose['unit'].replaceAll('/kg', '');
      if (dose['dose'].contains('-')) {
        double lowdose = double.parse(dose['dose'].split('-')[0]);
        double highdose = double.parse(dose['dose'].split('-')[1]);
        doseString += "\n\u2022 ${(weight * lowdose).round()}-${(weight * highdose).round()} $newUnit";
      } else {
        double maxDose = double.parse(dose['dose']);
        doseString += '\n\u2022 ${weight*maxDose.round()} $newUnit';
      }
      
    }

  }


  @override
  Widget build(BuildContext context) {
    patientState = ref.watch(patientDemoProvider);
    update();

    return CollapsibleCardColored(
      controller: ExpansionTileController(),
      color: color,
      striped: striped,
      heading: name,
      initiallyExpanded: false,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(width: 10),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Text(doseString, style: const TextStyle(fontSize: 16)),
                if (onsetString.isNotEmpty)
                  Text(onsetString, style: const TextStyle(fontSize: 16)),
              ],),
              const Spacer(flex: 8,),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  routesMenu,
                  if (durationString.isNotEmpty)
                    Text(durationString, style: const TextStyle(fontSize: 16)),
              ],),
              const Spacer(),
            ],),
          const SizedBox(height: 8.0,),
          Row(
            children: [
              const SizedBox(width: 10),
              if (preparationString.isNotEmpty)
                Flexible(child: Text(preparationString, style: const TextStyle(fontStyle: FontStyle.italic,fontSize: 16),))
            ,]
          ),
          const SizedBox(height: 8.0,),
        ],
      ),
    );
  }
}

class DrugCalcList extends StatefulWidget {
  const DrugCalcList({super.key});

  @override
  State<DrugCalcList> createState() => _DrugCalcListState();
}

class _DrugCalcListState extends State<DrugCalcList> {
  // List of drugs to be displayed
  List<Map<String,dynamic>> _toBeListed = allDrugsPocket;

  /// SearchBar Widget
  late Widget _searchBar;

  /// Text controller for the SearchBar
  final _controller = TextEditingController();

  /// Sherlock Instance for searching
  final Sherlock _sherlock = Sherlock(
    elements: allDrugsPocket,
  );

  /// ListView of Drug Calcs
  late Widget _calcsListView;

  @override
  void initState() {
    super.initState();
    generateCalcs();
    buildSearchBar();
  }

  void generateCalcs() {
    List<Widget> allCalcs = [];
    /// Generates a ListView of DrugCalc's based on list of scenarios to display
    allCalcs = _toBeListed.map(
      (drug) => DrugCalc(drug: drug),
    ).toList();    

    _calcsListView = ListView(
      children: allCalcs,
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
              hintText: 'Try Searching "PONV"',
              prefixIcon: const Icon(Icons.search),
              suffixIcon: IconButton( // Gives button at end of SearchBar to clear input
                icon: const Icon(Icons.close),
                onPressed: () {
                  _controller.clear();
                  searchDrugs('');
                },
                tooltip: 'Clear',
              )
            ),
            onChanged: (String input) {searchDrugs(input);},
            onSubmitted: (String input) {searchDrugs(input);},
            controller: _controller,
          ),
        ),
        const SizedBox(width: 15.0,),
      ],
    );
  }

  void searchDrugs(String input) async {
    if (input == '') {
      setState(() {
        _toBeListed = allDrugsPocket;
        generateCalcs();
      });
    } else {
      /// Searches for the emergency topics using Sherlock
      List<Result> searchResults = await _sherlock.search(input: input); 
      if (searchResults.isNotEmpty) {
        /// If search results are not empty, set the list to the search results
        setState(() {
          _toBeListed = searchResults.sorted().unwrap();
          generateCalcs();
        });
      } else {
        /// If no search results, set the list to an empty list
        setState(() {
          _toBeListed = [];
          generateCalcs();
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
        _searchBar,
        const PatientWidget(),
        Expanded(child: _calcsListView),
      ]
    );
    
  }
}

class DrugsPage extends StatelessWidget {
  const DrugsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const CalculatorScaffold(
      title: 'Drugs',
      child: DrugCalcList(),
    );
  }
}