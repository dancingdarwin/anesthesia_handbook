import 'package:anesthesia_handbook/Calculators/calculator_drawer.dart';
import 'package:anesthesia_handbook/util.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PreOpOrders extends StatelessWidget {
  const PreOpOrders({super.key});

  @override
  Widget build(BuildContext context) {
    return CollapsibleCard(
      controller: ExpansionTileController(),
      color: Colors.blue,
      heading: 'Pre-Op Orders',
      initiallyExpanded: false,
      child: const Column(
        children: [
          SizedBox(width: 10,),
          CheckboxItem(
            label: 'T/C 2-4U PRBCs, 2-4U FFP',
            icon: Icon(Icons.bloodtype),
          ),
          CheckboxItem(
            label: 'MRSA Nares Swab',
            icon: Icon(Icons.coronavirus),
          ),
          CheckboxItem(
            label: 'Gabapentin 600 mg PO once',
            icon: Icon(Icons.medication),
          ),
          CheckboxItem(
            label: 'Tylenol 1000 mg PO once',
            icon: Icon(Icons.medication),
          ),
          CheckboxItem(
            label: 'Intraop Insulin Drip',
            icon: Icon(Icons.medication),
          ),
          CheckboxItem(
            label: 'Intraop Cefazolin Drip',
            icon: Icon(Icons.medication),
          ),
          CheckboxItem(
            label: 'Anesthesia Tech Emailed (accm-or-request@jhmi.edu)',
            icon: Icon(Icons.email),
          ),
        ],
      )
    );
  }
}

class Setup extends StatelessWidget {
  const Setup({super.key});

  @override
  Widget build(BuildContext context) {
    return CollapsibleCard(
      controller: ExpansionTileController(),
      color: Colors.blue,
      heading: 'Setup',
      initiallyExpanded: false,
      child: const Column(
        children: [
          SizedBox(width: 10,),
          CheckboxItem(
            label: 'Pickup Ancef + Insulin from Pharmacy',
            icon: Icon(Icons.medication),
          ),
          CheckboxItem(
            label: 'Pickup Precedex, TXA, and Nitro Sticks from Central Pyxis',
            icon: Icon(Icons.medication),
          ),
          CheckboxItem(
            label: 'Machine checked',
            icon: Icon(Icons.air),
          ),
          CheckboxItem(
            label: 'Suction checked',
            icon: Icon(Icons.air),
          ),
          CheckboxItem(
            label: 'A-Line Transducer',
            icon: Icon(Icons.speed),
          ),
          CheckboxItem(
            label: 'CVP Transducer',
            icon: Icon(Icons.speed),
          ),
          CheckboxItem(
            label: 'NIRS Sensor',
            icon: Icon(Icons.psychology),
          ),
          CheckboxItem(
            label: 'ASA Monitors',
            icon: Icon(Icons.monitor_heart),
          ),
          CheckboxItem(
            label: 'Airway Equipment',
            icon: Icon(Icons.air),
          ),
          CheckboxItem(
            label: 'A-Line Kit',
            icon: Icon(FontAwesomeIcons.syringe),
          ),
          CheckboxItem(
            label: 'Central Line + Cordis Kits',
            icon: Icon(FontAwesomeIcons.syringe),
          ),
          CheckboxItem(
            label: 'Hot line and push bag w/ triple gang',
            icon: Icon(Icons.hot_tub),
          ),
          CheckboxItem(
            label: 'Induction Meds',
            icon: Icon(Icons.medication),
          ),
          CheckboxItem(
            label: 'Blood Cooler (if necessary)',
            icon: Icon(Icons.bloodtype),
          ),
          CheckboxItem(
            label: 'Drips (see next section)',
            icon: Icon(Icons.medication),
          ),
        ],
      )
    );
  }
}

class Drips extends StatelessWidget {
  const Drips({super.key});

  @override
  Widget build(BuildContext context) {
    return CollapsibleCard(
      controller: ExpansionTileController(),
      color: Colors.blue,
      heading: 'Drips (left to right, top to bottom)',
      initiallyExpanded: false,
      child: const Column(
        children: [
          SizedBox(width: 10,),
          CheckboxItem(
            label: 'Epinephrine (0.03 mcg/kg/min)',
            icon: Icon(Icons.medication),
          ),
          CheckboxItem(
            label: 'TXA (10 mg/kg bolus, followed by 1 mg/kg/hr)',
            icon: Icon(Icons.medication),
          ),
          CheckboxItem(
            label: 'Insulin (0.5 U/hr)',
            icon: Icon(Icons.medication),
          ),
          CheckboxItem(
            label: 'Carrier (50 cc/hr)',
            icon: Icon(Icons.medication),
          ),
          CheckboxItem(
            label: 'Norepinephrine (0.05 mcg/kg/min)',
            icon: Icon(Icons.medication),
          ),
          CheckboxItem(
            label: 'Precedex (0.2 mcg/kg/hr)',
            icon: Icon(Icons.medication),
          ),
          CheckboxItem(
            label: 'Ketamine (0.3 mg/kg/hr)',
            icon: Icon(Icons.medication),
          ),
          CheckboxItem(
            label: 'Cefazolin (2-3 g Bolus, followed by 1 g/hr)',
            icon: Icon(Icons.medication),
          ),
        ],
      )
    );
  }
}

class Start extends StatelessWidget {
  const Start({super.key});

  @override
  Widget build(BuildContext context) {
    return CollapsibleCard(
      controller: ExpansionTileController(),
      color: Colors.green,
      heading: 'Case Start',
      initiallyExpanded: false,
      child: const Column(
        children: [
          SizedBox(width: 10,),
          CheckboxItem(
            label: 'Awake A-Line',
            icon: Icon(FontAwesomeIcons.syringe),
          ),
          CheckboxItem(
            label: 'Induction + Intubation',
            icon: Icon(Icons.snooze),
          ),
          CheckboxItem(
            label: 'Central Line + Cordis',
            icon: Icon(FontAwesomeIcons.syringe),
          ),
          CheckboxItem(
            label: 'Connect drips and hot line',
            icon: Icon(Icons.widgets),
          ),
          CheckboxItem(
            label: 'Baseline Labs',
            sublabel: 'SuperStat Platelets, Stat Fibrinogen, TEG',
            icon: Icon(Icons.bloodtype),
          ),
          CheckboxItem(
            label: 'Ancef Bolus + Drip',
            icon: Icon(Icons.medication),
          ),
          CheckboxItem(
            label: '100% FiO2 for lungs down',
            icon: Icon(Icons.air),
          ),
          CheckboxItem(
            label: 'Start Precedex + Ketamine',
            icon: Icon(Icons.medication),
          ),
          CheckboxItem(
            label: 'Discuss ANH with fellow and surgeon',
            icon: Icon(Icons.medication),
          ),
        ],
      )
    );
  }
}


class GoingOn extends StatelessWidget {
  const GoingOn({super.key});

  @override
  Widget build(BuildContext context) {
    return CollapsibleCard(
      controller: ExpansionTileController(),
      color: Colors.green,
      heading: 'Going Onto Bypass',
      initiallyExpanded: false,
      child: const Column(
        children: [
          SizedBox(width: 10,),
          CheckboxItem(
            label: 'Give Heparin (40U/kg)',
            icon: Icon(Icons.medication),
          ),
          CheckboxItem(
            label: 'TXA (10 mg/kg bolus, followed by 1 mg/kg/hr)',
            icon: Icon(Icons.medication),
          ),
          CheckboxItem(
            label: 'Draw ACT 3 mins post bypass (goal > 480)',
            icon: Icon(Icons.bloodtype),
          ),
          CheckboxItem(
            label: 'Empty Foley BEFORE Bypass',
            icon: Icon(Icons.water_drop),
          ),
          CheckboxItem(
            label: 'Monitor to Perfusion Mode',
            icon: Icon(Icons.monitor_heart),
          ),
          CheckboxItem(
            label: 'Vent to "Cardiac Bypass", turn flows to 0.2, gas off, vent off',
            icon: Icon(Icons.air),
          ),
          CheckboxItem(
            label: 'Redose Paralytic',
            icon: Icon(Icons.medication),
          ),
        ],
      )
    );
  }
}

class OnBypass extends StatelessWidget {
  const OnBypass({super.key});

  @override
  Widget build(BuildContext context) {
    return CollapsibleCard(
      controller: ExpansionTileController(),
      color: Colors.green,
      heading: 'On Bypass',
      initiallyExpanded: false,
      child: const Column(
        children: [
          SizedBox(width: 10,),
          CheckboxItem(
            label: 'Monitor Glucose, Adjust Insulin',
            icon: Icon(Icons.medication),
          ),
          CheckboxItem(
            label: 'Check all drips are appropriate',
            icon: Icon(Icons.medication),
          ),
          CheckboxItem(
            label: 'Draw up Protamine (0.6 mg per 100U Heparin)',
            icon: Icon(Icons.medication),
          ),
          CheckboxItem(
            label: 'Spike Propofol Drip',
            icon: Icon(Icons.medication),
          ),
          CheckboxItem(
            label: 'Pad: Fold blue towel into square and tape',
            sublabel: 'Pressure transducers go here',
            icon: Icon(Icons.medication),
          ),
          CheckboxItem(
            label: 'Pacemaker: Make sure in room',
            icon: Icon(Icons.electric_bolt),
          ),
          CheckboxItem(
            label: 'Pee: Foley Emptied',
            icon: Icon(Icons.water_drop),
          ),
          CheckboxItem(
            label: 'Pack: Pack emergency drugs for transport',
            icon: Icon(Icons.medication),
          ),
        ],
      )
    );
  }
}

class ComingOff extends StatelessWidget {
  const ComingOff({super.key});

  @override
  Widget build(BuildContext context) {
    return CollapsibleCard(
      controller: ExpansionTileController(),
      color: Colors.green,
      heading: 'Coming Off Bypass',
      initiallyExpanded: false,
      child: const Column(
        children: [
          SizedBox(width: 10,),
          CheckboxItem(
            label: 'Get Syringe from Perfusion: TEG, Platelets, Fibrinogen',
            icon: Icon(Icons.bloodtype),
          ),
          CheckboxItem(
            label: 'Surgen will ask for Protamine',
            sublabel: 'ANNOUNCE before giving',
            icon: Icon(Icons.medication),
          ),
          CheckboxItem(
            label: 'Draw ACT 3 mins post protamine',
            icon: Icon(Icons.bloodtype),
          ),
          CheckboxItem(
            label: 'When asked to ventilate, go very slow/gentle',
            icon: Icon(Icons.air),
          ),
          CheckboxItem(
            label: 'Watch CVP to assess BP/Volume status',
            icon: Icon(Icons.speed),
          ),
          CheckboxItem(
            label: 'Start Prop and wean volatile',
            icon: Icon(Icons.medication),
          ),
          CheckboxItem(
            label: 'Check Pacer',
            icon: Icon(Icons.electric_bolt),
          ),
          CheckboxItem(
            label: 'Correct coagulopathy based on labs',
            icon: Icon(Icons.bloodtype),
          ),
          CheckboxItem(
            label: 'Return pump blood/ANH',
            icon: Icon(Icons.bloodtype),
          ),
        ],
      )
    );
  }
}

class Closing extends StatelessWidget {
  const Closing({super.key});

  @override
  Widget build(BuildContext context) {
    return CollapsibleCard(
      controller: ExpansionTileController(),
      color: Colors.green,
      heading: 'Closing',
      initiallyExpanded: false,
      child: const Column(
        children: [
          SizedBox(width: 10,),
          CheckboxItem(
            label: 'Discontinue/Waste Ketamine',
            icon: Icon(Icons.medication),
          ),
          CheckboxItem(
            label: 'Discontinue Ancef and TXA when chest closed',
            icon: Icon(Icons.medication),
          ),
          CheckboxItem(
            label: 'Get Ambu Bag/Monitor for transport',
            icon: Icon(Icons.monitor_heart),
          ),
          CheckboxItem(
            label: 'Start propofol drip and wean volatile',
            icon: Icon(Icons.medication),
          ),
          CheckboxItem(
            label: 'Move Transducers to pad',
            icon: Icon(Icons.speed),
          ),
          CheckboxItem(
            label: 'Remove temp probe, NIRS, etc.',
            icon: Icon(Icons.speed),
          ),
          CheckboxItem(
            label: 'Tape and Organize Lines',
            icon: Icon(Icons.widgets),
          ),
        ],
      )
    );
  }
}

class PumpCaseGuide extends StatelessWidget {
  const PumpCaseGuide({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pump Case Guide', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      drawer: const CalculatorDrawer(),
      body: ListView(
        children: const [
          PreOpOrders(),
          Setup(),
          Drips(),
          Start(),
          GoingOn(),
          OnBypass(),
          ComingOff(),
          Closing(),
        ],),
    );
  }
}