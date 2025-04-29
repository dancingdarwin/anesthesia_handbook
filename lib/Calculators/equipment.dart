import 'package:anesthesia_handbook/Calculators/patient_demo.dart';
import 'package:anesthesia_handbook/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AirwayEquipment extends ConsumerWidget {
  const AirwayEquipment({super.key});

  double calculateETTSize(double age) {
    // Returns calculated cuffed ETT size based on aptient age
    double size = (2 * (age / 4 + 3.5)).round().toDouble();
    size /= 2;
    size = size > 7.0 ? 7.0 : size;

    return size;
  }

  Map<String,String> getAirwayEquipmentSize(Patient patient) {
    final Map<String,String> equipmentSize = {};

    equipmentSize['ETT'] = switch (patient.age ?? -1) {
      < 0 => 'Needs Age',
      > 0 && < 1.0/12 => switch(patient.weight ?? -1) {
        < 0 => 'Needs Weight',
        >= 0 && < 1 => '2.5',
        >= 1 && < 2 => '2.5-3.0',
        >= 2 && < 3 => '3.0',
        >= 3 => '3.0-3.5',
        _ => 'N/A',
      },
      > 1.0/12 && < 0.5 => '3.0-3.5',
      < 1 && >= 0.5 => '3.5',
      >= 1 && < 14 => calculateETTSize(patient.age!).toString(),
      >= 14 => '7.0',
      _ => 'N/A'
    };

    equipmentSize['ETT_Depth'] = switch (patient.age ?? -1) {
      < 0 => 'Needs Age',
      > 0 && < 1.0/12 => switch(patient.weight ?? -1) {
        < 0 => 'Needs Weight',
        >= 0 && < 1 => '7 cm',
        >= 1 && < 2 => '8 cm',
        >= 2 && < 3 => '9 cm',
        >= 3 => '10 cm',
        _ => 'N/A',
      },
      >= 1.0/12 && < 0.5 => '12 cm',
      >= 0.5 && < 1 => '13 cm',
      >= 1 => '${calculateETTSize(patient.age ?? -1) * 3} cm',
      _ => 'N/A',
    };

    equipmentSize['DLBlade'] = switch(patient.age ?? -1) {
      <= 0 => 'Needs Age',
      > 0 && < 1.0/12 => switch(patient.weight ?? -1) {
        < 0 => 'Needs Weight',
        >= 0 && < 1 => 'Miller 00-0',
        >= 1 && < 2 => 'Miller 0',
        >= 2 => 'Miller 0-1',
        _ => 'N/A',
      },
      >= 1.0/12 && < 1 => 'Mil 1/Wis 1',
      >= 1.0 && < 2 => 'Mil 1/Wis 1.5',
      >= 2 && <8 => 'Mil 2/Mac 2',
      > 9 => 'Mac 3/Mil 2',
      _ => 'N/A'
    };

    equipmentSize['LMA'] = switch (patient.weight ?? -1) {
      < 0 => 'Needs Weight',
      >= 0 && < 5 => '1',
      >= 5 && < 10 => '1.5',
      >= 10 && < 20 => '2',
      >= 20 && < 30 => '2.5',
      >= 30 && < 50 => '3',
      >= 50 && < 70 => '4',
      >= 70 => '5',
      _ => 'N/A',
    };

    equipmentSize['FaceMask'] = switch (patient.age ?? -1) {
      < 0 => 'Needs Age',
      > 0 && < 1.0/12 => '1',
      > 1.0/12 && < 1 => '2',
      >=1 && < 6 => '3',
      >= 6 && < 13 => '4',
      >= 13 => '5+',
      _ => 'N/A'
    };

    equipmentSize['OralAirway'] = switch (patient.age ?? -1) {
      < 0 => 'Needs Age',
      >= 0 && < 0.5 => '40 mm (Pink)',
      >= 0.5 && < 1 => '50 mm (Blue)',
      >= 1 && < 4 => '60 mm (Black)',
      >= 5 && < 7 => '50-60 mm (Black/White)',
      >= 7 && < 9 => '70-80 mm (White/Green)',
      >= 9 && < 12 => '80 mm (Green)',
      >= 12 => '80-100 mm (Green/Yellow/Red)',
      _ => 'N/A',
    };

    equipmentSize['NGT'] = switch ( patient.age ?? -1) {
      < 0 => 'Needs Age',
      >= 0 && < 1 => '8 Fr',
      >= 1 && < 2 => '10 Fr',
      >= 2 && < 4 => '10-12 Fr',
      >= 4 && < 10 => '12-14 Fr',
      >= 10 => '14-18 Fr',
      _ => 'N/A',
    };

    equipmentSize['ChestTube'] = switch ( patient.age ?? -1) {
      < 0 => 'Needs Age',
      >= 0 && < 1/12 => '10-12 Fr',
      >= 1/12 && < 0.5 => '12-18 Fr',
      >= 0.5 && < 2 => '16-20 Fr',
      >= 2 && < 3 => '16-24 Fr',
      >= 4 && < 6 => '20-28 Fr',
      >= 6 && < 10 => '20-32 Fr',
      >= 10 && < 15 => '28-38 Fr',
      >= 15 => '28-42 Fr',
      _ => 'N/A',
    };

    return equipmentSize;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Patient patientState = ref.watch(patientDemoProvider);
    final Map<String,String> equipmentSize = getAirwayEquipmentSize(patientState);

    return CollapsibleCard(
      controller: ExpansionTileController(),
      color: Colors.blue,
      heading: 'Airway Equipment',
      initiallyExpanded: false,
      child: DataTable(
        rows: [
          DataRow(cells: [const DataCell(Text('ETT Size (Cuffed)')), DataCell(Text(equipmentSize['ETT'] ?? 'N/A'))]),
          DataRow(cells: [const DataCell(Text('ETT Depth (Lips)')), DataCell(Text(equipmentSize['ETT_Depth'] ?? 'N/A'))]),
          DataRow(cells: [const DataCell(Text('DL Blade')), DataCell(Text(equipmentSize['DLBlade'] ?? 'N/A'))]),
          DataRow(cells: [const DataCell(Text('Face Mask')), DataCell(Text(equipmentSize['FaceMask'] ?? 'N/A'))]),
          DataRow(cells: [const DataCell(Text('LMA')), DataCell(Text(equipmentSize['LMA'] ?? 'N/A'))]),
          DataRow(cells: [const DataCell(Text('NG Tube')), DataCell(Text(equipmentSize['NGT'] ?? 'N/A'))]),
          DataRow(cells: [const DataCell(Text('Chest Tube')), DataCell(Text(equipmentSize['ChestTube'] ?? 'N/A'))]),
        ],
        columns: const [
          DataColumn(label: Expanded(child: Text('Equipment', style: TextStyle(fontStyle: FontStyle.italic)))),
          DataColumn(label: Expanded(child: Text('Size', style: TextStyle(fontStyle: FontStyle.italic)))),
        ],
      )
    );
  }
}

class VascularEquipment extends ConsumerWidget {
  const VascularEquipment({super.key});

  double calculateCentralLineDepth(double height) {
    // Returns calculated central line depth based on height
    return height > 100 ? (height/10 - 2) : (height/10 -1);
  }

  Map<String,String> getVascularEquipmentSize(Patient patient) {
    final Map<String,String> equipmentSize = {};

    equipmentSize['A-Line'] = switch (patient.weight ?? -1) {
      < 0 => 'Needs Weight',
      >= 0 && < 10 => '24G or 2.5 Fr, 2.5 cm',
      >= 10 && < 40 => '22G or 2.5 Fr, 2.5-5 cm',
      >= 40 => '22G or 20 G',
      _ => 'N/A'
    };

    equipmentSize['CVC'] = switch (patient.weight ?? -1) {
      < 0 => 'Needs Weight',
      >= 0 && < 10 => '24G or 2.5 Fr, 2.5 cm',
      >= 10 && < 40 => '22G or 2.5 Fr, 2.5-5 cm',
      >= 40 => '22G or 20 G',
      _ => 'N/A'
    };

    if (patient.height != null) {
      equipmentSize['CVCDepth'] = '${calculateCentralLineDepth(patient.height!)} cm';
    } else  {
      equipmentSize['CVCDepth'] = 'Needs Height';
    }

    return equipmentSize;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Patient patientState = ref.watch(patientDemoProvider);
    final Map<String,String> equipmentSize = getVascularEquipmentSize(patientState);

    return CollapsibleCard(
      controller: ExpansionTileController(),
      color: Colors.red,
      heading: 'Vascular Access',
      initiallyExpanded: false,
      child: DataTable(
        rows: [
          DataRow(cells: [const DataCell(Text('Art Line')), DataCell(Text(equipmentSize['A-Line'] ?? 'N/A'))]),
          DataRow(cells: [const DataCell(Text('Central Line')), DataCell(Text(equipmentSize['CVC'] ?? 'N/A'))]),
          DataRow(cells: [const DataCell(Text('Central Line Depth')), DataCell(Text(equipmentSize['CVCDepth'] ?? 'N/A'))]),
        ],
        columns: const [
          DataColumn(label: Expanded(child: Text('Equipment', style: TextStyle(fontStyle: FontStyle.italic)))),
          DataColumn(label: Expanded(child: Text('Size', style: TextStyle(fontStyle: FontStyle.italic)))),
        ],
      )
    );
  }
}