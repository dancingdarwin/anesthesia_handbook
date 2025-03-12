import 'package:anesthesia_handbook/Calculators/equipment.dart';
import 'package:anesthesia_handbook/Calculators/patient_demo.dart';
import 'package:anesthesia_handbook/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DemoWidget extends ConsumerWidget {
  final _textController = TextEditingController();
  final _unitsController = TextEditingController();

  late final String name;
  late final List<String> units;
  late final String defaultUnit;
  late final String initialVal;

  late final List<DropdownMenuEntry> dropdownMenuEntries;

  DemoWidget({required this.name, required this.units, required this.defaultUnit, required this.initialVal, super.key}) {
    dropdownMenuEntries = units.map((unit) => DropdownMenuEntry(value: unit, label: unit)).toList();
  }

  void update(WidgetRef ref) {
    ref.read(patientDemoProvider.notifier).setDemo(_textController.text, _unitsController.text, name);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    _textController.value = TextEditingValue(text: initialVal);
    return Column(
      children: [
        Row(
          children: [
            SizedBox(
              width: 60,
              child: TextField(
                controller: _textController,
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                maxLines: 1,
                maxLengthEnforcement: MaxLengthEnforcement.enforced,
                decoration: InputDecoration(
                  labelText: name,
                ),
                onChanged: (value) => update(ref),
              ),
            ),
            const SizedBox(width: 10,),
            DropdownMenu(
              controller: _unitsController,
              dropdownMenuEntries: dropdownMenuEntries,
              initialSelection: defaultUnit,
              onSelected: (value) => update(ref),
            )
          ],
        )
      ],
    );
  }
}

class SexWidget extends ConsumerWidget {
  final _textController = TextEditingController();

  SexWidget({super.key});

  void update(WidgetRef ref) {
    ref.read(patientDemoProvider.notifier).setDemo(_textController.text, '', 'Sex');
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Row(
          children: [
            const Text('Sex'),
            const SizedBox(width: 20,),
            // Weight Input
            DropdownMenu(
              controller: _textController,
              initialSelection: 'M',
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
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Patient Demographics', style: TextStyle(color: theme.colorScheme.onPrimary),
        ),
        backgroundColor: theme.colorScheme.primary,
      ),
      body: SafeArea(
        child: ListView(
          children: const [
            PatientWidget(),
            AirwayEquipment(),
            VascularEquipment()
          ]
        ),
      ),
    );
  }
}
