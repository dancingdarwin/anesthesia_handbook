import 'package:anesthesia_handbook/Calculators/calculator_scaffold.dart';
import 'package:anesthesia_handbook/util.dart';
import 'package:flutter/material.dart';

class Insulin extends StatefulWidget {
  const Insulin({super.key});

  @override
  State<Insulin> createState() => _InsulinState();
}

class _InsulinState extends State<Insulin> {
  double _currInsulin = -1.0;
  double _glucose = -1.0;
  int _trend = 0; // 0 = New Drip, 1 = Glucose Rising, -1 = Glucose Falling

  @override
  void initState() {
    super.initState();
  }

  List<double> insulinDrip() {
    // Returns the insulin drip rate based on the current insulin and glucose. Returns as list of bolus, lower limit of insulin drip, upper limit
    if (_trend == 0) {
      return switch(_glucose) {
        > 300 => [8,8,10],
        > 280 && <= 300 => [7,7,10],
        > 260 && <= 280 => [6,6,9],
        > 240 && <= 260 => [5,5,8],
        > 220 && <= 240 => [4,4,7],
        > 200 && <= 220 => [3,3,5],
        > 180 && <= 200 => [2,2,4],
        > 160 && <= 180 => [1,1,3],
        > 140 && <= 160 => [0,0.5,1],
        _ => [0,0,0],
      };
    } else if (_trend == 1) {
      return switch(_glucose) {
        > 300 => [9,5,6],
        > 280 && <= 300 => [8,3,4],
        > 260 && <= 280 => [7,3,4],
        > 240 && <= 260 => [6,2,3],
        > 220 && <= 240 => [5,2,3],
        > 200 && <= 220 => [4,2,3],
        > 180 && <= 200 => [3,1,2],
        > 160 && <= 180 => [2,0,1],
        > 140 && <= 160 => [0,0,0],
        _ => [-2,-2,-2],
      };
    } else if (_trend == -1) {
      return switch(_glucose) {
        > 200  => [0,0,0],
        > 180 && <= 200 => [0,-0.25,0],
        > 160 && <= 180 => [0,-0.5,0],
        > 140 && <= 160 => [0,-0.75,-0.25],
        _ => [-2,-2,-2],
      };
    } else {
      return [0,0,0];
    }
    
  }

  List<String> parseInsulinStart(List<double> insulinChanges) {
    // Returns info for starting a new insulin drip
    String bolusString = '';
    String dripAdjustString = '';

    // Returns the insulin drip rate as a string
    if (_glucose < 0) {
      bolusString = 'Glucose Needed';
      dripAdjustString = 'Glucose Needed';
      return [bolusString, dripAdjustString];
    } else if (_glucose <= 140 && _glucose > 80) {
        bolusString = 'No Bolus';
        dripAdjustString = 'No Insulin Drip';
    } else if (_glucose < 80) {
      bolusString = 'No Bolus';
      dripAdjustString = 'No Drip and Consider 1/2 Amp D50';
    } else {
      bolusString = '${insulinChanges[0]} U';
      dripAdjustString = 'Start at ${insulinChanges[1]}-${insulinChanges[2]} U/hr';
    }

    return [bolusString, dripAdjustString];
  }

  List<String> parseInsulinRise(List<double> insulinChanges) {
    // Returns info for adjusting insulin drip if glucose is rising
    String bolusString = '';
    String dripAdjustString = '';

    // Returns the insulin drip rate as a string
    if (_glucose < 0) {
      bolusString = 'Glucose Needed';
      dripAdjustString = 'Glucose Needed';
      return [bolusString, dripAdjustString];
    } else if (_glucose <= 140 && _glucose > 80 ) {
        bolusString = 'No Bolus';
        dripAdjustString = 'NO Insulin Drip';
    } else if (_glucose < 80) {
      bolusString = 'No Bolus';
      dripAdjustString = 'Stop Drip and Consider 1/2 Amp D50';
    } else if (insulinChanges[2] == 0) {
      bolusString = 'No Bolus';
      dripAdjustString = 'No Changes';
    } else {
      if (_currInsulin == -1) {
        bolusString = '${insulinChanges[0]} U';
        dripAdjustString = 'Increase by ${insulinChanges[1]}-${insulinChanges[2]} U/hr';
      } else {
        bolusString = '${insulinChanges[0]} U';
        dripAdjustString = 'Set rate to ${_currInsulin + insulinChanges[1]}-${_currInsulin + insulinChanges[2]} U/hr';
      }
    }

    return [bolusString, dripAdjustString];
  }

  List<String> parseInsulinFall(List<double> insulinChanges) {
    // Returns info for adjusting insulin drip if glucose is falling
    String bolusString = 'No Bolus';
    String dripAdjustString = '';

    // Returns the insulin drip rate as a string
    if (_glucose < 0) {
      bolusString = 'Glucose Needed';
      dripAdjustString = 'Glucose Needed';
      return [bolusString, dripAdjustString];
    } else if (_glucose <= 140 && _glucose > 80 ) {
        dripAdjustString = 'STOP Insulin Drip';
    } else if (_glucose < 80) {
      dripAdjustString = 'STOP Drip and give 1/2 Amp D50';
    } else if (_glucose > 200) {
      if (_currInsulin == -1) {dripAdjustString = 'No Changes';}
      else {dripAdjustString = 'Keep Drip at $_currInsulin U/hr';}
    } else {
      if (_currInsulin == -1) {
        dripAdjustString = 'Decrease by ${(-100 * insulinChanges[2]).round()}-${(-100 * insulinChanges[1]).round()}%';
      } else {
        dripAdjustString = 'Set rate to ${_currInsulin * (1+insulinChanges[1])}-${_currInsulin * (1+insulinChanges[2])} U/hr';
      }
    }

    return [bolusString, dripAdjustString];
  }



  @override
  Widget build(BuildContext context) {

    final List<double> insulinChanges = insulinDrip();

    List<String> instructions = switch(_trend) {
      0 => parseInsulinStart(insulinChanges),
      1 => parseInsulinRise(insulinChanges),
      -1 => parseInsulinFall(insulinChanges),
      _ => ['Error','Error'],
    };

    return CollapsibleCard(
      controller: ExpansionTileController(),
      color: Colors.green,
      heading: 'Insulin Drip',
      initiallyExpanded: true,
      child: Column(children: [
            SizedBox(
              width: 150,
              child: DropdownButton(
                value: _trend,
                items: const [
                  DropdownMenuItem(value: 0, child: Text('New Drip')),
                  DropdownMenuItem(value: 1, child: Text('Glucose Rising')),
                  DropdownMenuItem(value: -1, child: Text('Glucose Falling')),
                ],
                onChanged: (value) => {
                  setState(() {_trend = value as int;}),
                },
              ),
            ),
            SizedBox(
              width: 150,
              child: TextField(
                keyboardType: TextInputType.number,
                maxLines: 1,
                decoration: const InputDecoration(labelText: 'Glucose',),
                onChanged: (value) => {
                  if (value.isNotEmpty) {
                    setState(() {_glucose = double.parse(value);}),
                  } else {
                    setState(() {_glucose = -1.0;})
                  }
                },
              ),
            ),
            SizedBox(
              width: 150,
              child: TextField(
                keyboardType: TextInputType.number,
                maxLines: 1,
                decoration: const InputDecoration(labelText: 'Current Rate',),
                onChanged: (value) => {
                  if (value.isNotEmpty) {
                    setState(() {_currInsulin = double.parse(value);}),
                  } else {
                    setState(() {_currInsulin = -1.0;})
                  }
                },
              ),
            ),
            
          const SizedBox(height: 10,),
          DataTable(
            rows: [
              DataRow(cells: [const DataCell(Text('Bolus')), DataCell(Text(instructions[0]))]),
              DataRow(cells: [const DataCell(Text('Adjustment')), DataCell(Text(instructions[1]))]),
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

class InsulinPage extends StatelessWidget {
  const InsulinPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CalculatorScaffold(
      title: 'Insulin',
      child: ListView(
        children: const [
          Insulin(),
        ]
      ),
    );
  }
}