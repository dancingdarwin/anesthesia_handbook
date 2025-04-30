import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

/// This file contains the list of emergency topics for the Emergency Manual.
/// Each topic is represented as a map with the following keys:

/// Emergency Scenarios. Name is the english name to be displayed.
/// pageTitle is the Markdown file name in assets/EmergencyText
/// Tags is a list of alternative search tags for Sherlock

const List<Map<String,dynamic>> emergencyTopics = [
  {
    'name': 'ACLS-Asystole/PEA',
    'pageTitle': 'ACLS-AsystolePEA',
    'tags': 'ACLS,Cardiac Arrest,Code Blue',
    'icon': Icons.heart_broken,
    'backgroundColor': Colors.red,
    'iconColor': Colors.white
  },
  {
    'name': 'ACLS-VFib/VTach',
    'pageTitle': 'ACLS-VFVT',
    'tags': 'ACLS Cardiac Arrest Code Blue VT VF',
    'icon': Icons.heart_broken,
    'backgroundColor': Colors.red,
    'iconColor': Colors.white
  },
  {
    'name': 'H\'s and T\'s',
    'pageTitle': 'HandTs',
    'tags': 'ACLS Cardiac Arrest Code Blue',
    'icon': Icons.heart_broken,
    'backgroundColor': Colors.red,
    'iconColor': Colors.white
  },
  {
    'name': 'ACLS-Bradycardia',
    'pageTitle': 'Brady',
    'tags': 'ACLS Arrythmia Slow heart rate',
    'icon': Icons.monitor_heart,
    'backgroundColor': Colors.red,
    'iconColor': Colors.white
  },
  {
    'name': 'ACLS-Unstable Tach',
    'pageTitle': 'UnstableTach',
    'tags': 'ACLS Arrythmia Fast heart rate hypotension low blood pressure bp tachycardia VT SVT RVR AFib',
    'icon': Icons.monitor_heart,
    'backgroundColor': Colors.red,
    'iconColor': Colors.white
  },
  {
    'name': 'ACLS-Stable Tach',
    'pageTitle': 'StableTach',
    'tags': 'ACLS Arrythmia Fast heart rate Tachycardia SVT VT AFib RVR',
    'icon': Icons.monitor_heart,
    'backgroundColor': Colors.red,
    'iconColor': Colors.white
  },
  {
    'name': 'Anyphylaxis',
    'pageTitle': 'Anaphylaxis',
    'tags': 'Allergy Allergic hypotension bronchospasm rash epi epipen',
    'icon': FontAwesomeIcons.handDots,
    'backgroundColor': Colors.grey,
    'iconColor': Colors.white
  },
  {
    'name': 'Bronchospasm',
    'pageTitle': 'Bronchospasm',
    'tags': 'Allergy Allergic Anaphylaxis epi epipen COPD Asthma',
    'icon': FontAwesomeIcons.lungs,
    'backgroundColor': Colors.blue,
    'iconColor': Colors.white
  },
  {
    'name': 'Delayed Emergence',
    'pageTitle': 'Delayed',
    'tags': 'Slow Wakeup Opioid OD narcan Naloxone flumazenil benzo',
    'icon': Icons.snooze,
    'backgroundColor': Colors.grey,
    'iconColor': Colors.white
  },
  {
    'name': 'Difficult Airway',
    'pageTitle': 'Airway',
    'tags': 'Glidescope Fiberoptic Ventilate Bag Cric',
    'icon': FontAwesomeIcons.maskVentilator,
    'backgroundColor': Colors.blue,
    'iconColor': Colors.white
  },
  {
    'name': 'Embolism',
    'pageTitle': 'PE',
    'tags': 'Pulmonary Embolism PE VAE venous air embolism cement hypoxia hypoxemia',
    'icon': FontAwesomeIcons.lungs,
    'backgroundColor': Colors.blue,
    'iconColor': Colors.white
  },
  {
    'name': 'Fire - Airway',
    'pageTitle': 'AirwayFire',
    'tags': 'red',
    'icon': FontAwesomeIcons.fire,
    'backgroundColor': Colors.grey,
    'iconColor': Colors.white
  },
  {
    'name': 'Fire - Nonairway',
    'pageTitle': 'Fire',
    'tags': 'red',
    'icon': Icons.fire_extinguisher,
    'backgroundColor': Colors.grey,
    'iconColor': Colors.white
  },
  {
    'name': 'Hemorrhage',
    'pageTitle': 'Hemorrhage',
    'tags': 'MTP red transfusion massive blood bleed bleeding Steve Frank',
    'icon': FontAwesomeIcons.droplet,
    'backgroundColor': Colors.red,
    'iconColor': Colors.white
  },
  {
    'name': 'High Airway Pressure',
    'pageTitle': 'AirwayPressure',
    'tags': 'PIP Peak Airway bronchospasm anaphylaxis hypoxia hypoxemia PAP',
    'icon': FontAwesomeIcons.lungs,
    'backgroundColor': Colors.blue,
    'iconColor': Colors.white
  },
  {
    'name': 'High Spinal',
    'pageTitle': 'HighSpinal',
    'tags': 'Lidocaine local anesthetic epidural neuraxial',
    'icon': FontAwesomeIcons.syringe,
    'backgroundColor': Colors.grey,
    'iconColor': Colors.white
  },
  {
    'name': 'Hypertension',
    'pageTitle': 'HTN',
    'tags': 'malignant high blood pressure',
    'icon': FontAwesomeIcons.weightScale,
    'backgroundColor': Colors.red,
    'iconColor': Colors.white
  },
  {
    'name': 'Hypotension',
    'pageTitle': 'HOTN',
    'tags': 'pressor low blood pressure neo phenylephrine levophed norepinephrine anaphylaxis',
    'icon': FontAwesomeIcons.weightScale,
    'backgroundColor': Colors.red,
    'iconColor': Colors.white
  },
  {
    'name': 'Hypoxemia (Start here)',
    'pageTitle': 'Hypoxemia',
    'tags': 'Hypoxia low oxygen o2 sat spo2',
    'icon': FontAwesomeIcons.maskVentilator,
    'backgroundColor': Colors.blue,
    'iconColor': Colors.white
  },
  {
    'name': 'Hypoxemia DDx',
    'pageTitle': 'HypoxiaDDx',
    'tags': 'Hypoxia low oxygen o2 sat spo2',
    'icon': FontAwesomeIcons.maskVentilator,
    'backgroundColor': Colors.blue,
    'iconColor': Colors.white
  },
  {
    'name': 'LAST',
    'pageTitle': 'LAST',
    'tags': 'Lidocaine Local anesthetic systemic toxicity anaesthetic Marcaine Xylocaine',
    'icon': FontAwesomeIcons.syringe,
    'backgroundColor': Colors.grey,
    'iconColor': Colors.white
  },
  {
    'name': 'Malignant Hyperthermia',
    'pageTitle': 'MH',
    'tags': 'High Temperature Dantrolene David Dave Berman fever nms seratonin syndrome',
    'icon': FontAwesomeIcons.temperatureHigh,
    'backgroundColor': Colors.grey,
    'iconColor': Colors.white
  },
  {
    'name': 'Myocardial Ischemia',
    'pageTitle': 'MI',
    'tags': 'heart attack NSTEMI STEMI MI ST segment infarction',
    'icon': FontAwesomeIcons.heartCircleExclamation,
    'backgroundColor': Colors.red,
    'iconColor': Colors.white
  },
  {
    'name': 'Oxygen Failure',
    'pageTitle': 'O2Failure',
    'tags': 'Hypoxemia Ventilator Machine No Gas Wall Failure Hypoxia o2',
    'icon': FontAwesomeIcons.maskVentilator,
    'backgroundColor': Colors.blue,
    'iconColor': Colors.white
  },
  {
    'name': 'Pneumothorax',
    'pageTitle': 'PTX',
    'tags': 'Tension Needle Thoracotomy Thoracostomy Chest tube pig tail',
    'icon': FontAwesomeIcons.lungs,
    'backgroundColor': Colors.blue,
    'iconColor': Colors.white
  },
  {
    'name': 'Power Failure',
    'pageTitle': 'PowerFailure',
    'tags': 'Outage Electricity Electric Light',
    'icon': Icons.electric_bolt,
    'backgroundColor': Colors.yellow,
    'iconColor': Colors.black
  },
  {
    'name': 'Right Heart Failure',
    'pageTitle': 'RightHeartFailure',
    'tags': 'CHF hfref hypotension edema pulmonary hypertension phtn',
    'icon': FontAwesomeIcons.heartCircleXmark,
    'backgroundColor': Colors.red,
    'iconColor': Colors.white
  },
  {
    'name': 'Transfusion Reaction',
    'pageTitle': 'TransfusionRxn',
    'tags': 'Blood bleed prbc ffp platelet allergy allergic anaphylaxis fever Steve Frank',
    'icon': Icons.bloodtype,
    'backgroundColor': Colors.red,
    'iconColor': Colors.white
  },
  {
    'name': 'Trauma',
    'pageTitle': 'Trauma',
    'tags': 'gunshot penetrating blunt shot high energy Rob Sikorski Peter Lax',
    'icon': FontAwesomeIcons.bone,
    'backgroundColor': Colors.grey,
    'iconColor': Colors.white
  },]
;