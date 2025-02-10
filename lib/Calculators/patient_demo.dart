import 'dart:math';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'Drugs/drug_data.dart';

part 'patient_demo.g.dart';

class Patient {
  // TODO: Refactor to make immutable
  
  /// Age in Years 
  double? age;

  /// Weight in kg
  double? weight;

  /// Height in cm
  double? height;

  /// Sex is M or F (would love some references on formulas for other genders)
  String? sex;

  late double? bmi;
  late double? ibw;
  late double? lbw;

  Patient([this.age,this.weight,this.height,this.sex]) {
    computeWeights();
  }
  
  void setAge(String value, String units) {
    age = switch (units) {
      'yr' => double.parse(value),
      'mo' => double.parse(value) / 12,
      'wk' => double.parse(value) / 48,
      _ => null,  
    };
    computeWeights();
  }

  void setWeight(String value, String units) {
    weight = switch (units) {
      'kg' => double.parse(value) ,
      'lbs' => double.parse(value) / 2.205,
      'g' => double.parse(value) / 1000,
      _ => null,
    };
    computeWeights();
  }

  void setHeight(String value, String units) {
    if (value == "" || units == "") {
      return;
    }
    height = switch (units) {
      'cm' => double.parse(value) ,
      'm' => double.parse(value) / 1000,
      'in' => double.parse(value) / 2.54,
      'ft' => double.parse(value) / 30.48,
      _ => null,
    };
    computeWeights();
  }

  void setSex(String value) {
    sex = value;
    computeWeights();
  }

  /// Calculates BMI, IBW, LBW
  void computeWeights() {
    // Cannot calculate IBW w/o height or sex
    if (height == null || sex == null) {
      ibw = null;
    } else {
      switch(sex) {
        case 'M':
          ibw = 50 + 2.3 * (height! / 2.54 - 60);
        case 'F':
          ibw = 45.5 + 2.3 * (height! / 2.54 - 60);
      }
    }

    // Cannot calculate BMI w/o weight or height 
    if (height == null || weight == null) {
      bmi = null;
    } else {
      bmi = weight! / pow((height!/100),2);
    }

    // Cannot calculate LBW w/o sex or BMI
    if (bmi == null || sex == null) {
      lbw = null;
    } else {
      switch(sex) {
        case 'M':
          lbw = (9270 * weight!) / (6680 + 216 * bmi!);
        case 'F':
          lbw = (9270 * weight!) / (8780 + 244 * bmi!);
      }
    }
  }

  /// Calculates whether the patient belongs to the specific population.
  /// If not, it returns -1. If it does, then it returns the number of variables
  /// in the population definition, which should correlate with specificity of the population.
  /// If age or weight is not specified, will assume defaults of 40 YO and 70 kg, respectively.
  int computePopulationScore(String population) {
    if (!drugPopulations[population].containsKey('variables')) {
      return 0;
    } else {
      Map<String,Map<String,dynamic>> allCriteria = drugPopulations[population]['variables'];
      // For each criteria check if the population violates it
      for (MapEntry criteria in allCriteria.entries) {
        switch (criteria.key) {
          case 'age':
            if (criteria.value.containsKey('min') && (age ?? 40) < convertUnits(criteria.value['min'])) {
              return -1;
            }
            if (criteria.value.containsKey('max') && (age ?? 40) > convertUnits(criteria.value['max'])) {
              return -1;
            }
          case 'weight':
            if (criteria.value.containsKey('min') && (weight ?? 70) < convertUnits(criteria.value['min'])) {
              return -1;
            }
            if (criteria.value.containsKey('max') && (weight ?? 70) > convertUnits(criteria.value['max'])) {
              return -1;
            }
        }
      }

      // If managed to satisfy all of the criteria, then just return number of criteria
      return allCriteria.length;
    }
  }

  /// Converts units into kg (for weight) or years old (for age)
  static double convertUnits(String measurement) {
    List<String> splitString = measurement.split(' ');
    double value = double.parse(splitString[0]);
    String unit = splitString[1];

    switch (unit) {
      case 'yo':
        return value;
      case 'mo':
        return value / 12;
      case 'kgwt':
        return value;
      case 'gwt':
        return value / 1000;
      default:
        throw UnimplementedError('Unit not implemented!');
    }
  }

  Patient copyWith() {
    return Patient(age, weight, height, sex);
  }
}

@Riverpod(keepAlive: true)
class PatientDemo extends _$PatientDemo{
  @override
  Patient build() {
    return Patient();
  }

  void setDemo(String value, String units, String demo) {
    switch (demo) {
      case 'Age':
        state.setAge(value,units);
      case 'Weight':
        state.setWeight(value, units);
      case 'Height':
        state.setHeight(value, units);
      case 'Sex':
        state.setSex(value);
    }
    state = state.copyWith();
  }

}