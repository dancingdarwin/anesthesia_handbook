import 'package:anesthesia_handbook/Calculators/calculator_scaffold.dart';
import 'package:anesthesia_handbook/Calculators/patient_demo.dart';
import 'package:anesthesia_handbook/Calculators/patient_widget.dart';
import 'package:anesthesia_handbook/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Fluids extends ConsumerStatefulWidget {
  const Fluids({super.key});

  @override
  ConsumerState<Fluids> createState() => _FluidsState();
}

class _FluidsState extends ConsumerState<Fluids> {
  double _npoTime = -1.0;

  @override
  void initState() {
    super.initState();
  }

  double maintenanceRate(double weight) {
    // Returns the maintenance rate based on weight
    if (weight < 0) {
      return -1;
    } else if (weight < 10) {
      return weight * 4;
    } else if (weight < 20) {
      return (weight - 10) * 2 + 40;
    } else {
      return  weight + 40;
    }
  }

  @override
  Widget build(BuildContext context) {
    final Patient patientState = ref.watch(patientDemoProvider);
    final double weight = patientState.weight ?? -1;

    final double maintenance = maintenanceRate(weight);
    String maintenanceString = '';
    String npoDeficitString = '';


    if (maintenance < 0) {
      maintenanceString = 'Weight Needed';
      npoDeficitString = 'Weight Needed';
    } else {
      maintenanceString = '$maintenance mL/hr';
      if (_npoTime < 0) {
        npoDeficitString = 'NPO Time Needed';
      } else if (_npoTime == 0) {
        npoDeficitString = 'No NPO Time';
      } else {
        npoDeficitString = '${_npoTime * maintenance} mL';
      }
    }

    return CollapsibleCard(
      controller: ExpansionTileController(),
      color: Colors.blue,
      heading: 'Fluids',
      initiallyExpanded: false,
      child: Row(
        children: [
          const SizedBox(width: 10,),
          SizedBox(
            width: 100,
            child: TextField(
              keyboardType: TextInputType.number,
              maxLines: 1,
              decoration: const InputDecoration(labelText: 'NPO Time (hrs)',),
              onChanged: (value) => {
                if (value.isNotEmpty) {
                  setState(() {_npoTime = double.parse(value);}),
                } else {
                  setState(() {_npoTime = -1.0;})
                }
              },
            ),
          ),
          DataTable(
            rows: [
              DataRow(cells: [const DataCell(Text('Maintenance\nRate')), DataCell(Text(maintenanceString))]),
              DataRow(cells: [const DataCell(Text('NPO\nDeficit')), DataCell(Text(npoDeficitString))]),
            ],
            columns: const [
              DataColumn(label: Expanded(child: Text('Parameter', style: TextStyle(fontStyle: FontStyle.italic)))),
              DataColumn(label: Expanded(child: Text('Value', style: TextStyle(fontStyle: FontStyle.italic)))),
            ],
          ),
        ],
      )
    );
  }
}

class Blood extends ConsumerStatefulWidget {
  const Blood({super.key});

  @override
  ConsumerState<Blood> createState() => _BloodState();
}

class _BloodState extends ConsumerState<Blood> {
  double _currentHgb = -1.0;
  double _minHgb = -1.0;

  @override
  void initState() {
    super.initState();
  }

  double calcBloodVolume(double weight, double age, String sex) {
    // Returns the blood volume based on weight, age, and
    if (weight < 0 || age < 0 || sex == '') {
      return -1;
    } else if (age < 1/12) {
      return weight * 85;
    } else if (age < 1) {
      return weight * 80;
    } else if (sex == 'M') {
      return weight * 75;
    } else if (sex == 'F') {
      return weight * 65;
    } else {
      return -1;
    }
    
  }

  double calcABL(double bloodVolume, double currentHgb, double minHgb) {
    // Returns the ABL based on blood volume, current Hgb, and min Hgb
    if (bloodVolume < 0 || currentHgb < 0 || minHgb < 0) {
      return -1;
    } else {
      return bloodVolume * (currentHgb - minHgb) / currentHgb;
    }
  }

  @override
  Widget build(BuildContext context) {
    final Patient patientState = ref.watch(patientDemoProvider);
    final double weight = patientState.weight ?? -1;
    final double age = patientState.age ?? -1;
    final String sex = patientState.sex ?? '';

    final double bloodVolume = calcBloodVolume(weight,age,sex);
    String bloodVolumeString = '';
    String ablString = '';

    if (bloodVolume < 0) {
      bloodVolumeString = 'Weight/Age/Sex Needed';
      ablString = 'Weight/Age/Sex Needed';
    } else {
      bloodVolumeString = '$bloodVolume mL';
      if (_currentHgb < 0 || _minHgb < 0) {
        ablString = 'Hgb Needed';
      } else {
        ablString = '${calcABL(bloodVolume, _currentHgb, _minHgb)} mL';
      }
    }

    return CollapsibleCard(
      controller: ExpansionTileController(),
      color: Colors.red,
      heading: 'Blood',
      initiallyExpanded: false,
      child: Row(
        children: [
          const SizedBox(width: 10,),
          Column(children: [
            SizedBox(
              width: 100,
              child: TextField(
                keyboardType: TextInputType.number,
                maxLines: 1,
                decoration: const InputDecoration(labelText: 'Curr Hgb',),
                onChanged: (value) => {
                  if (value.isNotEmpty) {
                  setState(() {_currentHgb = double.parse(value);}),
                } else {
                  setState(() {_currentHgb = -1.0;})
                }
                },
              ),
            ),
            SizedBox(
              width: 100,
              child: TextField(
                keyboardType: TextInputType.number,
                maxLines: 1,
                decoration: const InputDecoration(labelText: 'Min Hgb',),
                onChanged: (value) => {
                  if (value.isNotEmpty) {
                  setState(() {_minHgb = double.parse(value);}),
                } else {
                  setState(() {_minHgb = -1.0;})
                }
                },
              ),
            ),
          ],),
          DataTable(
            rows: [
              DataRow(cells: [const DataCell(Text('Blood\nVolume')), DataCell(Text(bloodVolumeString))]),
              DataRow(cells: [const DataCell(Text('Allowable\nBlood Loss')), DataCell(Text(ablString))]),
            ],
            columns: const [
              DataColumn(label: Expanded(child: Text('Parameter', style: TextStyle(fontStyle: FontStyle.italic)))),
              DataColumn(label: Expanded(child: Text('Value', style: TextStyle(fontStyle: FontStyle.italic)))),
            ],
          ),
        ],
      )
    );
  }
}

class FluidsPage extends StatelessWidget {
  const FluidsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CalculatorScaffold(
      title: 'Blood/Fluids',
      child: ListView(
        children: const [
          PatientWidget(),
          Fluids(),
          Blood()
        ]
      ),
    );
  }
}