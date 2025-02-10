import 'package:anesthesia_handbook/Calculators/patient_demo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DemoWidget extends ConsumerWidget {
  final _textController = TextEditingController();
  final _unitsController = TextEditingController();

  late final String name;
  late final List<String> units;
  late final String defaultUnit;

  late final List<DropdownMenuEntry> dropdownMenuEntries;

  DemoWidget({required this.name, required this.units, required this.defaultUnit, super.key}) {
    dropdownMenuEntries = units.map((unit) => DropdownMenuEntry(value: unit, label: unit)).toList();
  }

  void update(WidgetRef ref) {
    ref.read(patientDemoProvider.notifier).setDemo(_textController.text, _unitsController.text, name);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Row(
          children: [
            SizedBox(
              width: 50,
              child: TextField(
                controller: _textController,
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                maxLength: 3,
                maxLines: 1,
                maxLengthEnforcement: MaxLengthEnforcement.enforced,
                decoration: InputDecoration(
                  labelText: name,
                  hintText: name
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
            // Weight Input
            DropdownMenu(
              controller: _textController,
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
    return Card(
      child: Column(
        children: [
          Row(
            children: [
              const Spacer(flex: 1),
              DemoWidget(
                name: 'Height',
                units: const ['cm','m','in','ft'],
                defaultUnit: 'cm',
              ),
              const Spacer(flex: 2),
              DemoWidget(
                name: 'Weight',
                units: const ['kg','lbs','g'],
                defaultUnit: 'kg',
              ),
              const Spacer(flex: 2),
              DemoWidget(
                name: 'Age',
                units: const ['yr','mo','d'],
                defaultUnit: 'yrs',
              ),
              const Spacer(flex: 2),
              SexWidget(),
              const Spacer(flex: 1),
            ],
          ),
          const Spacer(flex: 2),
          const CalculatedWeights(),
          const Spacer(flex: 2),
        ],
      ),
    );
  }
}

class CalculatedWeights extends ConsumerWidget {
  const CalculatedWeights({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Patient patientState = ref.watch(patientDemoProvider);
    return Row(
      children: [
        const Spacer(flex: 1),
        Text('BMI: ${patientState.bmi?.toStringAsFixed(1) ?? ''}'),
        const Spacer(flex: 2),
        Text('IBW: ${patientState.ibw?.toStringAsFixed(1) ?? ''}'),
        const Spacer(flex: 2),
        Text('LBW: ${patientState.lbw?.toStringAsFixed(1) ?? ''}'),
        const Spacer(flex: 1),
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
      body: const SafeArea(
        child: PatientWidget()
      ),
    );
  }
}
