import 'package:anesthesia_handbook/Calculators/calculator_drawer.dart';
import 'package:anesthesia_handbook/util.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PreOpOrders extends StatefulWidget {
  const PreOpOrders({super.key});

  @override
  State<PreOpOrders> createState() => _PreOpOrdersState();
}

class _PreOpOrdersState extends State<PreOpOrders> {
  bool _mrsa = false;
  bool _typeandcross = false;
  bool _gabapentin = false;
  bool _tylenol = false;
  bool _insulin = false;
  bool _cefazolin = false;
  bool _tech = false;

  @override
  Widget build(BuildContext context) {
    return CollapsibleCard(
      controller: ExpansionTileController(),
      color: Colors.blue,
      heading: 'Pre-Op Orders',
      initiallyExpanded: false,
      child: Column(
        children: [
          const SizedBox(width: 10,),
          CheckboxListTile(
            title: const Text('T/C 2-4U PRBCs, 2-4U FFP'),
            value: _typeandcross,
            onChanged: (bool? value) {
              setState(() {
              _typeandcross = value ?? false;
              });
            },
            controlAffinity: ListTileControlAffinity.leading,
            secondary: const Icon(Icons.bloodtype),
          ),
          CheckboxListTile(
            title: const Text('MRSA Nares Swab'),
            value: _mrsa,
            onChanged: (bool? value) {
              setState(() {
              _mrsa = value ?? false;
              });
            },
            controlAffinity: ListTileControlAffinity.leading,
            secondary: const Icon(Icons.coronavirus),
          ),
          CheckboxListTile(
            title: const Text('Gabapentin 600 mg PO once'),
            value: _gabapentin,
            onChanged: (bool? value) {
              setState(() {
              _gabapentin = value ?? false;
              });
            },
            controlAffinity: ListTileControlAffinity.leading,
            secondary: const Icon(Icons.medication),
          ),
          CheckboxListTile(
            title: const Text('Tylenol 1000 mg PO once'),
            value: _tylenol,
            onChanged: (bool? value) {
              setState(() {
              _tylenol = value ?? false;
              });
            },
            controlAffinity: ListTileControlAffinity.leading,
            secondary: const Icon(Icons.medication),
          ),
          CheckboxListTile(
            title: const Text('Intraop Insulin Drip'),
            value: _insulin,
            onChanged: (bool? value) {
              setState(() {
              _insulin = value ?? false;
              });
            },
            controlAffinity: ListTileControlAffinity.leading,
            secondary: const Icon(Icons.medication),
          ),
          CheckboxListTile(
            title: const Text('Intraop Cefazolin Drip'),
            value: _cefazolin,
            onChanged: (bool? value) {
              setState(() {
              _cefazolin = value ?? false;
              });
            },
            controlAffinity: ListTileControlAffinity.leading,
            secondary: const Icon(Icons.medication),
          ),
          CheckboxListTile(
            title: const Text('Anesthesia Tech Emailed (accm-or-request@jhmi.edu)'),
            value: _tech,
            onChanged: (bool? value) {
              setState(() {
              _tech = value ?? false;
              });
            },
            controlAffinity: ListTileControlAffinity.leading,
            secondary: const Icon(Icons.email),
          ),
        ],
      )
    );
  }
}

class Setup extends StatefulWidget {
  const Setup({super.key});

  @override
  State<Setup> createState() => _SetupState();
}

class _SetupState extends State<Setup> {
  bool _pickuppharm = false;
  bool _pickuppyxis = false;
  bool _machine = false;
  bool _suction = false;
  bool _alinetransducer = false;
  bool _cvp = false;
  bool _nirs = false;
  bool _asa = false;
  bool _airway = false;
  bool _centralines = false;
  bool _alinekit = false;
  bool _induction = false;
  bool _hotline = false;
  bool _cooler = false;
  bool _drips = false;

  @override
  Widget build(BuildContext context) {
    return CollapsibleCard(
      controller: ExpansionTileController(),
      color: Colors.blue,
      heading: 'Setup',
      initiallyExpanded: false,
      child: Column(
        children: [
          const SizedBox(width: 10,),
          CheckboxListTile(
            title: const Text('Pickup Ancef + Insulin from Pharmacy'),
            value: _pickuppharm,
            onChanged: (bool? value) {
              setState(() {
              _pickuppharm = value ?? false;
              });
            },
            controlAffinity: ListTileControlAffinity.leading,
            secondary: const Icon(Icons.medication),
          ),
          CheckboxListTile(
            title: const Text('Pickup Precedex, TXA, and Nitro Sticks from Central Pyxis'),
            value: _pickuppyxis,
            onChanged: (bool? value) {
              setState(() {
              _pickuppyxis = value ?? false;
              });
            },
            controlAffinity: ListTileControlAffinity.leading,
            secondary: const Icon(Icons.medication),
          ),
          CheckboxListTile(
            title: const Text('Machine checked'),
            value: _machine,
            onChanged: (bool? value) {
              setState(() {
              _machine = value ?? false;
              });
            },
            controlAffinity: ListTileControlAffinity.leading,
            secondary: const Icon(Icons.air),
          ),
          CheckboxListTile(
            title: const Text('Suction checked'),
            value: _suction,
            onChanged: (bool? value) {
              setState(() {
              _suction = value ?? false;
              });
            },
            controlAffinity: ListTileControlAffinity.leading,
            secondary: const Icon(Icons.air),
          ),
          CheckboxListTile(
            title: const Text('A-Line Transducer'),
            value: _alinetransducer,
            onChanged: (bool? value) {
              setState(() {
              _alinetransducer = value ?? false;
              });
            },
            controlAffinity: ListTileControlAffinity.leading,
            secondary: const Icon(Icons.speed),
          ),
          CheckboxListTile(
            title: const Text('CVP Transducer'),
            value: _cvp,
            onChanged: (bool? value) {
              setState(() {
              _cvp = value ?? false;
              });
            },
            controlAffinity: ListTileControlAffinity.leading,
            secondary: const Icon(Icons.speed),
          ),
          CheckboxListTile(
            title: const Text('NIRS Sensor'),
            value: _nirs,
            onChanged: (bool? value) {
              setState(() {
              _nirs = value ?? false;
              });
            },
            controlAffinity: ListTileControlAffinity.leading,
            secondary: const Icon(Icons.psychology),
          ),
          CheckboxListTile(
            title: const Text('ASA Monitors'),
            value: _asa,
            onChanged: (bool? value) {
              setState(() {
              _asa = value ?? false;
              });
            },
            controlAffinity: ListTileControlAffinity.leading,
            secondary: const Icon(Icons.monitor_heart),
          ),
          CheckboxListTile(
            title: const Text('Airway Equipment'),
            value: _airway,
            onChanged: (bool? value) {
              setState(() {
              _airway = value ?? false;
              });
            },
            controlAffinity: ListTileControlAffinity.leading,
            secondary: const Icon(Icons.air),
          ),
          CheckboxListTile(
            title: const Text('A-Line Kit'),
            value: _alinekit,
            onChanged: (bool? value) {
              setState(() {
              _alinekit = value ?? false;
              });
            },
            controlAffinity: ListTileControlAffinity.leading,
            secondary: const Icon(FontAwesomeIcons.syringe),
          ),
          CheckboxListTile(
            title: const Text('Central Line + Cordis Kits'),
            value: _centralines,
            onChanged: (bool? value) {
              setState(() {
              _centralines = value ?? false;
              });
            },
            controlAffinity: ListTileControlAffinity.leading,
            secondary: const Icon(FontAwesomeIcons.syringe),
          ),
          CheckboxListTile(
            title: const Text('Hot line and push bag w/ triple gang'),
            value: _hotline,
            onChanged: (bool? value) {
              setState(() {
              _hotline = value ?? false;
              });
            },
            controlAffinity: ListTileControlAffinity.leading,
            secondary: const Icon(Icons.hot_tub),
          ),
          CheckboxListTile(
            title: const Text('Induction Meds'),
            value: _induction,
            onChanged: (bool? value) {
              setState(() {
              _induction = value ?? false;
              });
            },
            controlAffinity: ListTileControlAffinity.leading,
            secondary: const Icon(Icons.medication),
          ),
          CheckboxListTile(
            title: const Text('Blood Cooler (if necessary)'),
            value: _cooler,
            onChanged: (bool? value) {
              setState(() {
              _cooler = value ?? false;
              });
            },
            controlAffinity: ListTileControlAffinity.leading,
            secondary: const Icon(Icons.bloodtype),
          ),
          CheckboxListTile(
            title: const Text('Drips (see next section)'),
            value: _drips,
            onChanged: (bool? value) {
              setState(() {
              _drips = value ?? false;
              });
            },
            controlAffinity: ListTileControlAffinity.leading,
            secondary: const Icon(Icons.medication),
          ),
        ],
      )
    );
  }
}

class Drips extends StatefulWidget {
  const Drips({super.key});

  @override
  State<Drips> createState() => _DripsState();
}

class _DripsState extends State<Drips> {
  bool _epi = false;
  bool _txa = false;
  bool _insulin = false;
  bool _carrier = false;
  bool _norepi = false;
  bool _precedex = false;
  bool _ketamine = false;
  bool _cefazolin = false;

  @override
  Widget build(BuildContext context) {
    return CollapsibleCard(
      controller: ExpansionTileController(),
      color: Colors.blue,
      heading: 'Drips (left to right, top to bottom)',
      initiallyExpanded: false,
      child: Column(
        children: [
          const SizedBox(width: 10,),
          CheckboxListTile(
            title: const Text('Epinephrine (0.03 mcg/kg/min)'),
            value: _epi,
            onChanged: (bool? value) {
              setState(() {
              _epi = value ?? false;
              });
            },
            controlAffinity: ListTileControlAffinity.leading,
            secondary: const Icon(Icons.medication),
          ),
          CheckboxListTile(
            title: const Text('TXA (10 mg/kg bolus, followed by 1 mg/kg/hr)'),
            value: _txa,
            onChanged: (bool? value) {
              setState(() {
              _txa = value ?? false;
              });
            },
            controlAffinity: ListTileControlAffinity.leading,
            secondary: const Icon(Icons.medication),
          ),
          CheckboxListTile(
            title: const Text('Insulin (0.5 U/hr)'),
            value: _insulin,
            onChanged: (bool? value) {
              setState(() {
              _insulin = value ?? false;
              });
            },
            controlAffinity: ListTileControlAffinity.leading,
            secondary: const Icon(Icons.medication),
          ),
          CheckboxListTile(
            title: const Text('Carrier (50 cc/hr)'),
            value: _carrier,
            onChanged: (bool? value) {
              setState(() {
              _carrier = value ?? false;
              });
            },
            controlAffinity: ListTileControlAffinity.leading,
            secondary: const Icon(Icons.medication),
          ),
          CheckboxListTile(
            title: const Text('Norepinephrine (0.05 mcg/kg/min)'),
            value: _norepi,
            onChanged: (bool? value) {
              setState(() {
              _norepi = value ?? false;
              });
            },
            controlAffinity: ListTileControlAffinity.leading,
            secondary: const Icon(Icons.medication),
          ),
          CheckboxListTile(
            title: const Text('Precedex (0.2 mcg/kg/hr)'),
            value: _precedex,
            onChanged: (bool? value) {
              setState(() {
              _precedex = value ?? false;
              });
            },
            controlAffinity: ListTileControlAffinity.leading,
            secondary: const Icon(Icons.medication),
          ),
          CheckboxListTile(
            title: const Text('Ketamine (0.3 mg/kg/hr)'),
            value: _ketamine,
            onChanged: (bool? value) {
              setState(() {
              _ketamine = value ?? false;
              });
            },
            controlAffinity: ListTileControlAffinity.leading,
            secondary: const Icon(Icons.medication),
          ),
          CheckboxListTile(
            title: const Text('Cefazolin (2-3 g Bolus, followed by 1 g/hr)'),
            value: _cefazolin,
            onChanged: (bool? value) {
              setState(() {
              _cefazolin = value ?? false;
              });
            },
            controlAffinity: ListTileControlAffinity.leading,
            secondary: const Icon(Icons.medication),
          ),
        ],
      )
    );
  }
}

class GoingOn extends StatefulWidget {
  const GoingOn({super.key});

  @override
  State<GoingOn> createState() => _GoingOnState();
}

class _GoingOnState extends State<GoingOn> {
  bool _heparin = false;
  bool _txa = false;
  bool _act = false;
  bool _foley = false;
  bool _monitor = false;
  bool _vent = false;
  bool _reparalyze = false;

  @override
  Widget build(BuildContext context) {
    return CollapsibleCard(
      controller: ExpansionTileController(),
      color: Colors.green,
      heading: 'Going Onto Bypass',
      initiallyExpanded: false,
      child: Column(
        children: [
          const SizedBox(width: 10,),
          CheckboxListTile(
            title: const Text('Give Heparin (40U/kg)'),
            value: _heparin,
            onChanged: (bool? value) {
              setState(() {
              _heparin = value ?? false;
              });
            },
            controlAffinity: ListTileControlAffinity.leading,
            secondary: const Icon(Icons.medication),
          ),
          CheckboxListTile(
            title: const Text('TXA (10 mg/kg bolus, followed by 1 mg/kg/hr)'),
            value: _txa,
            onChanged: (bool? value) {
              setState(() {
              _txa = value ?? false;
              });
            },
            controlAffinity: ListTileControlAffinity.leading,
            secondary: const Icon(Icons.medication),
          ),
          CheckboxListTile(
            title: const Text('Draw ACT 3 mins post bypass (goal > 480)'),
            value: _act,
            onChanged: (bool? value) {
              setState(() {
              _act = value ?? false;
              });
            },
            controlAffinity: ListTileControlAffinity.leading,
            secondary: const Icon(Icons.bloodtype),
          ),
          CheckboxListTile(
            title: const Text('Empty Foley BEFORE Bypass'),
            value: _foley,
            onChanged: (bool? value) {
              setState(() {
              _foley = value ?? false;
              });
            },
            controlAffinity: ListTileControlAffinity.leading,
            secondary: const Icon(Icons.water_drop),
          ),
          CheckboxListTile(
            title: const Text('Monitor to Perfusion Mode'),
            value: _monitor,
            onChanged: (bool? value) {
              setState(() {
              _monitor = value ?? false;
              });
            },
            controlAffinity: ListTileControlAffinity.leading,
            secondary: const Icon(Icons.monitor_heart),
          ),
          CheckboxListTile(
            title: const Text('Vent to "Cardiac Bypass", turn flows to 0.2, gas off, vent off'),
            value: _vent,
            onChanged: (bool? value) {
              setState(() {
              _vent = value ?? false;
              });
            },
            controlAffinity: ListTileControlAffinity.leading,
            secondary: const Icon(Icons.medication),
          ),
          CheckboxListTile(
            title: const Text('Redose Paralytic'),
            value: _reparalyze,
            onChanged: (bool? value) {
              setState(() {
              _reparalyze = value ?? false;
              });
            },
            controlAffinity: ListTileControlAffinity.leading,
            secondary: const Icon(Icons.medication),
          ),
        ],
      )
    );
  }
}

class OnBypass extends StatefulWidget {
  const OnBypass({super.key});

  @override
  State<OnBypass> createState() => _OnBypassState();
}

class _OnBypassState extends State<OnBypass> {
  bool _pressors = false;
  bool _protamine = false;
  bool _propofol = false;
  bool _pad = false;
  bool _pacemaker = false;
  bool _pee = false;
  bool _pack = false;

  @override
  Widget build(BuildContext context) {
    return CollapsibleCard(
      controller: ExpansionTileController(),
      color: Colors.green,
      heading: 'On Bypass',
      initiallyExpanded: false,
      child: Column(
        children: [
          const SizedBox(width: 10,),
          CheckboxListTile(
            title: const Text('Pressors'),
            subtitle: const Text('Epi, Vaso, Ca2+, Phenylephrine, Ephedrine, All Drips'),
            value: _pressors,
            onChanged: (bool? value) {
              setState(() {
              _pressors = value ?? false;
              });
            },
            controlAffinity: ListTileControlAffinity.leading,
            secondary: const Icon(Icons.medication),
          ),
          CheckboxListTile(
            title: const Text('Protamine'),
            subtitle: const Text('1 mg/100 U Heparin, max 50 mg\n KEEP AWAY FROM PATIENT'),
            isThreeLine: true,
            value: _protamine,
            onChanged: (bool? value) {
              setState(() {
              _protamine = value ?? false;
              });
            },
            controlAffinity: ListTileControlAffinity.leading,
            secondary: const Icon(Icons.medication),
          ),
          CheckboxListTile(
            title: const Text('Propofol: Ready for Transport'),
            value: _propofol,
            onChanged: (bool? value) {
              setState(() {
              _propofol = value ?? false;
              });
            },
            controlAffinity: ListTileControlAffinity.leading,
            secondary: const Icon(Icons.medication),
          ),
          CheckboxListTile(
            title: const Text('Pad: Fold blue towel into square and tape'),
            subtitle: const Text('Pressure transducers go here'),
            value: _pad,
            onChanged: (bool? value) {
              setState(() {
              _pad = value ?? false;
              });
            },
            controlAffinity: ListTileControlAffinity.leading,
            secondary: const Icon(Icons.medication),
          ),
          CheckboxListTile(
            title: const Text('Pacemaker: Make sure in room'),
            value: _pacemaker,
            onChanged: (bool? value) {
              setState(() {
              _pacemaker = value ?? false;
              });
            },
            controlAffinity: ListTileControlAffinity.leading,
            secondary: const Icon(Icons.electric_bolt),
          ),
          CheckboxListTile(
            title: const Text('Pee: Foley Emptied'),
            value: _pee,
            onChanged: (bool? value) {
              setState(() {
              _pee = value ?? false;
              });
            },
            controlAffinity: ListTileControlAffinity.leading,
            secondary: const Icon(Icons.water_drop),
          ),
          CheckboxListTile(
            title: const Text('Pack: Pack emergency drugs for transport'),
            value: _pack,
            onChanged: (bool? value) {
              setState(() {
              _pack = value ?? false;
              });
            },
            controlAffinity: ListTileControlAffinity.leading,
            secondary: const Icon(Icons.medication),
          ),
        ],
      )
    );
  }
}

class ComingOff extends StatefulWidget {
  const ComingOff({super.key});

  @override
  State<ComingOff> createState() => _ComingOffState();
}

class _ComingOffState extends State<ComingOff> {
  bool _labs = false;
  bool _protamine = false;
  bool _act = false;
  bool _ventilate = false;
  bool _cvp = false;
  bool _prop = false;
  bool _pacer = false;
  bool _coags = false;

  @override
  Widget build(BuildContext context) {
    return CollapsibleCard(
      controller: ExpansionTileController(),
      color: Colors.green,
      heading: 'Coming Off Bypass',
      initiallyExpanded: false,
      child: Column(
        children: [
          const SizedBox(width: 10,),
          CheckboxListTile(
            title: const Text('Get Syringe from Perfusion: TEG, Platelets, Fibrinogen'),
            value: _labs,
            onChanged: (bool? value) {
              setState(() {
              _labs = value ?? false;
              });
            },
            controlAffinity: ListTileControlAffinity.leading,
            secondary: const Icon(Icons.bloodtype),
          ),
          CheckboxListTile(
            title: const Text('Surgen will ask for Protamine'),
            subtitle: const Text('ANNOUNCE before giving'),
            value: _protamine,
            onChanged: (bool? value) {
              setState(() {
              _protamine = value ?? false;
              });
            },
            controlAffinity: ListTileControlAffinity.leading,
            secondary: const Icon(Icons.medication),
          ),
          CheckboxListTile(
            title: const Text('Draw ACT 3 mins post protamine'),
            value: _act,
            onChanged: (bool? value) {
              setState(() {
              _act = value ?? false;
              });
            },
            controlAffinity: ListTileControlAffinity.leading,
            secondary: const Icon(Icons.bloodtype),
          ),
          CheckboxListTile(
            title: const Text('When asked to ventilate, go very slow/gentle'),
            value: _ventilate,
            onChanged: (bool? value) {
              setState(() {
              _ventilate = value ?? false;
              });
            },
            controlAffinity: ListTileControlAffinity.leading,
            secondary: const Icon(Icons.air),
          ),
          CheckboxListTile(
            title: const Text('Watch CVP to assess BP/Volume status'),
            value: _cvp,
            onChanged: (bool? value) {
              setState(() {
              _cvp = value ?? false;
              });
            },
            controlAffinity: ListTileControlAffinity.leading,
            secondary: const Icon(Icons.speed),
          ),
          CheckboxListTile(
            title: const Text('Start Prop and wean volatile'),
            value: _prop,
            onChanged: (bool? value) {
              setState(() {
              _prop = value ?? false;
              });
            },
            controlAffinity: ListTileControlAffinity.leading,
            secondary: const Icon(Icons.medication),
          ),
          CheckboxListTile(
            title: const Text('Check Pacer'),
            value: _pacer,
            onChanged: (bool? value) {
              setState(() {
              _pacer = value ?? false;
              });
            },
            controlAffinity: ListTileControlAffinity.leading,
            secondary: const Icon(Icons.electric_bolt),
          ),
          CheckboxListTile(
            title: const Text('Correct coagulopathy based on labs'),
            value: _coags,
            onChanged: (bool? value) {
              setState(() {
              _coags = value ?? false;
              });
            },
            controlAffinity: ListTileControlAffinity.leading,
            secondary: const Icon(Icons.bloodtype),
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
          GoingOn(),
          OnBypass(),
          ComingOff(),
        ],),
    );
  }
}