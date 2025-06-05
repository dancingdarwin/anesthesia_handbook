import 'package:anesthesia_handbook/Calculators/calculator_drawer.dart';
import 'package:anesthesia_handbook/util.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PreOp extends StatelessWidget {
  const PreOp({super.key});

  @override
  Widget build(BuildContext context) {
    return CollapsibleCard(
      controller: ExpansionTileController(),
      color: Colors.blue,
      heading: 'Pre-Op',
      initiallyExpanded: false,
      child: const Column(
        children: [
          SizedBox(width: 10,),
          CheckboxItem(
            label: 'Review H&P, CPO Note',
            icon: Icon(Icons.person),
          ),
          CheckboxItem(
            label: 'Review Labs',
            icon: Icon(Icons.bloodtype),
          ),
          CheckboxItem(
            label: 'Review Cardiology Data (EKG, TTE, Cath)',
            icon: Icon(Icons.favorite),
          ),
          CheckboxItem(
            label: 'Review Anethestic/Airway History',
            icon: Icon(Icons.history),
          ),
          CheckboxItem(
            label: 'Call/Text Attending',
            icon: Icon(Icons.phone),
          ),
          CheckboxItem(
            label: 'Preop Orders',
            icon: Icon(Icons.medication),
          ),
          CheckboxItem(
            label: 'Email Anesthesia Tech if equipment needed',
            sublabel: 'accm-or-request@jhmi.edu',
            icon: Icon(Icons.email),
          ),
          CheckboxItem(
            label: 'Write Pre-Op Note',
            icon: Icon(Icons.note),
          ),
          CheckboxItem(
            label: 'T/S and T/C if necessary',
            icon: Icon(Icons.bloodtype),
          ),
        ],
      )
    );
  }
}

class StandardSetup extends StatelessWidget {
  const StandardSetup({super.key});

  @override
  Widget build(BuildContext context) {
    return CollapsibleCard(
      controller: ExpansionTileController(),
      color: Colors.blue,
      heading: 'Basic Room Setup',
      initiallyExpanded: false,
      child: const Column(
        children: [
          SizedBox(width: 10,),
          Text('Machine', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          CheckboxItem(
            label: 'Machine Check',
            icon: Icon(Icons.air),
          ),
          CheckboxItem(
            label: 'Ambubag Present',
            icon: Icon(Icons.air),
          ),
          Text('Suction', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          CheckboxItem(
            label: 'Suction Present and working',
            icon: Icon(Icons.air),
          ),
          Text('Monitors', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          CheckboxItem(
            label: 'Blood Pressure Cable',
            icon: Icon(Icons.monitor_heart),
          ),
          CheckboxItem(
            label: 'Pulse Ox',
            icon: Icon(Icons.monitor_heart),
          ),
          CheckboxItem(
            label: 'EKG Leads laid out',
            icon: Icon(Icons.monitor_heart),
          ),
          CheckboxItem(
            label: 'EtCO2 Connected',
            icon: Icon(Icons.monitor_heart),
          ),
          CheckboxItem(
            label: 'Temperature Probe',
            icon: Icon(Icons.thermostat),
          ),
          Text('Airway', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          CheckboxItem(
            label: 'Laryngoscope with working light',
            sublabel: 'CMAC/McGrath if needed',
            icon: Icon(Icons.lightbulb),
          ),
          CheckboxItem(
            label: 'ETT +/- Stylet',
            sublabel: 'Check if cuff inflates',
            icon: Icon(Icons.air),
          ),
          CheckboxItem(
            label: 'Oral Airway',
            icon: Icon(Icons.air),
          ),
          CheckboxItem(
            label: 'Bougie',
            icon: Icon(Icons.air),
          ),
          CheckboxItem(
            label: 'Eye Tape',
            icon: Icon(Icons.remove_red_eye),
          ),
          Text('IV', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          CheckboxItem(
            label: 'IV Kit(s)',
            sublabel: 'Cannula, Tegaderm, Tape, Gauze, Alcohol Swab, Torniquet, Flush+Extension',
            icon: Icon(FontAwesomeIcons.syringe),
          ),
          CheckboxItem(
            label: 'Fluid Warmer (if needed)',
            icon: Icon(Icons.local_fire_department),
          ),
          CheckboxItem(
            label: 'Freeflow/Push Bag',
            sublabel: 'Can grab from PreOp',
            icon: Icon(Icons.water),
          ),
          Text('Drugs', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          CheckboxItem(
            label: 'Induction Meds',
            sublabel: 'Propofol, Lidocaine, Fentanyl, Rocuronium',
            icon: Icon(Icons.medication),
          ),
          CheckboxItem(
            label: 'Controlled Substances',
            sublabel: 'e.g. Fentanyl, Hydromorphone, Ketamine, Versed',
            icon: Icon(Icons.medication),
          ),
          CheckboxItem(
            label: 'Drips',
            sublabel: 'e.g. Carrier, Propofol, Ketamine, Norepinephrine',
            icon: Icon(Icons.medication),
          ),
          CheckboxItem(
            label: 'Emergency Drugs',
            sublabel: 'e.g. Epi, Atropine, Succ, Glyco, Phenylephrine, Ephedrine',
            icon: Icon(Icons.medication),
          ),
          CheckboxItem(
            label: 'Post-Induction Meds',
            sublabel: 'Dexamethasone, Cefazolin',
            icon: Icon(Icons.medication),
          ),
          Text('Special/Software', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          CheckboxItem(
            label: 'EPIC w/ Patient + Macro Loaded',
            icon: Icon(Icons.computer),
          ),
          CheckboxItem(
            label: 'Bair Hugger',
            icon: Icon(Icons.hot_tub),
          ),
          CheckboxItem(
            label: 'A-Line (if necessary)',
            icon: Icon(FontAwesomeIcons.syringe),
          ),
          CheckboxItem(
            label: 'OGT/NGT (if necessary)',
            icon: Icon(Icons.fastfood),
          ),
        ],
      )
    );
  }
}

class ALine extends StatelessWidget {
  const ALine({super.key});

  @override
  Widget build(BuildContext context) {
    return CollapsibleCard(
      controller: ExpansionTileController(),
      color: Colors.red,
      heading: 'Arterial Line Kit',
      initiallyExpanded: false,
      child: const Column(
        children: [
          SizedBox(width: 10,),
          CheckboxItem(
            label: 'A-Line Transducer',
            sublabel: 'Call tech for one (or email night before)',
            icon: Icon(Icons.speed),
          ),
          CheckboxItem(
            label: 'Arrow Catheter',
            icon: Icon(FontAwesomeIcons.syringe),
          ),
          CheckboxItem(
            label: 'Chlorhexidine Swab',
            icon: Icon(FontAwesomeIcons.syringe),
          ),
          CheckboxItem(
            label: 'Flush + Short Pressure Tubing Extension',
            icon: Icon(Icons.water_drop),
          ),
          CheckboxItem(
            label: 'Sterile Gloves',
            icon: Icon(FontAwesomeIcons.mitten),
          ),
          CheckboxItem(
            label: 'Wrist Bump',
            sublabel: 'Roll up one blue towel',
            icon: Icon(Icons.handshake),
          ),
          CheckboxItem(
            label: 'Clear Tape + Tegaderm',
            icon: Icon(FontAwesomeIcons.tape),
          ),
          CheckboxItem(
            label: 'Ultrasound + Probe Cover',
            sublabel: 'Can call tech/email night before or grab from equipment room',
            icon: Icon(Icons.camera),
          ),
        ],
      )
    );
  }
}

class StandardStart extends StatelessWidget {
  const StandardStart({super.key});

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
            label: 'STOP-ID, Start Data Collection',
            icon: Icon(Icons.monitor_heart),
          ),
          CheckboxItem(
            label: 'Apply Monitors',
            sublabel: 'BP, Pulse Ox, EKG',
            icon: Icon(Icons.monitor_heart),
          ),
          CheckboxItem(
            label: 'Attach and Check IV',
            sublabel: 'Check patency, flush, and secure',
            icon: Icon(Icons.water_drop),
          ),
          CheckboxItem(
            label: 'Preoxygenate',
            sublabel: 'APL Open, FiO2 100%',
            icon: Icon(Icons.air),
          ),
          CheckboxItem(
            label: 'Induce/Intubate',
            icon: Icon(Icons.medication),
          ),
          CheckboxItem(
            label: 'Switch to vent/Turn on anesthetic',
            icon: Icon(Icons.air),
          ),
          CheckboxItem(
            label: 'Tape Tubes and Eyes',
            icon: Icon(FontAwesomeIcons.tape),
          ),
          CheckboxItem(
            label: 'Temp Probe, BIS, NGT, OGT, etc.',
            icon: Icon(Icons.thermostat),
          ),
          CheckboxItem(
            label: 'Check/Slow down IV drips if needed',
            icon: Icon(Icons.water_drop),
          ),
          CheckboxItem(
            label: 'Additional Lines',
            icon: Icon(FontAwesomeIcons.syringe),
          ),
          CheckboxItem(
            label: 'Bair hugger',
            icon: Icon(Icons.hot_tub),
          ),
          CheckboxItem(
            label: 'Patient Positioning',
            icon: Icon(Icons.person),
          ),
          CheckboxItem(
            label: 'Decadron + Abx prior to incision',
            icon: Icon(Icons.medication),
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
      heading: 'Closing/Waking Up',
      initiallyExpanded: false,
      child: const Column(
        children: [
          SizedBox(width: 10,),
          CheckboxItem(
            label: 'Text Attending',
            icon: Icon(Icons.phone),
          ),
          CheckboxItem(
            label: 'Give Zofran',
            icon: Icon(Icons.medication),
          ),
          CheckboxItem(
            label: 'Wean Anesthetic',
            icon: Icon(Icons.medication),
          ),
          CheckboxItem(
            label: 'Consider adjuncts',
            sublabel: 'e.g. Toradol (discuss w/ surgeon), APAP (check if given in pre-op), Precedex',
            icon: Icon(Icons.water_drop),
          ),
          CheckboxItem(
            label: 'Get Patient Breathing',
            sublabel: 'Pressure Support, Consider 100% FiO2 if not using Nitrous',
            icon: Icon(Icons.air),
          ),
          CheckboxItem(
            label: 'Titrate Narcotics to RR',
            icon: Icon(Icons.medication),
          ),
          CheckboxItem(
            label: 'Reverse Paralysis',
            sublabel: 'Check TOF, give sugammadex if safe to do so',
            icon: Icon(Icons.medication),
          ),
          CheckboxItem(
            label: 'Vent to Spontaneous',
            icon: Icon(Icons.air),
          ),
          CheckboxItem(
            label: 'Call Attending to extubate',
            icon: Icon(Icons.phone),
          ),
          CheckboxItem(
            label: 'Extubate!',
            sublabel: 'Check if misting mask, then switch to green mask',
            icon: Icon(Icons.air),
          ),
        ],
      )
    );
  }
}

class Trauma extends StatelessWidget {
  const Trauma({super.key});

  @override
  Widget build(BuildContext context) {
    return CollapsibleCard(
      controller: ExpansionTileController(),
      color: Colors.yellow,
      heading: 'Trauma Room Setup',
      initiallyExpanded: false,
      child: const Column(
        children: [
          SizedBox(width: 10,),
          CheckboxItem(
            label: 'Basic Room Setup',
            sublabel: 'Including daily machine check',
            icon: Icon(Icons.handyman),
          ),
          CheckboxItem(
            label: 'A-Line Setup/Transducer',
            icon: Icon(FontAwesomeIcons.syringe),
          ),
          CheckboxItem(
            label: 'Airway',
            sublabel: 'DL, CMAC, Bougie, Oral Airway, ETT',
            icon: Icon(Icons.air),
          ),
          CheckboxItem(
            label: 'Ultrasound',
            icon: Icon(Icons.camera),
          ),
          CheckboxItem(
            label: 'Fluid Warmer Setup',
            sublabel: 'Use Codonics to print timed label for bag',
            icon: Icon(Icons.local_fire_department),
          ),
          CheckboxItem(
            label: '2-3x PIV Kits (14/16/18G)',
            icon: Icon(Icons.local_fire_department),
          ),
          CheckboxItem(
            label: 'Push Bag/Freeflow',
            sublabel: 'Use Codonics to print timed label for bag',
            icon: Icon(Icons.water),
          ),
          CheckboxItem(
            label: 'Baby Epi (10 mcg/mL)',
            sublabel: 'Take a 1 mg Vial and dilute into 100 cc bag. Carry a stick w/ you for good luck',
            icon: Icon(Icons.medication),
          ),
          CheckboxItem(
            label: 'Calcium Chloride',
            icon: Icon(Icons.medication),
          ),
          CheckboxItem(
            label: '4-5 bags of 5% Albumin',
            icon: Icon(Icons.medication),
          ),
          CheckboxItem(
            label: 'Epi/Norepi bags',
            icon: Icon(Icons.medication),
          ),
          CheckboxItem(
            label: 'Cefazolin + Flagyl',
            sublabel: 'Keep easily available but not drawn up',
            icon: Icon(Icons.medication),
          ),
          CheckboxItem(
            label: 'Emergency meds',
            icon: Icon(Icons.medication),
          ),
        ],
      )
    );
  }
}

class Ditzel extends StatelessWidget {
  const Ditzel({super.key});

  @override
  Widget build(BuildContext context) {
    return CollapsibleCard(
      controller: ExpansionTileController(),
      color: Colors.yellow,
      heading: 'Ditzel Room Setup',
      initiallyExpanded: false,
      child: const Column(
        children: [
          SizedBox(width: 10,),
          CheckboxItem(
            label: 'Basic Room Setup',
            sublabel: 'Including daily machine check',
            icon: Icon(Icons.handyman),
          ),
          CheckboxItem(
            label: 'A-Line Setup/Transducer',
            icon: Icon(FontAwesomeIcons.syringe),
          ),
          CheckboxItem(
            label: '2x 20 cc Syringe for Propofol',
            sublabel: 'Prelabel Syringe w/ needle packaging and vial nearby',
            icon: Icon(Icons.medication),
          ),
          CheckboxItem(
            label: '1x 10 cc Syringe for Roc',
            icon: Icon(Icons.medication),
          ),
          CheckboxItem(
            label: '1x 10 cc Syringe for Fentanyl',
            icon: Icon(Icons.medication),
          ),
          CheckboxItem(
            label: '1x 3 cc Syringe for Midazolam',
            icon: Icon(Icons.medication),
          ),
          CheckboxItem(
            label: '1x Lidocaine Syringe',
            icon: Icon(Icons.medication),
          ),
          CheckboxItem(
            label: '1x Saline Flush for Ancef',
            icon: Icon(Icons.medication),
          ),
          CheckboxItem(
            label: 'Push Bag/Freeflow',
            sublabel: "Don't spike, just have components ready",
            icon: Icon(Icons.water),
          ),
        ],
      )
    );
  }
}

class NIR extends StatelessWidget {
  const NIR({super.key});

  @override
  Widget build(BuildContext context) {
    return CollapsibleCard(
      controller: ExpansionTileController(),
      color: Colors.yellow,
      heading: 'Neuro IR Setup (aka 316 aka Hell)',
      initiallyExpanded: false,
      child: const Column(
        children: [
          SizedBox(width: 10,),
          CheckboxItem(
            label: 'Basic Room Setup',
            sublabel: 'Including daily machine check',
            icon: Icon(Icons.handyman),
          ),
          CheckboxItem(
            label: 'A-Line Setup/Transducer',
            sublabel: 'Expect to tap into their arterial sheath however',
            icon: Icon(FontAwesomeIcons.syringe),
          ),
          CheckboxItem(
            label: 'CMAC',
            icon: Icon(Icons.air),
          ),
          CheckboxItem(
            label: 'Remote Drug Box',
            sublabel: 'Grab from pharmacy',
            icon: Icon(Icons.medication),
          ),
          CheckboxItem(
            label: '2x 20 cc Syringe for Propofol',
            sublabel: 'Prelabel Syringe w/ needle packaging and vial nearby',
            icon: Icon(Icons.medication),
          ),
          CheckboxItem(
            label: '1x 10 cc Syringe for Roc',
            sublabel: 'Prelabel Syringe w/ needle packaging and vial nearby',
            icon: Icon(Icons.medication),
          ),
          CheckboxItem(
            label: '1x 3 cc Syringe for Fentanyl',
            sublabel: 'Prelabel Syringe w/ needle packaging',
            icon: Icon(Icons.medication),
          ),
          CheckboxItem(
            label: '1x Lidocaine Syringe',
            icon: Icon(Icons.medication),
          ),
          CheckboxItem(
            label: '1x 10 cc Syringe for Heparin',
            sublabel: 'Prelabel Syringe w/ needle packaging',
            icon: Icon(Icons.medication),
          ),
          CheckboxItem(
            label: 'Nitroglycerin Sticks',
            sublabel: 'Grab from pharmacy prior to case start',
            icon: Icon(Icons.medication),
          ),
          CheckboxItem(
            label: 'Push Bag/Freeflow (use NS)',
            sublabel: "Attach 3x Extensions",
            icon: Icon(Icons.water_drop),
          ),
          CheckboxItem(
            label: 'TIVA Tubing',
            sublabel: "Attach 3x Pressure Tubing Extensions",
            icon: Icon(Icons.water_drop),
          ),
          CheckboxItem(
            label: 'Carrier Bag (NS)',
            sublabel: "Program at 200-300 cc/hr",
            icon: Icon(Icons.water_drop),
          ),
          CheckboxItem(
            label: 'Nicardipine Drip',
            sublabel: "Program at 5 mg/hr",
            icon: Icon(Icons.medication),
          ),
          CheckboxItem(
            label: 'Norepinephrine Drip',
            sublabel: "Program at 0.03 mcg/kg/min",
            icon: Icon(Icons.medication),
          ),
        ],
      )
    );
  }
}

class CA1Guide extends StatelessWidget {
  const CA1Guide({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CA-1 Checklists', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      drawer: const CalculatorDrawer(),
      body: ListView(
        children: const [
          PreOp(),
          StandardSetup(),
          ALine(),
          StandardStart(),
          Closing(),
          Trauma(),
          Ditzel(),
          NIR(),
        ],),
    );
  }
}