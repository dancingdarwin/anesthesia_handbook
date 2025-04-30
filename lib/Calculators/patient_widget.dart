import 'package:anesthesia_handbook/Calculators/calculator_scaffold.dart';
import 'package:anesthesia_handbook/Calculators/equipment.dart';
import 'package:anesthesia_handbook/Calculators/patient_demo.dart';
import 'package:anesthesia_handbook/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DemoWidget extends ConsumerStatefulWidget {
  final _textController = TextEditingController();
  final _unitsController = TextEditingController();

  final String name;
  final List<String> units;
  final String defaultUnit;
  final String initialVal;

  late final List<DropdownMenuEntry> dropdownMenuEntries;

  DemoWidget({required this.name, required this.units, required this.defaultUnit, required this.initialVal, super.key}) {
    dropdownMenuEntries = units.map((unit) => DropdownMenuEntry(value: unit, label: unit)).toList();
  }

  @override
  ConsumerState<DemoWidget> createState() => _DemoWidgetState();
}

class _DemoWidgetState extends ConsumerState<DemoWidget> {
  bool initialized = false;

  @override
  void initState() {
    super.initState();  
  }

  void update() {
    ref.read(patientDemoProvider.notifier).setDemo(widget._textController.text, widget._unitsController.text, widget.name);
  }

  @override
  Widget build(BuildContext context) {
    final Patient patientState = ref.watch(patientDemoProvider);
    final Map<String,dynamic> patientDemo = patientState.toMap();
    // Check if the text controller has been initialized
    if (!initialized) {
      // Set the initial value of the text controller to the current value in the state
      widget._textController.value = TextEditingValue(text: patientDemo[widget.name].toString());
      initialized = true;
    }

    return Column(
      children: [
        Row(
          children: [
            SizedBox(
              width: 60,
              child: TextField(
                controller: widget._textController,
                keyboardType: TextInputType.number,
                maxLines: 1,
                maxLengthEnforcement: MaxLengthEnforcement.enforced,
                decoration: InputDecoration(
                  labelText: widget.name,
                ),
                onChanged: (value) => update(),
              ),
            ),
            const SizedBox(width: 10,),
            DropdownMenu(
              controller: widget._unitsController,
              dropdownMenuEntries: widget.dropdownMenuEntries,
              initialSelection: widget.defaultUnit,
              onSelected: (value) => update(),
            )
          ],
        )
      ],
    );
  }
}

class SexWidget extends ConsumerStatefulWidget {
  final _textController = TextEditingController();

  SexWidget({super.key});

  @override
  ConsumerState<SexWidget> createState() => _SexWidgetState();
}

class _SexWidgetState extends ConsumerState<SexWidget> {
  bool initialized = false;

  @override
  void initState() {
    super.initState();
  }

  void update(WidgetRef ref) {
    ref.read(patientDemoProvider.notifier).setDemo(widget._textController.text, '', 'Sex');
  }

  @override
  Widget build(BuildContext context) {
    final Patient patientState = ref.watch(patientDemoProvider);
    final Map<String,dynamic> patientDemo = patientState.toMap();

    // Check if the text controller has been initialized
    if (!initialized) {
      // Set the initial value of the text controller to the current value in the state
      widget._textController.value = TextEditingValue(text: patientDemo['Sex']);
      initialized = true;
    }

    return Column(
      children: [
        Row(
          children: [
            const Text('Sex'),
            const SizedBox(width: 20,),
            // Weight Input
            DropdownMenu(
              controller: widget._textController,
              dropdownMenuEntries: const [
                DropdownMenuEntry(value: 'M', label: 'M'),
                DropdownMenuEntry(value: 'F', label: 'F'),
              ],
              onSelected: (value) => update(ref),
            )
          ],
        )
      ],
    );
  }
}



class PatientWidget extends StatelessWidget {
  const PatientWidget({super.key});

  @override
  Widget build(BuildContext context){
    return LayoutBuilder(
      builder: (context,constraints) {
        if (constraints.maxWidth < 800) {
          return const PatientWidgetNarrow();
        } else {
          return const PatientWidgetWide();
        }
      }
    );
  }
}

class PatientWidgetNarrow extends StatelessWidget {
  const PatientWidgetNarrow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CollapsibleCard(
      heading: 'Demographics',
      controller: ExpansionTileController(),
      initiallyExpanded: true,
      color: Colors.green,
      child: const Row(
        children: [
          Spacer(flex: 1,),
          PatientBodyNarrow(),
          Spacer(flex: 1),
          CalculatedWeightsNarrow(),
          Spacer(flex: 1,)
      ],),
    );
  }
}

class PatientWidgetWide extends StatelessWidget {
  const PatientWidgetWide({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CollapsibleCard(
      controller: ExpansionTileController(),
      color: Colors.green,
      heading: 'Demographics',
      initiallyExpanded: true,
      child: const Column(
        children: [
          PatientBodyWide(),
          SizedBox(height: 10,),
          CalculatedWeightsWide(),
        ],
      ),
    );
  }
}


class PatientBodyWide extends StatelessWidget {
  const PatientBodyWide({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Spacer(flex: 1),
        DemoWidget(
          name: 'Height',
          units: const ['cm','m','in','ft'],
          defaultUnit: 'cm',
          initialVal: '170',
        ),
        const Spacer(flex: 2),
        DemoWidget(
          name: 'Weight',
          units: const ['kg','lbs','g'],
          defaultUnit: 'kg',
          initialVal: '70',
        ),
        const Spacer(flex: 2),
        DemoWidget(
          name: 'Age',
          units: const ['yr','mo','d'],
          defaultUnit: 'yr',
          initialVal: '40',
        ),
        const Spacer(flex: 2),
        SexWidget(),
        const Spacer(flex: 1),
      ],
    );
  }
}

class PatientBodyNarrow extends StatelessWidget {
  const PatientBodyNarrow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: [
        DemoWidget(
          name: 'Height',
          units: const ['cm','m','in','ft'],
          defaultUnit: 'cm',
          initialVal: '170',
        ),
        DemoWidget(
          name: 'Weight',
          units: const ['kg','lbs','g'],
          defaultUnit: 'kg',
          initialVal: '70',
        ),
        DemoWidget(
          name: 'Age',
          units: const ['yr','mo','d'],
          defaultUnit: 'yrs',
          initialVal: '40',
        ),
        SexWidget(),
      ],
    );
  }
}

class CalculatedWeightsWide extends ConsumerWidget {
  const CalculatedWeightsWide({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Patient patientState = ref.watch(patientDemoProvider);
    TextStyle defaultStyle = const TextStyle(color: Colors.black, fontSize: 20.0);
    return Row(
      children: [
        const Spacer(flex: 1),
        RichText(
          text: TextSpan(
            style: defaultStyle,
            children: <TextSpan>[
              const TextSpan(text: 'BMI: ', style: TextStyle(fontWeight: FontWeight.bold)),
              TextSpan(text: patientState.bmi?.toStringAsFixed(1) ?? ''),
            ],
          ),
        ),
        const Spacer(flex: 2),
        RichText(
          text: TextSpan(
            style: defaultStyle,
            children: <TextSpan>[
              const TextSpan(text: 'IBW: ', style: TextStyle(fontWeight: FontWeight.bold)),
              TextSpan(text: patientState.ibw?.toStringAsFixed(1) ?? ''),
            ],
          ),
        ),
        const Spacer(flex: 2),
        RichText(
          text: TextSpan(
            style: defaultStyle,
            children: <TextSpan>[
              const TextSpan(text: 'LBW: ', style: TextStyle(fontWeight: FontWeight.bold)),
              TextSpan(text: patientState.lbw?.toStringAsFixed(1) ?? ''),
            ],
          ),
        ),
        const Spacer(flex: 1),
      ],
    );
  }
}

class CalculatedWeightsNarrow extends ConsumerWidget {
  const CalculatedWeightsNarrow({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Patient patientState = ref.watch(patientDemoProvider);
    TextStyle defaultStyle = const TextStyle(color: Colors.black, fontSize: 20.0);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        RichText(
          text: TextSpan(
            style: defaultStyle,
            children: <TextSpan>[
              const TextSpan(text: 'BMI: ', style: TextStyle(fontWeight: FontWeight.bold)),
              TextSpan(text: patientState.bmi?.toStringAsFixed(1) ?? ''),
            ],
          ),
        ),
        const SizedBox(height: 10,),
        RichText(
          text: TextSpan(
            style: defaultStyle,
            children: <TextSpan>[
              const TextSpan(text: 'IBW: ', style: TextStyle(fontWeight: FontWeight.bold)),
              TextSpan(text: patientState.ibw?.toStringAsFixed(1) ?? ''),
            ],
          ),
        ),
        const SizedBox(height: 10,),
        RichText(
          text: TextSpan(
            style: defaultStyle,
            children: <TextSpan>[
              const TextSpan(text: 'LBW: ', style: TextStyle(fontWeight: FontWeight.bold)),
              TextSpan(text: patientState.lbw?.toStringAsFixed(1) ?? ''),
            ],
          ),
        ),
      ],
    );
  }
}

class DemographicsPage extends StatelessWidget {
  const DemographicsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const CalculatorScaffold(
      title: 'Body Composition',
      child: PatientWidget(),
    );
  }
}

class EquipmentPage extends StatelessWidget {
  const EquipmentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CalculatorScaffold(
      title: 'Equipment',
      child: ListView(
        children: const [
          PatientWidget(),
          AirwayEquipment(),
          VascularEquipment()
        ]
      ),
    );
  }
}
