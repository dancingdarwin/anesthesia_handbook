List<Map<String,dynamic>> allDrugsPocket = [
    {
        'name': 'Fentanyl',
        'tags': 'opioid,analgesic,sedative',
        'class': 'opioid',
        'weight': 'lbw',
        'equivalent': '100 mcg IV',
        'doses': [
            {'dose': '25-100','unit': 'mcg', 'route': 'IV'},
            {'dose': '1-2','unit': 'mcg/kg/hr', 'route': 'Infusion'},
            {'dose': '50-100','unit': 'mcg', 'route': 'Epidural'},
            {'dose': '10-20','unit': 'mcg', 'route': 'Spinal'},
        ],
    },
    {
        'name': 'Hydromorphone',
        'tags': 'opioid,analgesic,sedative,dilaudid',
        'class': 'opioid',
        'weight': 'lbw',
        'equivalent': '1.5 mg IV, 7.5 mg PO',
        'doses': [
            {'dose': '0.2-1','unit': 'mg', 'route': 'IV'},
            {'dose': '0.2','unit': 'mg', 'route': 'Epidural'},
            {'dose': '0.04','unit': 'mg', 'route': 'Spinal'},
            {'dose': '2-6','unit': 'mg', 'route': 'PO'},
        ],
        'preparation': '1 cc (2 mg) vial + 9 cc NS = 0.2 mg/cc',
    },
    {
        'name': 'Morphine',
        'tags': 'opioid,analgesic,sedative',
        'class': 'opioid',
        'weight': 'lbw',
        'equivalent': '10 mg IV, 30 mg PO',
        'doses': [
            {'dose': '1-10','unit': 'mg', 'route': 'IV'},
            {'dose': '1-5','unit': 'mg', 'route': 'Epidural (Duramorph)'},
            {'dose': '0.1-0.2','unit': 'mg', 'route': 'Spinal (Duramorph)'},
            {'dose': '15-30','unit': 'mg', 'route': 'PO'},
        ],
    },
    {
        'name': 'Sufentanil',
        'tags': 'opioid,analgesic,sedative',
        'class': 'opioid',
        'weight': 'lbw',
        'doses': [
            {'dose': '0.3-1.0','unit': 'mcg/kg/hr', 'route': 'Infusion'},
        ],
        'preparation': '2 cc (100 mcg) vial + 100 cc NS Bag = 1 mcg/cc',
    },
    {
        'name': 'Remifentanil',
        'tags': 'opioid,analgesic,sedative',
        'class': 'opioid',
        'weight': 'lbw',
        'doses': [
            {'dose': '0.02-0.15','unit': 'mcg/kg/min', 'route': 'Infusion'},
            {'dose': '1-2','unit': 'mcg/kg', 'route': 'IV'},
        ],
        'preparation': '1-2 mg vial + 100 cc NS Bag = 10-20 mcg/cc',
    },
    {
        'name': 'Oxycodone',
        'tags': 'opioid,analgesic,sedative',
        'class': 'opioid',
        'equivalent': '20 mg PO',
        'doses': [
            {'dose': '5-15','unit': 'mg q4-6h', 'route': 'PO'},
        ],
    },
    
    {
        'name': 'Hydrocodone',
        'tags': 'opioid,analgesic,sedative',
        'class': 'opioid',
        'equivalent': '30 mg PO',
        'doses': [
            {'dose': '5-10','unit': 'mg q4-6h', 'route': 'PO'},
        ],
    },
    {
        'name': 'Methadone',
        'tags': 'opioid,analgesic,sedative',
        'class': 'opioid',
        'weight': 'lbw',
        'doses': [
            {'dose': '0.1-0.3','unit': 'mg/kg', 'route': 'IV (USE LBW)'},
        ],
    },
    {
        'name': 'Lidocaine',
        'tags': 'local anesthetic,antiarrhythmic',
        'class': 'local',
        'weight': 'tbw',
        'onset': '1-3 min',
        'doses': [
            {'dose': '5','unit': 'mg/kg (Max)', 'duration': '30-120 min','route': 'w/o Epi'},
            {'dose': '7','unit': 'mg/kg (Max)', 'duration': '120-180 min', 'route': 'w/ Epi'},
            {'dose': '1-2','unit': 'mg/kg', 'route': 'IV (antiarrhythmic)'},
            {'dose': '100-200','unit': 'mcg/kg/min', 'route': 'Infusion'},
        ],
    },
    {
        'name': 'Bupivacaine',
        'tags': 'local anesthetic,marcaine',
        'class': 'local',
        'weight': 'tbw',
        'onset': '5-15 min',
        'doses': [
            {'dose': '2.5','unit': 'mg/kg', 'duration': '120-180 min','route': 'w/o Epi'},
            {'dose': '3','unit': 'mg/kg', 'duration': '180-420 min', 'route': 'w/ Epi'},
        ],
    },
    {
        'name': 'Ropivacaine',
        'tags': 'local anesthetic,naropin',
        'class': 'local',
        'weight': 'tbw',
        'onset': '5-15 min',
        'doses': [
            {'dose': '3','unit': 'mg/kg', 'duration': '120-240 min','route': 'w/o Epi'},
            {'dose': '3','unit': 'mg/kg', 'duration': '180-420 min', 'route': 'w/ Epi'},
        ],
    },
    {
        'name': 'Mepivacaine',
        'tags': 'local anesthetic,carbocaine',
        'class': 'local',
        'weight': 'tbw',
        'onset': '3-20 min',
        'doses': [
            {'dose': '3','unit': 'mg/kg', 'duration': '120-240 min','route': 'w/o Epi'},
            {'dose': '3','unit': 'mg/kg', 'duration': '180-420 min', 'route': 'w/ Epi'},
        ],
    },
    {
        'name': 'Chlorprocaine',
        'tags': 'local anesthetic,nesacaine,scott mittman',
        'class': 'local',
        'weight': 'tbw',
        'onset': '6-12 min',
        'doses': [
            {'dose': '11','unit': 'mg/kg (max 800 mg)', 'duration': '120-240 min','route': 'w/o Epi'},
            {'dose': '14','unit': 'mg/kg (max 1100 mg)', 'duration': '180-420 min', 'route': 'w/ Epi'},
        ],
    },
    {
        'name': 'Rocuronium',
        'tags': 'neuromuscular blocker,paralytic,non-depolarizing',
        'class': 'paralytic',
        'weight': 'lbw',
        'doses': [
            {'dose': '0.6','unit': 'mg/kg','route': 'IV (Intubation)'},
            {'dose': '1.2','unit': 'mg/kg', 'route': 'IV (RSI)'},
            {'dose': '10-30','unit': 'mg', 'route': 'IV (Maintenance)'},
        ],
    },
    {
        'name': 'Succinylcholine',
        'tags': 'neuromuscular blocker,paralytic,depolarizing',
        'class': 'paralytic',
        'weight': 'tbw',
        'doses': [
            {'dose': '1-2','unit': 'mg/kg (TBW)','route': 'IV'},
            {'dose': '3-4','unit': 'mg/kg (max 150 mg)','route': 'IM'},
        ],
    },
    {
        'name': 'Vecuronium',
        'tags': 'neuromuscular blocker,paralytic,non-depolarizing',
        'class': 'paralytic',
        'weight': 'lbw',
        'doses': [
            {'dose': '0.1-0.2','unit': 'mg/kg','route': 'IV (Intubation)'},
            {'dose': '1-3','unit': 'mg/hr (Start @ 2, Titrate for 2 twitches)', 'route': 'Infusion'},
        ],
        'preparation': '10 mg vial + 10 cc NS (pre-filled syringe) = 0.1 mg/cc\n20 cc NS + 2x Vials for infusion',
    },
    {
        'name': 'Cisatracurium',
        'tags': 'neuromuscular blocker,paralytic,non-depolarizing',
        'class': 'paralytic',
        'weight': 'lbw',
        'doses': [
            {'dose': '0.1-0.2','unit': 'mg/kg','route': 'IV (Intubation)'},
        ],
    },
    {
        'name': 'Pancuronium',
        'tags': 'neuromuscular blocker,paralytic,non-depolarizing',
        'class': 'paralytic',
        'weight': 'lbw',
        'doses': [
            {'dose': '0.1','unit': 'mg/kg','route': 'IV (Intubation)'},
        ],
    },
    {
        'name': 'Acetaminophen',
        'tags': 'analgesic,antipyretic,tylenol',
        'class': 'nonopioid',
        'doses': [
            {'dose': '1000','unit': 'mg q8h','route': 'IV/PO'},
        ],
    },
    {
        'name': 'Ibuprofen',
        'tags': 'analgesic,antipyretic,motrin,advil',
        'class': 'nonopioid',
        'doses': [
            {'dose': '400-800','unit': 'mg q6h','route': 'PO'},
        ],
    },
    {
        'name': 'Ketorolac',
        'tags': 'analgesic,antipyretic,toradol',
        'class': 'nonopioid',
        'doses': [
            {'dose': '30','unit': 'mg','route': 'IV (<65 YO and >50 kg)'},
            {'dose': '15','unit': 'mg','route': 'IV (>65 YO or <50 kg)'},
        ],
    },
    {
        'name': 'Propofol',
        'tags': 'sedative,induction,anesthetic,diprivan',
        'class': 'sedative',
        'weight': 'lbw',
        'doses': [
            {'dose': '1-3','unit': 'mg/kg', 'route': 'IV'},
            {'dose': '100-200','unit': 'mcg/kg/min', 'route': 'Infusion (GA)'},
            {'dose': '25-75','unit': 'mcg/kg/min', 'route': 'Infusion (Sedation)'},
        ],
    },
    {
        'name': 'Ketamine',
        'tags': 'anesthetic,analgesic,sedative,induction,cardiac,special k',
        'class': 'sedative',
        'weight': 'lbw',
        'doses': [
            {'dose': '1-2','unit': 'mg/kg', 'route': 'IV (Induction)'},
            {'dose': '0.2-0.5','unit': 'mg/kg/hr', 'route': 'Infusion (Analgesia)'},
        ],
        'preparation': '2-4x 50 mg sticks + 100 cc NS bag = 1-2 mg/cc (use Drug Calc)\nMAKE SURE YOU ARE USING THE PREFILLED SYRINGES AND NOT THE VIAL',
    },
    {
        'name': 'Etomidate',
        'tags': 'anesthetic,analgesic,sedative,induction',
        'class': 'sedative',
        'doses': [
            {'dose': '0.2-0.6','unit': 'mg/kg', 'route': 'IV (Induction)'},
        ],
    },
    {
        'name': 'Midazolam',
        'tags': 'sedative,benzodiazepine,anxiolytic',
        'class': 'hypnotic',
        'doses': [
            {'dose': '0.5-2','unit': 'mg', 'route': 'IV'},
            {'dose': '0.05-0.1','unit': 'mg/kg', 'route': 'Infusion'},
        ],
    },
    {
        'name': 'Dexmedetomidine',
        'tags': 'sedative,analgesia,anxiolytic,precedex',
        'class': 'hypnotic',
        'doses': [
            {'dose': '0.5-2','unit': 'mg', 'route': 'IV'},
            {'dose': '0.05-0.1','unit': 'mg/kg', 'route': 'Infusion'},
        ],
    },
    {
        'name': 'Esmolol',
        'tags': 'beta blocker,antihypertensive',
        'class': 'BB',
        'doses': [
            {'dose': '10-30','unit': 'mg', 'route': 'IV'},
            {'dose': '50-300','unit': 'mcg/kg/min', 'route': 'Infusion'},
        ],
    },
    {
        'name': 'Metoprolol',
        'tags': 'beta blocker,antihypertensive',
        'class': 'BB',
        'doses': [
            {'dose': '1-5','unit': 'mg', 'route': 'IV'},
        ],
    },
    {
        'name': 'Labetalol',
        'tags': 'beta blocker,antihypertensive',
        'class': 'BB',
        'doses': [
            {'dose': '2.5-10','unit': 'mg', 'route': 'IV'},
        ],
    },
    {
        'name': 'Glycopyrrolate',
        'tags': 'anticholinergic,antimuscarinic',
        'class': 'anticholinergic',
        'doses': [
            {'dose': '0.2-0.4','unit': 'mg', 'route': 'IV'},
        ],
    },
    {
        'name': 'Atropine',
        'tags': 'anticholinergic,antimuscarinic',
        'class': 'anticholinergic',
        'doses': [
            {'dose': '0.5-1','unit': 'mg', 'route': 'IV'},
        ],
    },
    {
        'name': 'Tranexamic Acid (TXA)',
        'tags': 'antifibrinolytic,tranexamic acid',
        'class': 'antifibrinolytic',
        'weight': 'tbw',
        'doses': [
            {'dose': '10','unit': 'mg/kg', 'route': 'IV (Loading Bolus)'},
            {'dose': '1-3','unit': 'mg/kg/hr', 'route': 'IV (Loading Bolus)'},
        ],
        'preparation': 'Premade bag from central pyxis',
    },
    {
        'name': 'Cefazolin',
        'tags': 'abx,antibiotic,cefazolin',
        'class': 'antibiotic',
        'doses': [
            {'dose': '2','unit': 'g', 'route': 'IV (<100 kg)'},
            {'dose': '3','unit': 'g', 'route': 'IV (>100 kg)'},
        ],
        'preparation': '2-3 Vials into 10 cc NS syringe.\nRedose every 4 hrs or >1.5L EBL',
    },
    {
        'name': 'Metronidazole',
        'tags': 'abx, antibiotic, flagyl',
        'class': 'antibiotic',
        'doses': [
            {'dose': '500','unit': 'mg', 'route': 'IV'},
        ],
        'preparation': 'Premade bag from in-room pyxis. Do not redose',
    },
    {
        'name': 'Ampicillin',
        'tags': 'abx,antibiotic',
        'class': 'antibiotic',
        'doses': [
            {'dose': '1','unit': 'g', 'route': 'IV'},
        ],
        'preparation': 'Redose q2h',
    },
    {
        'name': 'Gentamicin',
        'tags': 'abx,antibiotic',
        'class': 'antibiotic',
        'doses': [
            {'dose': '5','unit': 'mg/kg', 'route': 'IV'},
        ],
        'preparation': 'Give slowly over 15 min. Do not redose',
    },
    {
        'name': 'Vancomycin',
        'tags': 'abx,antibiotic',
        'class': 'antibiotic',
        'doses': [
            {'dose': '15-20','unit': 'mg/kg', 'route': 'IV (Loading Dose)'},
            {'dose': '10-15','unit': 'mg/kg', 'route': 'IV (Maintenance Dose)'},
        ],
        'preparation': 'Desired dose into 100 cc NS bag.\nInfuse over 1 hr (Loading Dose). Do not redose',
    },
    {
        'name': 'Piperacillin/Tazobactam',
        'tags': 'abx,antibiotic,zosyn,pip-tazo',
        'class': 'antibiotic',
        'doses': [
            {'dose': '3.375','unit': 'g', 'route': 'IV'},
        ],
        'preparation': 'Order from pharmacy. Infuse over 30 min. Redose q6h',
    },
    {
        'name': 'Nitroglycerin',
        'tags': 'NTG,antihypertensive,vasodilator',
        'class': 'vasodilator',
        'doses': [
            {'dose': '50-100','unit': 'mcg', 'route': 'IV'},
            {'dose': '25-200','unit': 'mcg/min', 'route': 'Infusion'},
        ],
        'preparation': 'Pick up push sticks from ZBOR3 Pharmacy or ZBOR5 Central Pyxis',
    },
    {
        'name': 'Nitroprusside',
        'tags': 'antihypertensive,vasodilator,nipride',
        'class': 'vasodilator',
        'doses': [
            {'dose': '0.1-2','unit': 'mcg/kg/min', 'route': 'Infusion'},
        ],
    },
    {
        'name': 'Nicardipine',
        'tags': 'antihypertensive,vasodilator',
        'class': 'vasodilator',
        'doses': [
            {'dose': '0.5-2','unit': 'mg', 'route': 'IV (Push)'},
            {'dose': '1-15','unit': 'mg/hr', 'route': 'Infusion'},
        ],
        'preparation': 'Pick up bag from Central Pyxis.',
    },
    {
        'name': 'Hydralazine',
        'tags': 'antihypertensive,vasodilator',
        'class': 'vasodilator',
        'doses': [
            {'dose': '2.5-10','unit': 'mg', 'route': 'IV (Push)'},
        ],
    },
    {
        'name': 'Ephedrine',
        'tags': 'pressor',
        'class': 'vasopressor',
        'doses': [
            {'dose': '5-10','unit': 'mg', 'route': 'IV (Push)'},
        ],
    },
    {
        'name': 'Phenylephrine',
        'tags': 'pressor,neo',
        'class': 'vasopressor',
        'doses': [
            {'dose': '50-200','unit': 'mg', 'route': 'IV (Push)'},
            {'dose': '0.2-1','unit': 'mcg/kg/min', 'route': 'Infusion'},
        ],
        'preparation': '10 mg vial + 100 cc NS bag = 0.1 mg/cc',
    },
    {
        'name': 'Norepinephrine',
        'tags': 'pressor,levophed',
        'class': 'vasopressor',
        'doses': [
            {'dose': '4-8','unit': 'mcg', 'route': 'IV (Push)'},
            {'dose': '0.02-0.5','unit': 'mcg/kg/min', 'route': 'Infusion'},
        ],
        'preparation': '2.5 cc from Bag + 7.5 cc NS = 4 mcg/cc',
    },
    {
        'name': 'Vasopressin',
        'tags': 'pressor,antidiuretic,adh',
        'class': 'vasopressor',
        'doses': [
            {'dose': '0.03-0.04','unit': 'U/min', 'route': 'Infusion'},
            {'dose': '0.5-1','unit': 'U', 'route': 'IV (Push)'},
        ],
        'preparation': '1cc (20U) vial + 100 cc NS = 0.2 U/cc.\nCan also order from pharmacy',
    },
    {
        'name': 'Dopamine',
        'tags': 'pressor',
        'class': 'vasopressor',
        'doses': [
            {'dose': '0.5-20','unit': 'mcg/kg/min', 'route': 'Infusion'},
        ],
    },
    {
        'name': 'Milrinone',
        'tags': 'pressor',
        'class': 'vasopressor',
        'doses': [
            {'dose': '0.1-0.4 mcg/kg/min','unit': 'mcg/kg/min', 'route': 'Infusion'},
        ],
    },
    {
        'name': 'Sugammadex',
        'tags': 'reversal,paralytic',
        'class': 'paralyticAntagonist',
        'doses': [
            {'dose': '2','unit': 'mg/kg', 'route': 'IV (2-4 Twitches)'},
            {'dose': '4','unit': 'mg/kg', 'route': 'IV (>= 2 Post-Tetanics)'},
            {'dose': '16','unit': 'mg/kg', 'route': 'IV (0 Twitches)'},
        ],
    },
    {
        'name': 'Neostigmine',
        'tags': 'reversal,paralytic,neoglyco,glycopyrrolate',
        'class': 'paralyticAntagonist',
        'doses': [
            {'dose': '30','unit': 'mcg/kg\n(max 5 mg)', 'route': 'IV (4 Twitches)'},
            {'dose': '60','unit': 'mcg/kg\n(max 5 mg)', 'route': 'IV (2-3 Twitches)'},
        ],
        'preparation': 'Give 1 cc (0.2 mg) Glyco before giving 1 cc (1 mg) Neo at a time',
    },
    {
        'name': 'Naloxone',
        'tags': 'reversal,opioid,narcan',
        'class': 'opioidAntagonist',
        'doses': [
            {'dose': '0.04-2','unit': 'mg', 'route': 'IV'},
            {'dose': '2-4','unit': 'mg', 'route': 'IM'},
            {'dose': '4','unit': 'mg', 'route': 'Intranasal'},
        ],
        'preparation': 'Titrate IV in small increments',
    },
    {
        'name': 'Flumazenil',
        'tags': 'reversal,benzodiazepine,romazicon',
        'class': 'benzoAntagonist',
        'doses': [
            {'dose': '0.2','unit': 'mg q1min', 'route': 'IV'},
        ],
    },
    {
        'name': 'Odansetron',
        'tags': 'vomiting,ponv,nausea,zofran',
        'class': 'antiemetic',
        'doses': [
            {'dose': '4-8','unit': 'mg', 'route': 'IV'},
            {'dose': '8','unit': 'mg', 'route': 'PO'},
        ],
    },
    {
        'name': 'Dexamethasone',
        'tags': 'vomiting,ponv,nausea,decadron',
        'class': 'antiemetic',
        'doses': [
            {'dose': '4','unit': 'mg', 'route': 'IV'},
        ],
    },
    {
        'name': 'Metoclopramide',
        'tags': 'vomiting,ponv,nausea,reglan',
        'class': 'antiemetic',
        'doses': [
            {'dose': '10-20','unit': 'mg', 'route': 'IV'},
            {'dose': '10','unit': 'mg', 'route': 'PO'},
        ],
    },
    {
        'name': 'Aprepitant',
        'tags': 'vomiting,ponv,nausea,emend',
        'class': 'antiemetic',
        'doses': [
            {'dose': '40','unit': 'mg', 'route': 'PO'},
        ],
    },
    {
        'name': 'Promethazine',
        'tags': 'vomiting,ponv,nausea,phenergan',
        'class': 'antiemetic',
        'doses': [
            {'dose': '5-10','unit': 'mg', 'route': 'IV'},
            {'dose': '12.5-25','unit': 'mg', 'route': 'PO'},
        ],
        'preparation': '1 cc (25 mg) vial + 9 cc NS = 2.5 mg/cc\n Give through free-flowing IV slowly at start of case (otherwise can delay wakeup)',
    },  
];