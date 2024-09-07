/**
 * @author Chris Rishel
 */
( function() {
    /**
     * DrugColor data
     */
    mw.calculators.addDrugColors( {
        anticholinergic: {
            primaryColor: '#9fc96b'
        },
        benzodiazepine: {
            primaryColor: '#f57921'
        },
        benzodiazepineReversal: {
            parentColor: 'benzodiazepine',
            striped: true
        },
        cardiovascularAgonist: {
            primaryColor: '#e1c9df'
        },
        cardiovascularAntagonist: {
            parentColor: 'cardiovascularAgonist',
            striped: true
        },
        default: {
            primaryColor: '#fff',
            highlightColor: '#fff'
        },
        desflurane: {
            primaryColor: '#0072ae'
        },
        enflurane: {
            primaryColor: '#f9a23b'
        },
        epinephrine: {
            parentColor: 'cardiovascularAgonist',
            highlightColor: '#000'
        },
        halothane: {
            primaryColor: '#b20107'
        },
        isoflurane: {
            primaryColor: '#92278f'
        },
        localAnesthetic: {
            primaryColor: '#b6b2a9'
        },
        localAnestheticAntagonist: {
            parentColor: 'localAnesthetic',
            striped: true
        },
        neuromuscularBlocker: {
            primaryColor: '#f15563'
        },
        neuromuscularBlockerReversal: {
            parentColor: 'neuromuscularBlocker',
            striped: true
        },
        nitrousOxide: {
            primaryColor: '#004f7c'
        },
        opioid: {
            primaryColor: '#6bc8ea'
        },
        opioidReversal: {
            parentColor: 'opioid',
            striped: true
        },
        sedativeHypnotic: {
            primaryColor: '#f7e20a'
        },
        sevoflurane: {
            primaryColor: '#ffe715'
        },
        succinylcholine: {
            parentColor: 'neuromuscularBlocker',
            highlightColor: '#000'
        }
    } );
    


    /**
     * DrugPopulation data
     */
    mw.calculators.addDrugPopulations( {
        general: {
            name: 'General'
        },
        generalLt70kg: {
            name: 'General (<70 kg)'
        },
        generalGe70kg: {
            name: 'General (>=70 kg)',
            variables: {
                weight: {
                    min: '70 kgwt'
                }
            }
        },
        adult: {
            name: 'Adult'
        },
        adultLt120kg: {
            name: 'Adult (<120 kg)'
        },
        adultGe120kg: {
            name: 'Adult (>=120 kg)',
            variables: {
                weight: {
                    min: '120 kgwt'
                }
            }
        },
        geriatric: {
            name: 'Geriatric',
            variables: {
                age: {
                    min: '65 yo'
                }
            }
        },
        neonatal: {
            name: 'Neonatal',
            variables: {
                age: {
                    max: '0 yo'
                }
            }
        },
        neonatalGe1200g: {
            name: 'Neonatal (>=1200 g)',
            variables: {
                age: {
                    max: '0 yo'
                }
            }
        },
        neonatalLt1200g: {
            name: 'Neonatal (<1200 g)',
            variables: {
                age: {
                    max: '0 yo'
                },
                weight: {
                    max: '1199 gwt'
                }
            }
        },
        pediatric: {
            name: 'Pediatric',
            variables: {
                age: {
                    max: '17.9 yo'
                }
            }
        },
        pediatric2mo9mo: {
            name: 'Pediatric (2-9 mo)',
            abbreviation: 'Peds (2-9 mo)',
            variables: {
                age: {
                    max: '9 mo'
                }
            }
        },
        pediatricGt9moLe40kg: {
            name: 'Pediatric (>9 mo,<=40 kg)',
            abbreviation: 'Peds (>9 mo,<=40 kg)',
            variables: {
                age: {
                    min: '9.1 mo'
                },
                weight: {
                    max: '40 kgwt'
                }
            }
        },
        pediatricGt40kg: {
            name: 'Pediatric (>=40 kg)',
            abbreviation: 'Peds (>=40 kg)',
            variables: {
                age: {
                    max: '17.9 yo'
                }
            }
        },
        pediatricLt120kg: {
            name: 'Pediatric (<120 kg)',
            abbreviation: 'Peds (<120 kg)',
            variables: {
                age: {
                    max: '17.9 yo'
                }
            }
        },
        pediatricGe120kg: {
            name: 'Pediatric (>=120 kg)',
            abbreviation: 'Peds (>=120 kg)',
            variables: {
                age: {
                    max: '17.9 yo'
                },
                weight: {
                    min: '120 kgwt'
                }
            }
        },
        pediatricLt2yo: {
            name: 'Pediatric (<2 yo)',
            abbreviation: 'Peds (<2 yo)',
            variables: {
                age: {
                    max: '1.9 yo'
                }
            }
        },
        pediatricGe2yo: {
            name: 'Pediatric (>=2 yo)',
            abbreviation: 'Peds (>=2 yo)',
            variables: {
                age: {
                    min: '2 yo'
                }
            }
        }
    } );



    /**
     * DrugRoute data
     */
    mw.calculators.addDrugRoutes( {
        ett: {
            name: 'Endotracheal',
            abbreviation: 'ETT'
        },
        iv: {
            name: 'Intravenous',
            abbreviation: 'IV',
            default: true
        },
        im: {
            name: 'Intramuscular',
            abbreviation: 'IM'
        },
        in: {
            name: 'Intranasal',
            abbreviation: 'IN'
        },
        io: {
            name: 'Intraosseous',
            abbreviation: 'IO'
        },
        po: {
            name: 'Oral',
            abbreviation: 'PO'
        },
        pr: {
            name: 'Rectal',
            abbreviation: 'PR'
        },
        sl: {
            name: 'Sublingual',
            abbreviation: 'SL'
        },
        sq: {
            name: 'Subcutaneous',
            abbreviation: 'SQ'
        },
        td: {
            name: 'Transdermal',
            abbreviation: 'TD'
        },
    } );



    /**
     * DrugIndication data
     */
    mw.calculators.addDrugIndications( {
        acidemia: {
            name: 'Acidemia'
        },
        acls: {
            name: 'ACLS',
            abbreviation: 'ACLS'
        },
        acs: {
            name: 'Acute coronary syndrome',
            abbreviation: 'ACS'
        },
        afib: {
            name: 'Atrial fibrillation',
            abbreviation: 'AFib'
        },
        analgesia: {
            name: 'Analgesia',
            abbreviation: 'Analgesia'
        },
        anaphylaxis: {
            name: 'Anaphylaxis',
            abbreviation: 'Anaphylaxis'
        },
        angina: {
            name: 'Angina'
        },
        antimicrobialPpx: {
            name: 'Antimicrobial prophylaxis',
            abbreviation: 'Abx'
        },
        anxiolysis: {
            name: 'Anxiolysis',
            abbreviation: 'Anxiety'
        },
        aspirationPpx: {
            name: 'Aspiration prophylaxis',
            abbreviation: 'Aspiration ppx'
        },
        asystoleInduction: {
            name: 'Induction of asystole',
            abbreviation: 'Asystole'
        },
        benzodiazepineReversal: {
            name: 'Benzodiazepine reversal',
            abbreviation: 'Benzo reversal'
        },
        bradycardia: {
            name: 'Bradycardia',
            abbreviation: 'Bradycardia'
        },
        delayedEmergence: {
            name: 'Delayed emergence'
        },
        eclampsiaPreeclampsia: {
            name: '(Pre)eclampsia',
        },
        ect: {
            name: 'Electroconvulsive therapy',
            abbreviation: 'ECT'
        },
        generalAnesthesia: {
            name: 'General anesthesia',
            abbreviation: 'GA'
        },
        hpaAxisSuppression: {
            name: 'HPA axis suppression'
        },
        hypertension: {
            name: 'Hypertension',
            abbreviation: 'Hypertension'
        },
        hypotension: {
            name: 'Hypotension',
            abbreviation: 'Hypoten.',
            searchData: 'shock'
        },
        hypocalcemia: {
            name: 'Hypocalcemia',
            abbreviation: 'Hypo Ca<sup>2+</sup>'
        },
        hypomagnesemia: {
            name: 'Hypomagnesemia',
            abbreviation: 'Hypo Mg<sup>2+</sup>'
        },
        icpReduction: {
            name: 'Reduction of intracranial pressure',
            abbreviation: 'Reduce ICP'
        },
        intubation: {
            name: 'Intubation',
            abbreviation: 'Intubation'
        },
        last: {
            name: 'Local anesthetic systemic toxicity',
            abbreviation: 'LAST'
        },
        malignantHyperthermia: {
            name: 'Malignant hyperthermia',
            abbreviation: 'MH'
        },
        neuromuscularBlockade: {
            name: 'Neuromuscular blockade',
            abbreviation: 'NMB'
        },
        neuromuscularBlockadeReversal: {
            name: 'Neuromuscular blockade reversal',
            abbreviation: 'NMB reversal'
        },
        opioidOverdose: {
            name: 'Opioid overdose'
        },
        postpartumHemorrhage: {
            name: 'Postpartum hemorrhage',
            abbreviation: 'PPH',
            searchData: 'uterotonic'
        },
        mac: {
            name: 'Monitored anesthesia care',
            abbreviation: 'MAC'
        },
        ponv: {
            name: 'Postoperative nausea & vomiting',
            abbreviation: 'PONV'
        },
        shivering: {
            name: 'Shivering'
        },
        sialorrhea: {
            name: 'Sialorrhea'
        },
        svt: {
            name: 'Supraventricular tachycardia',
            abbreviation: 'SVT'
        },
        tachyhypertension: {
            name: 'Tachycardia / hypertension',
            abbreviation: 'Tachyhypertension',
            searchData: 'tachycardia svt'
        },
        tiva: {
            name: 'Total intravenous anesthesia',
            abbreviation: 'TIVA'
        },
        tocolysis: {
            name: 'Tocolysis'
        }
    } );



    /**
     * Drug data
     */



    /**
     * Acetaminophen
     */
    mw.calculators.addDrugs( [
        {
            id: 'acetaminophen',
            name: 'Acetaminophen',
            tradeNames: [
                'Tylenol',
                'Ofirmev'
            ],
            searchData: 'paracetamol',
            dosages: [
                {
                    indication: 'analgesia',
                    population: 'adult',
                    description: 'Max 4 g/day. Use caution in hepatic impairment.',
                    dose: {
                        dose: '1 g'
                    }
                }, {
                    indication: 'analgesia',
                    population: 'adult',
                    routes: [ 'po', 'pr' ],
                    description: 'Max 4 g/day. Use caution in hepatic impairment.',
                    dose: {
                        min: '650 mg',
                        max: '1 g'
                    }
                }, {
                    indication: 'analgesia',
                    population: 'pediatric',
                    description: 'Max 75 mg/kg/day or 4 g/day (whichever is less). Use caution in hepatic impairment.',
                    dose: {
                        dose: '15 mg/kg',
                        absoluteMax: '1 g'
                    }
                }, {
                    indication: 'analgesia',
                    population: 'pediatric',
                    routes: [ 'po' ],
                    description: 'Max 75 mg/kg/day or 4 g/day (whichever is less). Use caution in hepatic impairment.',
                    dose: {
                        dose: '15 mg/kg',
                        absoluteMax: '1 g'
                    }
                }, {
                    indication: 'analgesia',
                    population: 'pediatric',
                    routes: [ 'pr' ],
                    description: 'Max 100 mg/kg/day or 4 g/day (whichever is less). Use caution in hepatic impairment.',
                    references: [
                        'Patrick K. Birmingham, AF1-0567, Michael J. Tobin, Dennis M. Fisher, Thomas K. Henthorn, Steven C. Hall, Charles J. Coté; Initial and Subsequent Dosing of Rectal Acetaminophen in Children: A 24-Hour Pharmacokinetic Study of New Dose Recommendations. Anesthesiology 2001; 94:385–389 doi: https://doi.org/10.1097/00000542-200103000-00005'
                    ],
                    dose: [
                        {
                            name: 'Load',
                            dose: '40 mg/kg',
                            absoluteMax: '1 g'
                        }, {
                            name: 'Maintenance',
                            dose: '20 mg/kg',
                            absoluteMax: '1 g',
                            frequency: 'q6h'
                        }
                    ]
                }
            ],
            preparations: [
                {
                    concentration: '10 mg/mL'
                }, {
                    concentration: '650 mg/pill'
                }, {
                    concentration: '1000 mg/pill'
                }
            ]
        }
    ] );



    /**
     * Adenosine
     */
    mw.calculators.addDrugs( [
        {
            id: 'adenosine',
            name: 'Adenosine',
            color: 'cardiovascularAntagonist',
            description: 'Administer as a rapid push via central line or most proximal peripheral IV available',
            dosages: [
                {
                    indication: 'asystoleInduction',
                    population: 'general',
                    references: [
                        'Desai VR, Rosas AL, Britz GW. Adenosine to facilitate the clipping of cerebral aneurysms: literature review. Stroke Vasc Neurol. 2017 Jun 23;2(4):204-209. doi: 10.1136/svn-2017-000082. PMID: 29507781; PMCID: PMC5829927.'
                    ],
                    dose: [
                        {
                            name: 'Initial dose:',
                            min: '0.3 mg/kg',
                            max: '0.4 mg/kg',
                            frequency: 'rapid push'
                        }, {
                            name: 'If inadequate effect, double dose q30s-1m, up to:',
                            dose: '2 mg/kg'
                        }
                    ]
                }, {
                    indication: 'svt',
                    population: 'adult',
                    dose: [
                        {
                            name: 'Initially administer:',
                            dose: '6 mg',
                            frequency: 'rapid push'
                        }, {
                            name: 'If inadequate effect:',
                            dose: '12 mg',
                            frequency: 'q1m x2'
                        }
                    ]
                }, {
                    indication: 'svt',
                    population: 'pediatric',
                    dose: [
                        {
                            name: 'Initially administer:',
                            dose: '0.1 mg/kg',
                            absoluteMax: '6 mg',
                            frequency: 'rapid push'
                        }, {
                            name: 'If inadequate effect:',
                            dose: '0.2 mg/kg',
                            absoluteMax: '12 mg',
                            frequency: 'q1m x2'
                        }
                    ]
                }
            ],
            preparations: [
                {
                    concentration: '3 mg/mL'
                }
            ]
        }
    ] );



    /**
     * Alfentanil
     */
    mw.calculators.addDrugs([
        {
            id: 'alfentanil',
            name: 'Alfentanil',
            tradeNames: [
                'Alfenta'
            ],
            color: 'opioid',
            dosages: [
                {
                    indication: 'mac',
                    population: 'general',
                    references: [

                    ],
                    dose: [
                        {
                            name: 'Load',
                            min: '8 mcg/kg',
                            max: '20 mcg/kg'
                        }, {
                            name: 'Maintenance',
                            min: '0.5 mcg/kg/min',
                            max: '3 mcg/kg/min'
                        }
                    ]
                }
            ],
            preparations: [
                {
                    concentration: '500 mcg/mL'
                }
            ]
        }
    ] );



    /**
     * Amiodarone
     */
    mw.calculators.addDrugs( [
        {
            id: 'amiodarone',
            name: 'Amiodarone',
            tradeNames: [
                'Cordarone',
                'Nexterone',
                'Pacerone'
            ],
            color: 'cardiovascularAntagonist',
            description: 'For treatment of unstable atrial fibrillation with or without rapid ventricular response (RVR)',
            dosages: [
                {
                    indication: 'afib',
                    population: 'general',
                    description: 'Repeated boluses may be given over 10 to 30 minutes, max of 6-8 boluses in 24 hour period. Boluses given more rapidly than 10 minutes increase risk of hypotension.',
                    dose: [
                        {
                            name: 'Load',
                            dose: '150 mg',
                            duration: '10 min'
                        }, {
                            name: 'Maintenance',
                            dose: '1 mg/min',
                            duration: '6 hours'
                        }
                    ]
                }
            ],
            preparations: [
                {
                    concentration: '1.5 mg/mL'
                }, {
                    concentration: '50 mg/mL',
                    default: true,
                    dilutionRequired: true
                }
            ]
        }
    ] );



    /**
     * Aprepitant
     */
    mw.calculators.addDrugs( [
        {
            id: 'aprepitant',
            name: 'Aprepitant',
            tradeNames: [
                'Emend'
            ],
            references: [
                'Singh PM, Borle A, Rewari V, Makkar JK, Trikha A, Sinha AC, Goudra B. Aprepitant for postoperative nausea and vomiting: a systematic review and meta-analysis. Postgrad Med J. 2016 Feb;92(1084):87-98. doi: 10.1136/postgradmedj-2015-133515. Epub 2015 Dec 1. PMID: 26627976.'
            ],
            dosages: [
                {
                    indication: 'ponv',
                    population: 'general',
                    routes: 'po',
                    dose: {
                        dose: '40 mg'
                    }
                }
            ],
            preparations: [
                {
                    concentration: '40 mg/pill'
                }
            ]
        }
    ] );



    /**
     * Atracurium
     */
    mw.calculators.addDrugs( [
        {
            id: 'atracurium',
            name: 'Atracurium',
            color: 'neuromuscularBlocker',
            references: [
                'Ingrande J, Lemmens HJ. Dose adjustment of anaesthetics in the morbidly obese. Br J Anaesth. 2010 Dec;105 Suppl 1:i16-23. doi: 10.1093/bja/aeq312. PMID: 21148651.',
            ],
            dosages: [
                {
                    indication: 'neuromuscularBlockade',
                    population: 'general',
                    dose: [
                        {
                            name: 'Load',
                            min: '0.4 mg/kg',
                            max: '0.5 mg/kg',
                            weightCalculation: [ 'ibw', 'lbw' ]
                        }, {
                            name: 'Maintenance',
                            min: '5 mcg/kg/min',
                            max: '10 mcg/kg/min',
                            weightCalculation: [ 'ibw', 'lbw' ]
                        }
                    ]
                }
            ],
            preparations: [
                {
                    concentration: '10 mg/mL'
                }
            ]
        }
    ] );



    /**
     * Atropine
     */
    mw.calculators.addDrugs( [
        {
            id: 'atropine',
            name: 'Atropine',
            color: 'anticholinergic',
            description: 'Low doses may cause paradoxical bradycardia',
            dosages: [
                {
                    indication: 'bradycardia',
                    population: 'adult',
                    description: 'Repeat as needed to a maximum total dose of 3 mg',
                    dose: {
                        min: '0.5 mg',
                        max: '1 mg',
                        frequency: 'q3-5m'
                    }
                }, {
                    indication: 'bradycardia',
                    population: 'pediatric',
                    description: 'Repeat as needed to a maximum total dose of 1 mg',
                    dose: {
                        min: '10 mcg/kg',
                        max: '20 mcg/kg',
                        absoluteMin: '40 mcg',
                        frequency: 'q3-5m'
                    }
                }, {
                    indication: 'acls',
                    population: 'adult',
                    description: 'Repeat as needed to a maximum total dose of 3 mg',
                    dose: {
                        dose: '1 mg',
                        frequency: 'q3-5m'
                    }
                }, {
                    indication: 'acls',
                    population: 'pediatric',
                    description: 'Repeat as needed to a maximum total dose of 1 mg',
                    dose: {
                        dose: '20 mcg/kg',
                        absoluteMin: '100 mcg',
                        absoluteMax: '500 mcg',
                        frequency: 'q3-5m'
                    }
                }
            ],
            preparations: [
                {
                    concentration: '0.1 mg/mL'
                }, {
                    concentration: '0.4 mg/mL',
                    default:true
                }
            ]
        }
    ] );



    /**
     * Aztreonam
     */
    mw.calculators.addDrugs( [
        {
            id: 'aztreonam',
            name: 'Aztreonam',
            tradeNames: [
                'Azactam',
                'Cayston'
            ],
            references: [
                'Bratzler DW, Dellinger EP, Olsen KM, Perl TM, Auwaerter PG, Bolon MK, Fish DN, Napolitano LM, Sawyer RG, Slain D, Steinberg JP, Weinstein RA; American Society of Health-System Pharmacists; Infectious Disease Society of America; Surgical Infection Society; Society for Healthcare Epidemiology of America. Clinical practice guidelines for antimicrobial prophylaxis in surgery. Am J Health Syst Pharm. 2013 Feb 1;70(3):195-283. doi: 10.2146/ajhp120568. PMID: 23327981.'
            ],
            dosages: [
                {
                    indication: 'antimicrobialPpx',
                    population: 'adult',
                    dose: {
                        dose: '2 g',
                        frequency: 'q4h'
                    }
                }, {
                    indication: 'antimicrobialPpx',
                    population: 'pediatric',
                    dose: {
                        dose: '30 mg/kg',
                        absoluteMax: '2 g',
                        frequency: 'q4h'
                    }
                }
            ],
            preparations: [
                {
                    concentration: '1 g/vial'
                }, {
                    concentration: '2 g/vial'
                }
            ]
        }
    ] );



    /**
     * Bupivacaine
     */
    mw.calculators.addDrugs([
        {
            id: 'bupivacaine',
            name: 'Bupivacaine',
            tradeNames: [
                'Marcaine'
            ],
            color: 'localAnesthetic'
        }
    ] );



    /**
     * Calcium chloride
     */
    mw.calculators.addDrugs( [
        {
            id: 'calciumChloride',
            name: 'Calcium chloride',
            description: '<ul><li>Administer via central line</li><li>A 10 mL ampule of calcium chloride 100 mg/mL contains 272 mg of elemental calcium</li></ul>',
            references: [
                'French S, Subauste J, Geraci S. Calcium abnormalities in hospitalized patients. South Med J. 2012 Apr;105(4):231-7. doi: 10.1097/SMJ.0b013e31824e1737. PMID: 22475676.'
            ],
            dosages: [
                {
                    indication: 'hypocalcemia',
                    population: 'adult',
                    dose: {
                        min: '500 mg',
                        max: '1 g',
                        duration: '5-10 min'
                    }
                }, {
                    indication: 'hypocalcemia',
                    population: 'pediatric',
                    dose: {
                        min: '10 mg/kg',
                        max: '20 mg/kg',
                        absoluteMax: '1 g',
                        duration: '5-10 min'
                    }
                }
            ],
            preparations: [
                {
                    concentration: '100 mg/mL'
                }
            ]
        }
    ] );



    /**
     * Calcium gluconate
     */
    mw.calculators.addDrugs( [
        {
            id: 'calciumGluconate',
            name: 'Calcium gluconate',
            description: '<ul><li>Can administer peripherally</li><li>A 10 mL ampule of calcium gluconate 100 mg/mL contains 93 mg of elemental calcium</li></ul>',
            references: [
                'French S, Subauste J, Geraci S. Calcium abnormalities in hospitalized patients. South Med J. 2012 Apr;105(4):231-7. doi: 10.1097/SMJ.0b013e31824e1737. PMID: 22475676.'
            ],
            dosages: [
                {
                    indication: 'hypocalcemia',
                    population: 'adult',
                    dose: {
                        min: '1 g',
                        max: '2 g',
                        duration: '5-10 min'
                    }
                }, {
                    indication: 'hypocalcemia',
                    population: 'pediatric',
                    dose: {
                        dose: '30 mg/kg',
                        absoluteMax: '2 g',
                        duration: '5-10 min'
                    }
                }
            ],
            preparations: [
                {
                    concentration: '100 mg/mL'
                }
            ]
        }
    ] );



    /**
     * Carboprost
     */
    mw.calculators.addDrugs([
        {
            id: 'carboprost',
            name: 'Carboprost',
            tradeNames: [
                'Hemabate'
            ],
            description: '<ul><li>Relatively contraindicated in asthma</li></ul>',
            dosages: [
                {
                    indication: 'postpartumHemorrhage',
                    population: 'general',
                    routes: 'im',
                    dose: {
                        dose: '0.25 mg',
                        frequency: 'q15-90m, max 2 mg/day'
                    }
                }
            ],
            preparations: [
                {
                    concentration: '0.25 mg/mL'
                }
            ]
        }
    ] );



    /**
     * Cefazolin
     */
    mw.calculators.addDrugs( [
        {
            id: 'cefazolin',
            name: 'Cefazolin',
            tradeNames: [
                'Ancef',
                'Kefzol'
            ],
            references: [
                'Bratzler DW, Dellinger EP, Olsen KM, Perl TM, Auwaerter PG, Bolon MK, Fish DN, Napolitano LM, Sawyer RG, Slain D, Steinberg JP, Weinstein RA; American Society of Health-System Pharmacists; Infectious Disease Society of America; Surgical Infection Society; Society for Healthcare Epidemiology of America. Clinical practice guidelines for antimicrobial prophylaxis in surgery. Am J Health Syst Pharm. 2013 Feb 1;70(3):195-283. doi: 10.2146/ajhp120568. PMID: 23327981.'
            ],
            dosages: [
                {
                    indication: 'antimicrobialPpx',
                    population: 'adultLt120kg',
                    dose: {
                        dose: '2 g',
                        frequency: 'q4h'
                    }
                }, {
                    indication: 'antimicrobialPpx',
                    population: 'adultGe120kg',
                    dose: {
                        dose: '3 g',
                        frequency: 'q4h'
                    }
                }, {
                    indication: 'antimicrobialPpx',
                    population: 'pediatricLt120kg',
                    dose: {
                        dose: '30 mg/kg',
                        absoluteMax: '2 g',
                        frequency: 'q4h'
                    }
                }, {
                    indication: 'antimicrobialPpx',
                    population: 'pediatricGe120kg',
                    dose: {
                        dose: '30 mg/kg',
                        absoluteMax: '3 g',
                        frequency: 'q4h'
                    }
                }
            ],
            preparations: [
                {
                    concentration: '1 g/vial'
                }
            ]
        }
    ] );



    /**
     * Cefotaxime
     */
    mw.calculators.addDrugs( [
        {
            id: 'cefotaxime',
            name: 'Cefotaxime',
            tradeNames: [
                'Claforan'
            ],
            references: [
                'Bratzler DW, Dellinger EP, Olsen KM, Perl TM, Auwaerter PG, Bolon MK, Fish DN, Napolitano LM, Sawyer RG, Slain D, Steinberg JP, Weinstein RA; American Society of Health-System Pharmacists; Infectious Disease Society of America; Surgical Infection Society; Society for Healthcare Epidemiology of America. Clinical practice guidelines for antimicrobial prophylaxis in surgery. Am J Health Syst Pharm. 2013 Feb 1;70(3):195-283. doi: 10.2146/ajhp120568. PMID: 23327981.'
            ],
            dosages: [
                {
                    indication: 'antimicrobialPpx',
                    population: 'adultLt120kg',
                    dose: {
                        dose: '1 g',
                        frequency: 'q3h'
                    }
                }, {
                    indication: 'antimicrobialPpx',
                    population: 'adultGe120kg',
                    description: 'Many experts recommend 2 g for obese patients (FDA-approved insert indicates 1 g)<sup>1</sup>',
                    dose: {
                        dose: '2 g',
                        frequency: 'q3h'
                    }
                }, {
                    indication: 'antimicrobialPpx',
                    population: 'pediatricLt120kg',
                    dose: {
                        dose: '50 mg/kg',
                        absoluteMax: '1 g',
                        frequency: 'q3h'
                    }
                }, {
                    indication: 'antimicrobialPpx',
                    population: 'pediatricGe120kg',
                    description: 'Many experts recommend up to 2 g for obese patients (FDA-approved insert indicates 1 g)<sup>1</sup>',
                    dose: {
                        dose: '50 mg/kg',
                        absoluteMax: '2 g',
                        frequency: 'q3h'
                    }
                }
            ],
            preparations: [
                {
                    concentration: '750 mg/vial'
                }, {
                    concentration: '1.5 g/vial'
                }
            ]
        }
    ] );



    /**
     * Cefoxitin
     */
    mw.calculators.addDrugs( [
        {
            id: 'cefoxitin',
            name: 'Cefoxitin',
            tradeNames: [
                'Mefoxin',
                'Renoxitin'
            ],
            references: [
                'Bratzler DW, Dellinger EP, Olsen KM, Perl TM, Auwaerter PG, Bolon MK, Fish DN, Napolitano LM, Sawyer RG, Slain D, Steinberg JP, Weinstein RA; American Society of Health-System Pharmacists; Infectious Disease Society of America; Surgical Infection Society; Society for Healthcare Epidemiology of America. Clinical practice guidelines for antimicrobial prophylaxis in surgery. Am J Health Syst Pharm. 2013 Feb 1;70(3):195-283. doi: 10.2146/ajhp120568. PMID: 23327981.'
            ],
            dosages: [
                {
                    indication: 'antimicrobialPpx',
                    population: 'adult',
                    dose: {
                        dose: '2 g',
                        frequency: 'q2h'
                    }
                }, {
                    indication: 'antimicrobialPpx',
                    population: 'pediatric',
                    dose: {
                        dose: '40 mg/kg',
                        absoluteMax: '2 g',
                        frequency: 'q2h'
                    }
                }
            ],
            preparations: [
                {
                    concentration: '1 g/vial'
                }, {
                    concentration: '2 g/vial'
                }
            ]
        }
    ] );



    /**
     * Cefotetan
     */
    mw.calculators.addDrugs( [
        {
            id: 'cefotetan',
            name: 'Cefotetan',
            tradeNames: [
                'Cefotan'
            ],
            references: [
                'Bratzler DW, Dellinger EP, Olsen KM, Perl TM, Auwaerter PG, Bolon MK, Fish DN, Napolitano LM, Sawyer RG, Slain D, Steinberg JP, Weinstein RA; American Society of Health-System Pharmacists; Infectious Disease Society of America; Surgical Infection Society; Society for Healthcare Epidemiology of America. Clinical practice guidelines for antimicrobial prophylaxis in surgery. Am J Health Syst Pharm. 2013 Feb 1;70(3):195-283. doi: 10.2146/ajhp120568. PMID: 23327981.'
            ],
            dosages: [
                {
                    indication: 'antimicrobialPpx',
                    population: 'adult',
                    dose: {
                        dose: '2 g',
                        frequency: 'q6h'
                    }
                }, {
                    indication: 'antimicrobialPpx',
                    population: 'pediatric',
                    dose: {
                        dose: '40 mg/kg',
                        absoluteMax: '2 g',
                        frequency: 'q6h'
                    }
                }
            ],
            preparations: [
                {
                    concentration: '1 g/vial'
                }, {
                    concentration: '2 g/vial'
                }
            ]
        }
    ] );



    /**
     * Ceftriaxone
     */
    mw.calculators.addDrugs( [
        {
            id: 'ceftriaxone',
            name: 'Ceftriaxone',
            tradeNames: [
                'Rocephin',
                'Epicephin',
                'Wintriaxone'
            ],
            references: [
                'Bratzler DW, Dellinger EP, Olsen KM, Perl TM, Auwaerter PG, Bolon MK, Fish DN, Napolitano LM, Sawyer RG, Slain D, Steinberg JP, Weinstein RA; American Society of Health-System Pharmacists; Infectious Disease Society of America; Surgical Infection Society; Society for Healthcare Epidemiology of America. Clinical practice guidelines for antimicrobial prophylaxis in surgery. Am J Health Syst Pharm. 2013 Feb 1;70(3):195-283. doi: 10.2146/ajhp120568. PMID: 23327981.'
            ],
            dosages: [
                {
                    indication: 'antimicrobialPpx',
                    population: 'adult',
                    dose: {
                        dose: '2 g',
                        frequency: '(no redose)'
                    }
                }, {
                    indication: 'antimicrobialPpx',
                    population: 'pediatric',
                    dose: {
                        dose: '40 mg/kg',
                        absoluteMax: '2 g',
                        frequency: '(no redose)'
                    }
                }
            ],
            preparations: [
                {
                    concentration: '1 g/vial'
                }, {
                    concentration: '2 g/vial'
                }
            ]
        }
    ] );



    /**
     * Cefuroxime
     */
    mw.calculators.addDrugs( [
        {
            id: 'cefuroxime',
            name: 'Cefuroxime',
            tradeNames: [
                'Zinacef',
                'Ceftin'
            ],
            references: [
                'Bratzler DW, Dellinger EP, Olsen KM, Perl TM, Auwaerter PG, Bolon MK, Fish DN, Napolitano LM, Sawyer RG, Slain D, Steinberg JP, Weinstein RA; American Society of Health-System Pharmacists; Infectious Disease Society of America; Surgical Infection Society; Society for Healthcare Epidemiology of America. Clinical practice guidelines for antimicrobial prophylaxis in surgery. Am J Health Syst Pharm. 2013 Feb 1;70(3):195-283. doi: 10.2146/ajhp120568. PMID: 23327981.'
            ],
            dosages: [
                {
                    indication: 'antimicrobialPpx',
                    population: 'adult',
                    dose: {
                        dose: '1.5 g',
                        frequency: 'q4h'
                    }
                }, {
                    indication: 'antimicrobialPpx',
                    population: 'pediatric',
                    dose: {
                        dose: '50 mg/kg',
                        absoluteMax: '1.5 g',
                        frequency: 'q4h'
                    }
                }
            ],
            preparations: [
                {
                    concentration: '750 mg/vial'
                }, {
                    concentration: '1.5 g/vial'
                }
            ]
        }
    ] );



    /**
     * Ciprofloxacin
     */
    mw.calculators.addDrugs( [
        {
            id: 'ciprofloxacin',
            name: 'Ciprofloxacin',
            tradeNames: [
                'Ciloxan',
                'Cipro',
                'Neofloxin'
            ],
            references: [
                'Bratzler DW, Dellinger EP, Olsen KM, Perl TM, Auwaerter PG, Bolon MK, Fish DN, Napolitano LM, Sawyer RG, Slain D, Steinberg JP, Weinstein RA; American Society of Health-System Pharmacists; Infectious Disease Society of America; Surgical Infection Society; Society for Healthcare Epidemiology of America. Clinical practice guidelines for antimicrobial prophylaxis in surgery. Am J Health Syst Pharm. 2013 Feb 1;70(3):195-283. doi: 10.2146/ajhp120568. PMID: 23327981.'
            ],
            dosages: [
                {
                    indication: 'antimicrobialPpx',
                    population: 'adult',
                    dose: {
                        dose: '400 mg',
                        frequency: '(no redose)'
                    }
                }, {
                    indication: 'antimicrobialPpx',
                    population: 'pediatric',
                    dose: {
                        dose: '10 mg/kg',
                        absoluteMax: '400 mg',
                        frequency: '(no redose)'
                    }
                }
            ],
            preparations: [
                {
                    concentration: '10 mg/mL'
                }
            ]
        }
    ] );



    /**
     * Cisatracurium
     */
    mw.calculators.addDrugs( [
        {
            id: 'cisatracurium',
            name: 'Cisatracurium',
            color: 'neuromuscularBlocker',
            references: [
                'Ingrande J, Lemmens HJ. Dose adjustment of anaesthetics in the morbidly obese. Br J Anaesth. 2010 Dec;105 Suppl 1:i16-23. doi: 10.1093/bja/aeq312. PMID: 21148651.',
            ],
            dosages: [
                {
                    indication: 'neuromuscularBlockade',
                    population: 'adult',
                    dose: [
                        {
                            name: 'Load',
                            min: '0.15 mg/kg',
                            max: '0.2 mg/kg',
                            weightCalculation: [ 'ibw', 'lbw' ]
                        }, {
                            name: 'Maintenance (bolus)',
                            dose: '0.03 mg/kg',
                            weightCalculation: [ 'ibw', 'lbw' ]
                        }, {
                            name: 'Maintenance (infusion)',
                            min: '1 mcg/kg/min',
                            max: '2 mcg/kg/min',
                            weightCalculation: [ 'ibw', 'lbw' ]
                        }
                    ]
                }, {
                    indication: 'neuromuscularBlockade',
                    population: 'pediatric',
                    dose: [
                        {
                            name: 'Load',
                            min: '0.1 mg/kg',
                            max: '0.15 mg/kg',
                            weightCalculation: [ 'ibw', 'lbw' ]
                        }, {
                            name: 'Maintenance',
                            min: '1 mcg/kg/min',
                            max: '2 mcg/kg/min',
                            weightCalculation: [ 'ibw', 'lbw' ]
                        }
                    ]
                }
            ],
            preparations: [
                {
                    concentration: '2 mg/mL'
                }, {
                    concentration: '20 mg/mL'
                }
            ]
        }
    ] );



    /**
     * Clevidipine
     */
    mw.calculators.addDrugs([
        {
            id: 'clevidipine',
            name: 'Clevidipine',
            tradeNames: [
                'Cleviprex'
            ],
            color: 'cardiovascularAntagonist',
            dosages: [
                {
                    indication: 'hypertension',
                    population: 'adult',
                    description: '<ul><li>Double dose every 90 seconds initially</li><li>When near goal<ul><li>Increase dose by less than double</li><li>Lengthen titration interval to 5-10 min</li></ul></li></ul>',
                    references: [
                        'Clevipine drug label. Accessible at: https://www.accessdata.fda.gov/drugsatfda_docs/label/2011/022156s003lbl.pdf',
                        'Cheung, AT, Avery, IV EG. Clevidipine Bolus Administration in the Treatment of Hypertensive Patients Undergoing Cardiac Surgery (SPRINT). Identifier NCT00799604.  https://clinicaltrials.gov/ct2/show/NCT00799604'
                    ],
                    dose: [
                        {
                            name: 'Bolus',
                            min: '125 mcg',
                            max: '500 mcg'
                        }, {
                            name: 'Maintenance',
                            min: '1 mg/hr',
                            max: '2 mg/hr',
                            absoluteMax: '32 mg/hr'
                        }
                    ]
                }, {
                    indication: 'hypertension',
                    population: 'pediatric',
                    references: [
                        'Tobias JD, Tulman DB, Bergese SD. Clevidipine for perioperative blood pressure control in infants and children. Pharmaceuticals (Basel). 2013 Jan 15;6(1):70-84. doi: 10.3390/ph6010070. PMID: 24275788; PMCID: PMC3816677.'
                    ],
                    dose: [
                        {
                            name: 'Bolus',
                            min: '10 mcg/kg',
                            max: '20 mcg/kg'
                        }, {
                            name: 'Maintenance',
                            min: '0.5 mcg/kg/min',
                            max: '5 mcg/kg/min'
                        }
                    ]
                }
            ],
            preparations: [
                {
                    concentration: '0.5 mg/mL'
                }
            ]
        }
    ] );



    /**
     * Clindamycin
     */
    mw.calculators.addDrugs( [
        {
            id: 'clindamycin',
            name: 'Clindamycin',
            tradeNames: [
                'Cleocin',
                'Clindacin'
            ],
            references: [
                'Bratzler DW, Dellinger EP, Olsen KM, Perl TM, Auwaerter PG, Bolon MK, Fish DN, Napolitano LM, Sawyer RG, Slain D, Steinberg JP, Weinstein RA; American Society of Health-System Pharmacists; Infectious Disease Society of America; Surgical Infection Society; Society for Healthcare Epidemiology of America. Clinical practice guidelines for antimicrobial prophylaxis in surgery. Am J Health Syst Pharm. 2013 Feb 1;70(3):195-283. doi: 10.2146/ajhp120568. PMID: 23327981.'
            ],
            dosages: [
                {
                    indication: 'antimicrobialPpx',
                    population: 'adult',
                    dose: {
                        dose: '900 mg',
                        frequency: 'q6h'
                    }
                }, {
                    indication: 'antimicrobialPpx',
                    population: 'pediatric',
                    dose: {
                        dose: '10 mg/kg',
                        absoluteMax: '900 mg',
                        frequency: 'q6h'
                    }
                }
            ],
            preparations: [
                {
                    concentration: '150 mg/mL'
                }
            ]
        }
    ] );



    /**
     * Dantrolene
     */
    mw.calculators.addDrugs( [
        {
            id: 'dantrolene',
            name: 'Dantrolene',
            dosages: [
                {
                    indication: 'malignantHyperthermia',
                    population: 'general',
                    dose: {
                        dose: '2.5 mg/kg'
                    },
                    description: 'Repeat up to a cumulative dose of 10 mg/kg'
                }
            ],
            preparations: [
                {
                    concentration: '250 mg/vial'
                }, {
                    concentration: '20 mg/vial'
                }
            ]
        }
    ] );



    /**
     * Dexmedetomidine
     */
    mw.calculators.addDrugs( [
        {
            id: 'dexmedetomidine',
            name: 'Dexmedetomidine',
            tradeNames: [
                'Dexdor',
                'Precedex'
            ],
            color: 'sedativeHypnotic',
            dosages: [
                {
                    indication: 'mac',
                    population: 'general',
                    dose: [
                        {
                            name: 'Load',
                            dose: '1 mcg/kg',
                            duration: '10 min'
                        }, {
                            name: 'Maintenance',
                            min: '0.2 mcg/kg/hr',
                            max: '1 mcg/kg/hr'
                        }
                    ]
                }
            ],
            preparations: [
                {
                    concentration: '4 mcg/mL'
                }, {
                    concentration: '100 mcg/mL',
                    dilutionRequired: true
                }
            ]
        }
    ] );



    /**
     * Dexamethasone
     */
    mw.calculators.addDrugs( [
        {
            id: 'dexamethasone',
            name: 'Dexamethasone',
            tradeNames: [
                'Decadron'
            ],
            dosages: [
                {
                    indication: 'ponv',
                    population: 'adult',
                    dose: {
                        min: '4 mg',
                        max: '8 mg'
                    }
                }, {
                    indication: 'ponv',
                    population: 'pediatric',
                    dose: {
                        dose: '0.1 mg/kg',
                        absoluteMax: '10 mg'
                    }
                }
            ],
            preparations: [
                {
                    concentration: '2 mg/mL'
                }
            ]
        }
    ] );



    /**
     * Diazepam
     */
    mw.calculators.addDrugs( [
        {
            id: 'diazepam',
            name: 'Diazepam',
            tradeNames: [
                'Valium'
            ],
            color: 'benzodiazepine'
        }
    ] );



    /**
     * Diphenhydramine
     */
    mw.calculators.addDrugs( [
        {
            id: 'diphenhydramine',
            name: 'Diphenhydramine',
            tradeNames: [
                'Benadryl'
            ],
            dosages: [
                {
                    indication: 'anaphylaxis',
                    population: 'adult',
                    routes: [ 'iv', 'im' ],
                    description: '<ul><li>Max 400 mg/day</li><li>Rapid IV administration may cause hypotension</li></ul>',
                    references: [
                        'Ellis BC, Brown SG. Parenteral antihistamines cause hypotension in anaphylaxis. Emerg Med Australas. 2013 Feb;25(1):92-3. doi: 10.1111/1742-6723.12028. PMID: 23379461.'
                    ],
                    dose: {
                        min: '25 mg',
                        max: '50 mg',
                        duration: '5 min',
                        frequency: 'q4-6h'
                    }
                }, {
                    indication: 'anaphylaxis',
                    population: 'pediatric',
                    routes: [ 'iv', 'im' ],
                    description: '<ul><li>Max 5 mg/kg or 200 mg per day</li><li>Rapid IV administration may cause hypotension</li></ul>',
                    references: [
                        'Hegenbarth MA; American Academy of Pediatrics Committee on Drugs. Preparing for pediatric emergencies: drugs to consider. Pediatrics. 2008 Feb;121(2):433-43. doi: 10.1542/peds.2007-3284. PMID: 18245435.'
                    ],
                    dose: {
                        min: '1 mg/kg',
                        max: '2 mg/kg',
                        absoluteMax: '50 mg',
                        duration: '5 min',
                        frequency: 'q4-6h'
                    }
                }
            ],
            preparations: [
                {
                    concentration: '50 mg/mL'
                }
            ]
        }
    ] );



    /**
     * Dobutamine
     */
    mw.calculators.addDrugs( [
        {
            id: 'dobutamine',
            name: 'Dobutamine',
            color: 'cardiovascularAgonist',
            description: 'First line vasopressor for cardiogenic shock with low cardiac output and maintained blood pressure',
            dosages: [
                {
                    indication: 'hypotension',
                    population: 'general',
                    references: [
                        'Hollenberg SM. Vasoactive drugs in circulatory shock. Am J Respir Crit Care Med. 2011 Apr 1;183(7):847-55. doi: 10.1164/rccm.201006-0972CI. Epub 2010 Nov 19. PMID: 21097695.'
                    ],
                    dose: {
                        min: '0.5 mcg/kg/min',
                        max: '20 mcg/kg/min'
                    }
                }
            ],
            preparations: [
                {
                    concentration: '0.5 mg/mL'
                }, {
                    concentration: '12.5 mg/mL'
                }
            ]
        }
    ] );



    /**
     * Dopamine
     */
    mw.calculators.addDrugs( [
        {
            id: 'dopamine',
            name: 'Dopamine',
            color: 'cardiovascularAgonist',
            description: '<ul><li>Predominant receptor activation is dose-dependent:<ul><li><5 mcg/kg/min: Dopaminergic</li><li>5-10 mcg/kg/min: &beta;-1 adrenergic</li><li>>10 mcg/kg/min: &alpha;-1 adrenergic</li></ul></li><li>Low-dose dopamine should not be used for renal protective effect</li></ul>',
            dosages: [
                {
                    indication: 'hypotension',
                    population: 'adult',
                    references: [
                        'Hollenberg SM. Vasoactive drugs in circulatory shock. Am J Respir Crit Care Med. 2011 Apr 1;183(7):847-55. doi: 10.1164/rccm.201006-0972CI. Epub 2010 Nov 19. PMID: 21097695.',
                        'Bellomo R, Chapman M, Finfer S, Hickling K, Myburgh J. Low-dose dopamine in patients with early renal dysfunction: a placebo-controlled randomised trial. Australian and New Zealand Intensive Care Society (ANZICS) Clinical Trials Group. Lancet. 2000 Dec 23-30;356(9248):2139-43. doi: 10.1016/s0140-6736(00)03495-4. PMID: 11191541.'
                    ],
                    dose: {
                        min: '2 mcg/kg/min',
                        max: '50 mcg/kg/min'
                    }
                }, {
                    indication: 'hypotension',
                    population: 'pediatric',
                    dose: {
                        min: '5 mcg/kg/min',
                        max: '20 mcg/kg/min'
                    }
                }
            ],
            preparations: [
                {
                    concentration: '1.6 mg/mL'
                }, {
                    concentration: '40 mg/mL'
                }
            ]
        }
    ] );



    /**
     * Ephedrine
     */
     mw.calculators.addDrugs( [
        {
            id: 'ephedrine',
            name: 'Ephedrine',
            color: 'cardiovascularAgonist',
            dosages: [
                {
                    indication: 'hypotension',
                    population: 'adult',
                    dose: {
                        min: '2.5 mg',
                        max: '25 mg'
                    }
                }, {
                    indication: 'hypotension',
                    population: 'adult',
                    routes: [ 'im' ],
                    dose: {
                        min: '25 mg',
                        max: '50 mg'
                    }
                }, {
                    indication: 'hypotension',
                    population: 'pediatric',
                    dose: {
                        min: '0.02 mg/kg',
                        max: '0.2 mg/kg'
                    }
                }
            ],
            preparations: [
                {
                    concentration: '5 mg/mL'
                }, {
                    concentration: '50 mg/mL'
                }
            ]
        }
    ] );



    /**
     * Epinephrine
     */
    mw.calculators.addDrugs( [
        {
            id: 'epinephrine',
            name: 'Epinephrine',
            color: 'epinephrine',
            dosages: [
                {
                    indication: 'hypotension',
                    population: 'adult',
                    description: 'First line vasopressor for anaphylactic shock',
                    references: [
                        'Hollenberg SM. Vasoactive drugs in circulatory shock. Am J Respir Crit Care Med. 2011 Apr 1;183(7):847-55. doi: 10.1164/rccm.201006-0972CI. Epub 2010 Nov 19. PMID: 21097695.'
                    ],
                    dose: [
                        {
                            name: 'Bolus',
                            min: '5 mcg',
                            max: '20 mcg',
                            frequency: 'q1-5m'
                        }, {
                            name: 'Infusion',
                            min: '0.01 mcg/kg/min',
                            max: '2 mcg/kg/min'
                        }
                    ]
                }, {
                    indication: 'hypotension',
                    population: 'pediatric',
                    description: 'First line vasopressor for anaphylactic shock',
                    references: [
                        'Marino BS, Tabbutt S, MacLaren G, Hazinski MF, Adatia I, Atkins DL, Checchia PA, DeCaen A, Fink EL, Hoffman GM, Jefferies JL, Kleinman M, Krawczeski CD, Licht DJ, Macrae D, Ravishankar C, Samson RA, Thiagarajan RR, Toms R, Tweddell J, Laussen PC; American Heart Association Congenital Cardiac Defects Committee of the Council on Cardiovascular Disease in the Young; Council on Clinical Cardiology; Council on Cardiovascular and Stroke Nursing; Council on Cardiovascular Surgery and Anesthesia; and Emergency Cardiovascular Care Committee. Cardiopulmonary Resuscitation in Infants and Children With Cardiac Disease: A Scientific Statement From the American Heart Association. Circulation. 2018 May 29;137(22):e691-e782. doi: 10.1161/CIR.0000000000000524. Epub 2018 Apr 23. PMID: 29685887.',
                        'Reiter PD, Roth J, Wathen B, LaVelle J, Ridall LA. Low-Dose Epinephrine Boluses for Acute Hypotension in the PICU. Pediatr Crit Care Med. 2018 Apr;19(4):281-286. doi: 10.1097/PCC.0000000000001448. PMID: 29319635.'
                    ],
                    dose: [
                        {
                            name: 'Bolus',
                            min: '1 mcg/kg',
                            max: '5 mcg/kg',
                            frequency: 'q1-5m'
                        }, {
                            name: 'Infusion',
                            min: '0.02 mcg/kg/min',
                            max: '1 mcg/kg/min'
                        }
                    ]
                }, {
                    indication: 'acls',
                    population: 'general',
                    routes: [ 'iv', 'io' ],
                    dose: {
                        dose: '1 mg',
                        frequency: 'q3-5m'
                    }
                }, {
                    indication: 'acls',
                    population: 'adult',
                    routes: [ 'ett' ],
                    description: 'Dilute in 10 mL before administering',
                    dose: {
                        min: '2 mg',
                        max: '2.5 mg',
                        frequency: 'q3-5m'
                    }
                }, {
                    indication: 'acls',
                    population: 'pediatric',
                    routes: [ 'iv', 'io' ],
                    dose: {
                        dose: '10 mcg/kg',
                        absoluteMax: '1 mg',
                        frequency: 'q3-5m'
                    }
                }, {
                    indication: 'anaphylaxis',
                    population: 'general',
                    dose: [
                        {
                            name: 'Bolus',
                            dose: '10 mcg/kg',
                            absoluteMax: '0.5 mg',
                            frequency: 'q3-5m'
                        }, {
                            name: 'Infusion',
                            min: '0.1 mcg/kg/min',
                            max: '1 mcg/kg/min'
                        }
                    ]
                }, {
                    indication: 'anaphylaxis',
                    population: 'general',
                    routes: [ 'im' ],
                    dose: {
                        dose: '10 mcg/kg',
                        frequency: 'q5-15m',
                        absoluteMax: '0.5 mg'
                    }
                }, {
                    indication: 'last',
                    population: 'general',
                    dose: {
                        dose: '1 mcg/kg',
                        frequency: 'q3-5m'
                    }
                }
            ],
            preparations: [
                {
                    concentration: '10 mcg/mL'
                }, {
                    concentration: '16 mcg/mL'
                }, {
                    concentration: '100 mcg/mL',
                    default: true
                }, {
                    concentration: '1 mg/mL'
                }
            ]
        }
    ] );



    /**
     * Eptifibatide
     */
    mw.calculators.addDrugs( [
        {
            id: 'eptifibatide',
            name: 'Eptifibatide',
            tradeNames: [
                'Integralin'
            ],
            references: [],
            dosages: [
                {
                    indication: 'acs',
                    population: 'general',
                    description: 'Infusion should be continued until discharge or up to 18-24 hr after procedure (whichever comes first), providing up to 96 hr of therapy.',
                    dose: [
                        {
                            name: 'Load',
                            dose: '180 mcg/kg'
                        }, {
                            name: 'Maintenance',
                            dose: '2 mcg/kg'
                        }
                    ]
                }
            ],
            preparations: [
                {
                    concentration: '0.75 mg/mL'
                },
                {
                    concentration: '2 mg/mL',
                    default: true
                }
            ]
        }
    ] );



    /**
     * Ertapenem
     */
    mw.calculators.addDrugs( [
        {
            id: 'ertapenem',
            name: 'Ertapenem',
            tradeNames: [
                'Invanz'
            ],
            references: [
                'Bratzler DW, Dellinger EP, Olsen KM, Perl TM, Auwaerter PG, Bolon MK, Fish DN, Napolitano LM, Sawyer RG, Slain D, Steinberg JP, Weinstein RA; American Society of Health-System Pharmacists; Infectious Disease Society of America; Surgical Infection Society; Society for Healthcare Epidemiology of America. Clinical practice guidelines for antimicrobial prophylaxis in surgery. Am J Health Syst Pharm. 2013 Feb 1;70(3):195-283. doi: 10.2146/ajhp120568. PMID: 23327981.'
            ],
            dosages: [
                {
                    indication: 'antimicrobialPpx',
                    population: 'adult',
                    dose: {
                        dose: '1 g',
                        frequency: '(no redose)'
                    }
                }, {
                    indication: 'antimicrobialPpx',
                    population: 'pediatric',
                    dose: {
                        dose: '15 mg/kg',
                        absoluteMax: '1 g',
                        frequency: '(no redose)'
                    }
                }
            ],
            preparations: [
                {
                    concentration: '1 g/vial'
                }
            ]
        }
    ] );



    /**
     * Esmolol
     */
    mw.calculators.addDrugs([
        {
            id: 'esmolol',
            name: 'Esmolol',
            tradeNames: [
                'Brevibloc'
            ],
            color: 'cardiovascularAntagonist',
            references: [
                'Pevtsov A, Kerndt CC, Fredlund KL. Esmolol. [Updated 2021 Aug 2]. In: StatPearls [Internet]. Treasure Island (FL): StatPearls Publishing; 2021 Jan-. Available from: https://www.ncbi.nlm.nih.gov/books/NBK518965/'
            ],
            dosages: [
                {
                    indication: 'tachyhypertension',
                    population: 'general',
                    description: 'Titrate infusion by 50 mcg/kg/min q4m until desired effect achieved.',
                    dose: [
                        {
                            name: 'Load',
                            min: '0.5 mg/kg',
                            max: '1 mg/kg'
                        },
                        {
                            name: 'Maintenance',
                            min: '50 mcg/kg/min',
                            max: '300 mcg/kg/min'
                        }
                    ]
                }, {
                    indication: 'intubation',
                    population: 'general',
                    dose: {
                        min: '1 mg/kg',
                        max: '2 mg/kg',
                        frequency: '1.5-3 min before intubation'
                    }
                }, {
                    indication: 'ect',
                    population: 'general',
                    dose: {
                        dose: '1 mg/kg',
                        frequency: '1 min before induction'
                    }
                }
            ],
            preparations: [
                {
                    concentration: '10 mg/mL'
                }
            ]
        }
    ] );



    /**
     * Etomidate
     */
    mw.calculators.addDrugs( [
        {
            id: 'etomidate',
            name: 'Etomidate',
            tradeNames: [
                'Amidate'
            ],
            color: 'sedativeHypnotic',
            references: [
                'Ingrande J, Lemmens HJ. Dose adjustment of anaesthetics in the morbidly obese. Br J Anaesth. 2010 Dec;105 Suppl 1:i16-23. doi: 10.1093/bja/aeq312. PMID: 21148651.',
            ],
            dosages: [
                {
                    indication: 'generalAnesthesia',
                    population: 'general',
                    dose: {
                        min: '0.2 mg/kg',
                        max: '0.6 mg/kg',
                        weightCalculation: [ 'lbw', 'ibw' ]
                    }
                }
            ],
            preparations: [
                {
                    concentration: '2 mg/mL'
                }
            ]
        }
    ] );



    /**
     * Fentanyl
     */
    mw.calculators.addDrugs( [
        {
            id: 'fentanyl',
            name: 'Fentanyl',
            tradeNames: [
                'Sublimaze'
            ],
            color: 'opioid',
            references: [
                'Ingrande J, Lemmens HJ. Dose adjustment of anaesthetics in the morbidly obese. Br J Anaesth. 2010 Dec;105 Suppl 1:i16-23. doi: 10.1093/bja/aeq312. PMID: 21148651.',
            ],
            dosages: [
                {
                    indication: 'analgesia',
                    population: 'adult',
                    dose: {
                        min: '25 mcg',
                        max: '100 mcg'
                    }
                }, {
                    indication: 'analgesia',
                    population: 'pediatric',
                    dose: {
                        min: '0.5 mcg/kg',
                        max: '1 mcg/kg',
                        weightCalculation: [ 'lbw', 'ibw' ]
                    }
                }, {
                    indication: 'analgesia',
                    population: 'pediatric',
                    routes: [ 'in' ],
                    dose: {
                        min: '1 mcg/kg',
                        max: '2 mcg/kg',
                        weightCalculation: [ 'lbw', 'ibw' ]
                    }
                }, {
                    indication: 'intubation',
                    population: 'general',
                    dose: {
                        min: '2 mcg/kg',
                        max: '10 mcg/kg'
                    }
                }
            ],
            preparations: [
                {
                    concentration: '50 mcg/mL'
                }
            ]
        }
    ] );



    /**
     * Fluconazole
     */
    mw.calculators.addDrugs( [
        {
            id: 'fluconazole',
            name: 'Fluconazole',
            tradeNames: [
                'Diflucan'
            ],
            references: [
                'Bratzler DW, Dellinger EP, Olsen KM, Perl TM, Auwaerter PG, Bolon MK, Fish DN, Napolitano LM, Sawyer RG, Slain D, Steinberg JP, Weinstein RA; American Society of Health-System Pharmacists; Infectious Disease Society of America; Surgical Infection Society; Society for Healthcare Epidemiology of America. Clinical practice guidelines for antimicrobial prophylaxis in surgery. Am J Health Syst Pharm. 2013 Feb 1;70(3):195-283. doi: 10.2146/ajhp120568. PMID: 23327981.'
            ],
            dosages: [
                {
                    indication: 'antimicrobialPpx',
                    population: 'adult',
                    dose: {
                        dose: '400 mg',
                        frequency: '(no redose)'
                    }
                }, {
                    indication: 'antimicrobialPpx',
                    population: 'pediatric',
                    dose: {
                        dose: '6 mg/kg',
                        absoluteMax: '400 mg',
                        frequency: '(no redose)'
                    }
                }
            ],
            preparations: [
                {
                    concentration: '2 mg/mL'
                }
            ]
        }
    ] );



    /**
     * Flumazenil
     */
    mw.calculators.addDrugs( [
        {
            id: 'flumazenil',
            name: 'Flumazenil',
            tradeNames: [
                'Romazicon'
            ],
            color: 'benzodiazepineReversal',
            description: '<ul><li>Adjust dosing in hepatic impairment</li><li>Seizures may occur in chronic benzodiazepine users and patients with epilepsy</li>',
            dosages: [
                {
                    indication: 'benzodiazepineReversal',
                    population: 'adult',
                    description: '<ul><li>If sedation recurs, repeat reversal q20m</li><li>Max 0.2 mg/min or 3 mg/hr</li></ul>',
                    dose: [
                        {
                            dose: '0.2 mg',
                            frequency: 'q1m (max 1 mg total)'
                        }
                    ]
                }, {
                    indication: 'benzodiazepineReversal',
                    population: 'pediatric',
                    references: [
                        'Hegenbarth MA; American Academy of Pediatrics Committee on Drugs. Preparing for pediatric emergencies: drugs to consider. Pediatrics. 2008 Feb;121(2):433-43. doi: 10.1542/peds.2007-3284. PMID: 18245435.'
                    ],
                    dose: [
                        {
                            min: '0.01 mg/kg',
                            max: '0.02 mg/kg',
                            absoluteMax: '0.2 mg',
                            frequency: 'q1m (max 0.05 mg/kg or 1 mg total, whichever is lower)'
                        }
                    ]
                }
            ],
            preparations: [
                {
                    concentration: '0.1 mg/mL'
                }
            ]
        }
    ] );



    /**
     * Fosaprepitant
     */
    mw.calculators.addDrugs( [
        {
            id: 'fosaprepitant',
            name: 'Fosaprepitant',
            tradeNames: [
                'Emend'
            ],
            references: [
                'Murakami C, Kakuta N, Kume K, Sakai Y, Kasai A, Oyama T, Tanaka K, Tsutsumi YM. A Comparison of Fosaprepitant and Ondansetron for Preventing Postoperative Nausea and Vomiting in Moderate to High Risk Patients: A Retrospective Database Analysis. Biomed Res Int. 2017;2017:5703528. doi: 10.1155/2017/5703528. Epub 2017 Dec 19. PMID: 29410964; PMCID: PMC5749222.'
            ],
            dosages: [
                {
                    indication: 'ponv',
                    population: 'general',
                    dose: {
                        dose: '150 mg'
                    }
                }
            ],
            preparations: [
                {
                    concentration: '150 mg/vial'
                }
            ]
        }
    ] );



    /**
     * Gentamicin
     */
    mw.calculators.addCalculations( {
        gentamicinDosingWeight: {
            name: 'Gentamicin dosing weight',
            abbreviation: 'Gentamicin wt',
            data: {
                calculations: {
                    required: [ 'ibw' ]
                },
                variables: {
                    required: [ 'weight' ]
                }
            },
            units: 'kgwt',
            description: '<ul><li>Gentamicin dosing is based on total body weight (TBW)</li><li>If the total body weight is more than 20% above ideal body weight (IBW), use the dosing weight (DW) below</li></ul>',
            formula: '<math>\\mathrm{DW} = \\mathrm{IBW} + 0.4*(\\mathrm{TBW} - \\mathrm{IBW})</math>',
            references: [
                'Bratzler DW, Dellinger EP, Olsen KM, Perl TM, Auwaerter PG, Bolon MK, Fish DN, Napolitano LM, Sawyer RG, Slain D, Steinberg JP, Weinstein RA; American Society of Health-System Pharmacists; Infectious Disease Society of America; Surgical Infection Society; Society for Healthcare Epidemiology of America. Clinical practice guidelines for antimicrobial prophylaxis in surgery. Am J Health Syst Pharm. 2013 Feb 1;70(3):195-283. doi: 10.2146/ajhp120568. PMID: 23327981.'
            ],
            calculate: function( data ) {
                var weight = data.weight.toNumber( 'kgwt' );
                var ibw = data.ibw.toNumber( 'kgwt' );

                if( weight > ( ibw + 0.2 * ibw ) ) {
                    weight = ibw + 0.4 * ( weight - ibw );
                }

                return weight;
            }
        }
    } );

    mw.calculators.addDrugs( [
        {
            id: 'gentamicin',
            name: 'Gentamicin',
            tradeNames: [
                'Garamycin',
                'Cidomycin'
            ],
            description: '<ul><li>Gentamicin dosing is based on total body weight (TBW)</li><li>If the total body weight is more than 20% above ideal body weight (IBW), use the dosing weight (DW) below</li></ul>',
            formula: '<math>\\mathrm{DW} = \\mathrm{IBW} + 0.4*(\\mathrm{TBW} - \\mathrm{IBW})</math>',
            references: [
                'Bratzler DW, Dellinger EP, Olsen KM, Perl TM, Auwaerter PG, Bolon MK, Fish DN, Napolitano LM, Sawyer RG, Slain D, Steinberg JP, Weinstein RA; American Society of Health-System Pharmacists; Infectious Disease Society of America; Surgical Infection Society; Society for Healthcare Epidemiology of America. Clinical practice guidelines for antimicrobial prophylaxis in surgery. Am J Health Syst Pharm. 2013 Feb 1;70(3):195-283. doi: 10.2146/ajhp120568. PMID: 23327981.'
            ],
            dosages: [
                {
                    indication: 'antimicrobialPpx',
                    population: 'adult',
                    dose: {
                        dose: '5 mg/kg',
                        frequency: '(no redose)',
                        weightCalculation: [ 'gentamicinDosingWeight' ]
                    }
                }, {
                    indication: 'antimicrobialPpx',
                    population: 'pediatric',
                    dose: {
                        dose: '2.5 mg/kg',
                        frequency: '(no redose)',
                        weightCalculation: [ 'gentamicinDosingWeight' ]
                    }
                }
            ],
            preparations: [
                {
                    concentration: '40 mg/mL'
                }
            ]
        }
    ] );



    /**
     * Glycopyrrolate
     */
    mw.calculators.addDrugs( [
        {
            id: 'glycopyrrolate',
            name: 'Glycopyrrolate',
            tradeNames: [
                'Robinul'
            ],
            color: 'anticholinergic',
            searchData: 'neostigmine',
            references: [
                'Gallanosa A, Stevens JB, Quick J. Glycopyrrolate. 2020 Oct 20. In: StatPearls [Internet]. Treasure Island (FL): StatPearls Publishing; 2021 Jan–. PMID: 30252291.'
            ],
            dosages: [
                {
                    indication: 'bradycardia',
                    population: 'adult',
                    dose: {
                        min: '0.1 mg',
                        max: '0.2 mg'
                    }
                }, {
                    indication: 'bradycardia',
                    population: 'pediatric',
                    references: [
                        'Reyntjens K, Foubert L, De Wolf D, Vanlerberghe G, Mortier E. Glycopyrrolate during sevoflurane-remifentanil-based anaesthesia for cardiac catheterization of children with congenital heart disease. Br J Anaesth. 2005 Nov;95(5):680-4. doi: 10.1093/bja/aei254. Epub 2005 Sep 30. PMID: 16199414.',
                        'Desalu I, Kushimo OT, Bode CO. A comparative study of the haemodynamic effects of atropine and glycopyrrolate at induction of anaesthesia in children. West Afr J Med. 2005 Apr-Jun;24(2):115-9. doi: 10.4314/wajm.v24i2.28179. PMID: 16092310.'
                    ],
                    dose: {
                        min: '5 mcg/kg',
                        max: '10 mcg/kg',
                        absoluteMax: '0.2 mg'
                    }
                }, {
                    indication: 'neuromuscularBlockadeReversal',
                    population: 'general',
                    dose: {
                        text: '0.2 mg per 1 mg of neostigmine'
                    }
                }, {
                    indication: 'sialorrhea',
                    population: 'adult',
                    routes: [ 'iv', 'im', 'sq' ],
                    dose: {
                        min: '0.1 mg',
                        max: '0.2 mg',
                        frequency: 'q4-8h'
                    }
                }, {
                    indication: 'sialorrhea',
                    population: 'pediatric',
                    routes: [ 'iv', 'im', 'sq' ],
                    dose: {
                        min: '5 mcg/kg',
                        max: '10 mcg/kg',
                        absoluteMax: '0.2 mg',
                        frequency: 'q4-8h'
                    }
                }
            ],
            preparations: [
                {
                    concentration: '0.2 mg/mL'
                }
            ]
        }
    ] );



    /**
     * Granisetron
     */
    mw.calculators.addDrugs( [
        {
            id: 'granisetron',
            name: 'Granisetron',
            dosages: [
                {
                    indication: 'ponv',
                    population: 'adult',
                    dose: {
                        dose: '1 mg'
                    }
                }, {
                    indication: 'ponv',
                    population: 'pediatric',
                    references: [
                        'Cieslak GD, Watcha MF, Phillips MB, Pennant JH. The dose-response relation and cost-effectiveness of granisetron for the prophylaxis of pediatric postoperative emesis. Anesthesiology. 1996 Nov;85(5):1076-85. doi: 10.1097/00000542-199611000-00016. PMID: 8916825.'
                    ],
                    dose: {
                        dose: '40 mcg/kg',
                        absoluteMax: '1 mg'
                    }
                }
            ],
            preparations: [
                {
                    concentration: '1 mg/mL'
                }
            ]
        }
    ] );



    /**
     * Hydralazine
     */
    mw.calculators.addDrugs([
        {
            id: 'hydralazine',
            name: 'Hydralazine',
            color: 'cardiovascularAntagonist',
            dosages: [
                {
                    indication: 'hypertension',
                    population: 'adult',
                    dose: {
                        dose: '2.5 mg',
                        absoluteMax: '20 mg',
                        frequency: 'q5m'
                    }
                }, {
                    indication: 'hypertension',
                    population: 'pediatric',
                    references: [
                        'Webb TN, Shatat IF, Miyashita Y. Therapy of acute hypertension in hospitalized children and adolescents. Curr Hypertens Rep. 2014 Apr;16(4):425. doi: 10.1007/s11906-014-0425-0. PMID: 24522943; PMCID: PMC4129953.'
                    ],
                    dose: {
                        min: '0.1 mg/kg',
                        max: '0.2 mg/kg',
                        absoluteMax: '20 mg',
                        frequency: 'q5m'
                    }
                }
            ],
            preparations: [
                {
                    concentration: '5 mg/mL'
                }, {
                    concentration: '1 mg/mL'
                }
            ]
        }
    ] );



    /**
     * Hydrocortisone
     */
    mw.calculators.addDrugs( [
        {
            id: 'hydrocortisone',
            name: 'Hydrocortisone',
            references: [
                'Liu MM, Reidy AB, Saatee S, Collard CD. Perioperative Steroid Management: Approaches Based on Current Evidence. Anesthesiology. 2017 Jul;127(1):166-172. doi: 10.1097/ALN.0000000000001659. PMID: 28452806.'
            ],
            searchData: 'stress dose steroids',
            dosages: [
                {
                    indication: 'hpaAxisSuppression',
                    population: 'general',
                    description: '<ul><li>HPA axis suppression is unlikely in patients taking less than 5 mg/day of prednisone or equivalent<ul><li>Methylprednisolone 4 mg/day, dexamethasone 0.5 mg/day, hydrocortisone 20 mg/day</li></ul></li><li>HPA axis suppression is likely in patients taking more than 20 mg/day of prednisone or equivalent<ul><li>Methylprednisolone 16 mg/day, dexamethasone 2 mg/day, hydrocortisone 80 mg/day</li></ul></li><li>Patients taking intermediate doses or who have discontinued higher doses in the previous year should undergo preoperative evaluation of their HPA axis</li></ul>',
                    dose: [
                        {
                            text: '<ul><li>Minor procedures<ul><li>Take usual AM steroid dose, no supplementation required</li></ul></li><li>Moderate surgical stress<ul><li>Take usual AM steroid dose</li><li>50 mg before incision</li><li>25 mg q8h for 24h</li></ul></li><li>Major surgical stress<ul><li>Take usual AM steroid dose</li><li>100 mg before incision</li><li>50 mg q8h for 24h</li><li>Taper dose by 50% per day until at usual dose</li></ul></li>'
                        }
                    ]
                }
            ],
            preparations: [
                {
                    concentration: '50 mg/mL'
                }, {
                    concentration: '125 mg/mL'
                }
            ]
        }
    ] );



    /**
     * Hydromorphone
     */
    mw.calculators.addDrugs( [
        {
            id: 'hydromorphone',
            name: 'Hydromorphone',
            tradeNames: [
                'Dilaudid'
            ],
            color: 'opioid',
            description: 'Higher doses may be required in opioid-tolerant patients',
            dosages: [
                {
                    indication: 'analgesia',
                    population: 'adult',
                    dose: {
                        min: '0.2 mg',
                        max: '1 mg'
                    }
                }, {
                    indication: 'analgesia',
                    population: 'adult',
                    routes: [ 'po' ],
                    dose: {
                        min: '2 mg',
                        max: '4 mg',
                        frequency: 'q4-6h'
                    }
                }, {
                    indication: 'analgesia',
                    population: 'pediatric',
                    dose: {
                        min: '5 mcg/kg',
                        max: '10 mcg/kg'
                    }
                }, {
                    indication: 'analgesia',
                    population: 'pediatric',
                    routes: [ 'po', 'pr' ],
                    dose: {
                        min: '50 mcg/kg',
                        max: '80 mcg/kg',
                        frequency: 'q4-6h'
                    }
                }
            ],
            preparations: [
                {
                    concentration: '0.2 mg/mL'
                }, {
                    concentration: '2 mg/mL',
                    default: true
                }, {
                    concentration: '10 mg/mL'
                }
            ]
        }
    ] );



    /**
     * Intralipid
     */
    mw.calculators.addDrugs([
        {
            id: 'intralipid',
            name: 'Intralipid',
            color: 'localAnestheticAntagonist',
            description: '<ul><li>If patient remains unstable:<ul><li>Repeat bolus</li><li>Double infusion rate</li></ul></li></ul>',
            references: [
                'Neal JM, Neal EJ, Weinberg GL. American Society of Regional Anesthesia and Pain Medicine Local Anesthetic Systemic Toxicity checklist: 2020 version. Reg Anesth Pain Med. 2021 Jan;46(1):81-82. doi: 10.1136/rapm-2020-101986. Epub 2020 Nov 4. PMID: 33148630.'
            ],
            dosages: [
                {
                    indication: 'last',
                    population: 'generalLt70kg',
                    dose: [
                        {
                            name: 'Bolus',
                            dose: '1.5 mL/kg',
                            absoluteMax: '100 mL',
                            duration: '2-3 min',
                            weightCalculation: [ 'ibw' ]
                        }, {
                            name: 'Infusion',
                            dose: '0.25 mL/kg/min',
                            absoluteMax: '16.7 mL/min',
                            weightCalculation: [ 'ibw' ]
                        }
                    ]
                }, {
                    indication: 'last',
                    population: 'generalGe70kg',
                    dose: [
                        {
                            name: 'Bolus',
                            dose: '100 mL',
                            duration: '2-3 min'
                        }, {
                            name: 'Infusion',
                            dose: '250 mL',
                            duration: '15-20 min'
                        }
                    ]
                }
            ]
        }
    ] );



    /**
     * Ketamine
     */
    mw.calculators.addDrugs( [
        {
            id: 'ketamine',
            name: 'Ketamine',
            tradeNames: [
                'Ketalar',
                'Ketaset'
            ],
            color: 'sedativeHypnotic',
            dosages: [
                {
                    indication: 'generalAnesthesia',
                    population: 'general',
                    dose: {
                        min: '1 mg/kg',
                        max: '2 mg/kg',
                        weightCalculation: [ 'lbw', 'ibw'  ]
                    }
                }, {
                    indication: 'generalAnesthesia',
                    population: 'general',
                    routes: [ 'im' ],
                    dose: {
                        min: '4 mg/kg',
                        max: '6 mg/kg'
                    }
                }, {
                    indication: 'analgesia',
                    population: 'general',
                    description: 'To prevent prolonged recovery, do not administer in last hour of surgery.',
                    references: [
                        'Sabine Himmelseher, Marcel E. Durieux, Richard B. Weiskopf; Ketamine for Perioperative Pain Management. Anesthesiology 2005; 102:211–220 doi: https://doi.org/10.1097/00000542-200501000-00030'
                    ],
                    dose: [
                        {
                            name: 'Load (before incision)',
                            min: '0.25 mg/kg',
                            max: '0.5 mg/kg'
                        }, {
                            name: 'Maintenance (intermittent bolus)',
                            min: '0.125 mg/kg',
                            max: '0.25 mg/kg',
                            frequency: 'q30m'
                        }, {
                            name: 'Maintenance (infusion)',
                            min: '0.25 mg/kg/hr',
                            max: '0.5 mg/kg/hr'
                        }
                    ]
                }
            ],
            preparations: [
                {
                    concentration: '10 mg/mL'
                }, {
                    concentration: '50 mg/mL'
                }, {
                    concentration: '100 mg/mL'
                }
            ]
        }
    ] );



    /**
     * Ketorolac
     */
    mw.calculators.addDrugs([
        {
            id: 'ketorolac',
            name: 'Ketorolac',
            tradeNames: [
                'Toradol'
            ],
            dosages: [
                {
                    indication: 'analgesia',
                    population: 'adult',
                    description: 'A 10 mg dose of ketorolac is as effective for acute pain control as a 15 or 30 mg dose<sup>1</sup>',
                    references: [
                        'Motov S, Yasavolian M, Likourezos A, Pushkar I, Hossain R, Drapkin J, Cohen V, Filk N, Smith A, Huang F, Rockoff B, Homel P, Fromm C. Comparison of Intravenous Ketorolac at Three Single-Dose Regimens for Treating Acute Pain in the Emergency Department: A Randomized Controlled Trial. Ann Emerg Med. 2017 Aug;70(2):177-184. doi: 10.1016/j.annemergmed.2016.10.014. Epub 2016 Dec 16. PMID: 27993418.'
                    ],
                    dose: {
                        min: '10 mg',
                        max: '30 mg'
                    }
                }, {
                    indication: 'analgesia',
                    population: 'pediatric',
                    dose: {
                        min: '0.5 mg/kg',
                        max: '1 mg/kg',
                        absoluteMax: '30 mg'
                    }
                }
            ],
            preparations: [
                {
                    concentration: '15 mg/mL'
                }, {
                    concentration: '30 mg/mL',
                    default: true
                }
            ]
        }
    ] );



    /**
     * Labetalol
     */
    mw.calculators.addDrugs([
        {
            id: 'labetalol',
            name: 'Labetalol',
            color: 'cardiovascularAntagonist',
            dosages: [
                {
                    indication: 'hypertension',
                    population: 'adult',
                    description: 'Double dose q5-10m until desired effect achieved.',
                    references: [
                        'Varon J, Marik PE. Perioperative hypertension management. Vasc Health Risk Manag. 2008;4(3):615-27. doi: 10.2147/vhrm.s2471. PMID: 18827911; PMCID: PMC2515421.'
                    ],
                    dose: {
                        min: '10 mg',
                        max: '20 mg',
                        absoluteMax: '80 mg',
                        frequency: 'q5-10m'
                    }
                }, {
                    indication: 'hypertension',
                    population: 'pediatric',
                    references: [
                        'Webb TN, Shatat IF, Miyashita Y. Therapy of acute hypertension in hospitalized children and adolescents. Curr Hypertens Rep. 2014 Apr;16(4):425. doi: 10.1007/s11906-014-0425-0. PMID: 24522943; PMCID: PMC4129953.'
                    ],
                    dose: [
                        {
                            name: 'Bolus',
                            min: '0.2 mg/kg',
                            max: '1 mg/kg',
                            absoluteMax: '40 mg',
                            frequency: 'q5-10m'
                        }, {
                            name: 'Infusion',
                            min: '0.25 mg/kg',
                            max: '3 mg/kg/hr'
                        }
                    ]
                }
            ],
            preparations: [
                {
                    concentration: '5 mg/mL'
                }, {
                    concentration: '1 mg/mL'
                }
            ]
        }
    ] );



    /**
     * Levofloxacin
     */
    mw.calculators.addDrugs( [
        {
            id: 'levofloxacin',
            name: 'Levofloxacin',
            tradeNames: [
                'Levaquin'
            ],
            references: [
                'Bratzler DW, Dellinger EP, Olsen KM, Perl TM, Auwaerter PG, Bolon MK, Fish DN, Napolitano LM, Sawyer RG, Slain D, Steinberg JP, Weinstein RA; American Society of Health-System Pharmacists; Infectious Disease Society of America; Surgical Infection Society; Society for Healthcare Epidemiology of America. Clinical practice guidelines for antimicrobial prophylaxis in surgery. Am J Health Syst Pharm. 2013 Feb 1;70(3):195-283. doi: 10.2146/ajhp120568. PMID: 23327981.'
            ],
            dosages: [
                {
                    indication: 'antimicrobialPpx',
                    population: 'adult',
                    dose: {
                        dose: '500 mg',
                        frequency: '(no redose)'
                    }
                }, {
                    indication: 'antimicrobialPpx',
                    population: 'pediatric',
                    dose: {
                        dose: '10 mg/kg',
                        absoluteMax: '500 mg',
                        frequency: '(no redose)'
                    }
                }
            ],
            preparations: [
                {
                    concentration: '25 mg/mL'
                }
            ]
        }
    ] );



    /**
     * Lidocaine
     */
    mw.calculators.addDrugs( [
        {
            id: 'lidocaine',
            name: 'Lidocaine',
            tradeNames: [
                'Xylocaine'
            ],
            color: 'localAnesthetic',
            dosages: [
                {
                    indication: 'analgesia',
                    population: 'general',
                    description: 'Maximum total dose 4.5 mg/kg',
                    references: [
                        'Lauren K. Dunn, Marcel E. Durieux; Perioperative Use of Intravenous Lidocaine. Anesthesiology 2017; 126:729–737 doi: https://doi.org/10.1097/ALN.0000000000001527'
                    ],
                    dose: [
                        {
                            name: 'Load',
                            min: '1 mg/kg',
                            max: '2 mg/kg'
                        }, {
                            name: 'Maintenance',
                            min: '1.5 mg/kg/hr',
                            max: '3 mg/kg/hr'
                        }
                    ]
                }, {
                    indication: 'intubation',
                    population: 'general',
                    dose: {
                        dose: '1.5 mg/kg',
                        frequency: '2-3 min before intubation'
                    }
                }
            ],
            preparations: [
                {
                    concentration: '1 pct'
                }, {
                    concentration: '2 pct'
                }
            ]
        }
    ] );



    /**
     * Magnesium sulfate
     */
    mw.calculators.addDrugs( [
        {
            id: 'magnesiumSulfate',
            name: 'Magnesium sulfate',
            description: '<ul><li>Rapid administration can cause hypotension and bradycardia</li></ul>',
            references: [],
            dosages: [
                {
                    indication: 'hypomagnesemia',
                    population: 'adult',
                    dose: {
                        min: '1 g',
                        max: '2 g',
                        duration: '15-30 min'
                    }
                }, {
                    indication: 'hypomagnesemia',
                    population: 'pediatric',
                    dose: {
                        min: '25 mg/kg',
                        max: '50 mg/kg',
                        absoluteMax: '2 g',
                        duration: '15-30 min'
                    }
                }, {
                    indication: 'eclampsiaPreeclampsia',
                    population: 'general',
                    description: '<ul><li>ACOG recommends maintenance dose of 1 g/hr in patients with mild renal insufficency</li></ul>',
                    references: [
                        'Gestational Hypertension and Preeclampsia: ACOG Practice Bulletin, Number 222. Obstet Gynecol. 2020 Jun;135(6):e237-e260. doi: 10.1097/AOG.0000000000003891. PMID: 32443079.'
                    ],
                    dose: [
                        {
                            name: 'Load:',
                            min: '4 g',
                            max: '6 g',
                            duration: '15-30 min'
                        }, {
                            name: 'Maintenance:',
                            min: '1 g/hr',
                            max: '2 g/hr'
                        }
                    ]
                }
            ],
            preparations: [
                {
                    concentration: '500 mg/mL'
                }
            ]
        }
    ] );



    /**
     * Mannitol
     */
    mw.calculators.addDrugs([
        {
            id: 'mannitol',
            name: 'Mannitol',
            dosages: [
                {
                    indication: 'icpReduction',
                    population: 'general',
                    references: [

                    ],
                    dose: [
                        {
                            min: '0.25 g/kg',
                            max: '1 g/kg'
                        }
                    ]
                }
            ],
            preparations: [
                {
                    concentration: '5 pct'
                }, {
                    concentration: '20 pct',
                    default: true
                }, {
                    concentration: '25 pct'
                }
            ]
        }
    ] );



    /**
     * Meperidine
     */
    mw.calculators.addDrugs( [
        {
            id: 'meperidine',
            name: 'Meperidine',
            tradeNames: [
                'Demerol'
            ],
            color: 'opioid',
            description: 'Higher doses may be required in opioid-tolerant patients',
            searchData: 'pethidine',
            dosages: [
                {
                    indication: 'analgesia',
                    population: 'adult',
                    dose: {
                        min: '12.5 mg',
                        max: '50 mg'
                    }
                }, {
                    indication: 'shivering',
                    population: 'adult',
                    dose: {
                        min: '12.5 mg',
                        max: '50 mg'
                    }
                }, {
                    indication: 'analgesia',
                    population: 'pediatric',
                    dose: {
                        min: '0.5 mg/kg',
                        max: '1 mg/kg'
                    }
                }, {
                    indication: 'shivering',
                    population: 'pediatric',
                    dose: {
                        min: '0.5 mg/kg',
                        max: '1 mg/kg'
                    }
                }
            ],
            preparations: [
                {
                    concentration: '25 mg/mL'
                }, {
                    concentration: '50 mg/mL',
                    default: true
                }, {
                    concentration: '100 mg/mL'
                }
            ]
        }
    ] );



    /**
     * Methadone
     */
    mw.calculators.addDrugs( [
        {
            id: 'methadone',
            name: 'Methadone',
            color: 'opioid',
            description: 'Higher doses may be required in opioid-tolerant patients',
            references: [
                'Murphy GS, Szokol JW. Intraoperative Methadone in Surgical Patients: A Review of Clinical Investigations. Anesthesiology. 2019 Sep;131(3):678-692. doi: 10.1097/ALN.0000000000002755. PMID: 31094758.'
            ],
            dosages: [
                {
                    indication: 'analgesia',
                    population: 'general',
                    routes: [ 'iv', 'im', 'po', 'sq' ],
                    dose: {
                        min: '0.1 mg/kg',
                        max: '0.3 mg/kg',
                        weightCalculation: [ 'ibw', 'lbw' ]
                    }
                }
            ],
            preparations: [
                {
                    concentration: '10 mg/mL'
                }
            ]
        }
    ] );



    /**
     * Methohexital
     */
    mw.calculators.addDrugs( [
        {
            id: 'methohexital',
            name: 'Methohexital',
            tradeNames: [
                'Brevital'
            ],
            color: 'sedativeHypnotic',
            references: [
                'Syed Q, Kohli A. Methohexital. 2021 Jul 17. In: StatPearls [Internet]. Treasure Island (FL): StatPearls Publishing; 2021 Jan–. PMID: 31335011.'
            ],
            dosages: [
                {
                    indication: 'generalAnesthesia',
                    population: 'adult',
                    dose: {
                        min: '1 mg/kg',
                        max: '1.5 mg/kg',
                        weightCalculation: [ 'lbw', 'ibw' ]
                    }
                }, {
                    indication: 'generalAnesthesia',
                    population: 'pediatric',
                    dose: {
                        min: '1 mg/kg',
                        max: '3 mg/kg',
                        weightCalculation: [ 'lbw', 'ibw' ]
                    }
                }, {
                    indication: 'generalAnesthesia',
                    population: 'pediatric',
                    routes: [ 'im' ],
                    dose: {
                        min: '6.6 mg/kg',
                        max: '10 mg/kg'
                    }
                }, {
                    indication: 'generalAnesthesia',
                    population: 'pediatric',
                    routes: [ 'pr' ],
                    dose: {
                        min: '20 mg/kg',
                        max: '30 mg/kg'
                    }
                }, {
                    indication: 'generalAnesthesia',
                    population: 'geriatric',
                    references: [
                        'Ghoneim MM, Chiang CK, Schoenwald RD, Lilburn JK, Dhanaraj J. The pharmacokinetics of methohexital in young and elderly subjects. Acta Anaesthesiol Scand. 1985 Jul;29(5):480-2. doi: 10.1111/j.1399-6576.1985.tb02237.x. PMID: 4036532.'
                    ],
                    dose: {
                        dose: '1 mg/kg',
                        weightCalculation: [ 'lbw', 'ibw' ]
                    }
                }, {
                    indication: 'ect',
                    population: 'general',
                    dose: {
                        dose: '1.5 mg/kg',
                        weightCalculation: [ 'lbw', 'ibw' ]
                    }
                }, {
                    indication: 'mac',
                    population: 'general',
                    dose: {
                        min: '0.5 mg/kg',
                        max: '1 mg/kg',
                        frequency: 'q2-5m',
                        weightCalculation: [ 'lbw', 'ibw' ]
                    }
                }
            ],
            preparations: [
                {
                    concentration: '200 mg/vial'
                }, {
                    concentration: '500 mg/vial',
                    default: true
                }, {
                    concentration: '2.5 g/vial'
                }
            ]
        }
    ] );



    /**
     * Methylergonovine
     */
    mw.calculators.addDrugs([
        {
            id: 'methylergonovine',
            name: 'Methylergonovine',
            tradeNames: [
                'Methergine'
            ],
            description: '<ul><li>After 2 doses q5-10m, repeat q2-4h</li><li>Relatively contraindicated in preeclampsia and (gestational) hypertension</li></ul>',
            dosages: [
                {
                    indication: 'postpartumHemorrhage',
                    population: 'general',
                    routes: 'im',
                    dose: {
                        dose: '0.2 mg',
                        frequency: 'q5-10m, max 2 doses'
                    }
                }
            ],
            preparations: [
                {
                    concentration: '0.2 mg/mL'
                }
            ]
        }
    ] );



    /**
     * Metoclopramide
     */
    mw.calculators.addDrugs( [
        {
            id: 'metoclopramide',
            name: 'Metoclopramide',
            tradeNames: [
                'Reglan'
            ],
            dosages: [
                {
                    indication: 'ponv',
                    population: 'adult',
                    references: [
                        'De Oliveira GS Jr, Castro-Alves LJ, Chang R, Yaghmour E, McCarthy RJ. Systemic metoclopramide to prevent postoperative nausea and vomiting: a meta-analysis without Fujii\'s studies. Br J Anaesth. 2012 Nov;109(5):688-97. doi: 10.1093/bja/aes325. Epub 2012 Sep 25. PMID: 23015617.'
                    ],
                    dose: {
                        min: '10 mg',
                        max: '20 mg'
                    }
                }, {
                    indication: 'ponv',
                    population: 'pediatric',
                    description: 'Extrapyramidal side effects may be more common in children than adults',
                    references: [
                        'Bolton CM, Myles PS, Nolan T, Sterne JA. Prophylaxis of postoperative vomiting in children undergoing tonsillectomy: a systematic review and meta-analysis. Br J Anaesth. 2006 Nov;97(5):593-604. doi: 10.1093/bja/ael256. Epub 2006 Sep 26. PMID: 17005507.',
                        'Yis U, Ozdemir D, Duman M, Unal N. Metoclopramide induced dystonia in children: two case reports. Eur J Emerg Med. 2005 Jun;12(3):117-9. doi: 10.1097/00063110-200506000-00004. PMID: 15891443.'
                    ],
                    dose: {
                        min: '0.1 mg/kg',
                        max: '0.15 mg/kg',
                        absoluteMax: '10 mg'
                    }
                }
            ],
            preparations: [
                {
                    concentration: '2 mg/mL'
                }
            ]
        }
    ] );



    /**
     * Metoprolol
     */
    mw.calculators.addDrugs([
        {
            id: 'metoprolol',
            name: 'Metoprolol',
            color: 'cardiovascularAntagonist',
            dosages: [
                {
                    indication: 'tachyhypertension',
                    population: 'adult',
                    dose: {
                        min: '1 mg',
                        max: '5 mg',
                        frequency: 'q5m (15 mg max)'
                    }
                }
            ],
            preparations: [
                {
                    concentration: '1 mg/mL'
                }
            ]
        }
    ] );



    /**
     * Metronidazole
     */
    mw.calculators.addDrugs( [
        {
            id: 'metronidazole',
            name: 'Metronidazole',
            tradeNames: [
                'Flagyl'
            ],
            references: [
                'Bratzler DW, Dellinger EP, Olsen KM, Perl TM, Auwaerter PG, Bolon MK, Fish DN, Napolitano LM, Sawyer RG, Slain D, Steinberg JP, Weinstein RA; American Society of Health-System Pharmacists; Infectious Disease Society of America; Surgical Infection Society; Society for Healthcare Epidemiology of America. Clinical practice guidelines for antimicrobial prophylaxis in surgery. Am J Health Syst Pharm. 2013 Feb 1;70(3):195-283. doi: 10.2146/ajhp120568. PMID: 23327981.'
            ],
            dosages: [
                {
                    indication: 'antimicrobialPpx',
                    population: 'adult',
                    dose: {
                        dose: '500 mg',
                        frequency: '(no redose)'
                    }
                }, {
                    indication: 'antimicrobialPpx',
                    population: 'pediatric',
                    dose: {
                        dose: '15 mg/kg',
                        absoluteMax: '500 mg',
                        frequency: '(no redose)'
                    }
                }, {
                    indication: 'antimicrobialPpx',
                    population: 'neonatalGe1200g',
                    dose: {
                        dose: '15 mg/kg',
                        absoluteMax: '500 mg',
                        frequency: '(no redose)'
                    }
                }, {
                    indication: 'antimicrobialPpx',
                    population: 'neonatalLt1200g',
                    dose: {
                        dose: '7.5 mg/kg',
                        frequency: '(no redose)'
                    }
                }, {
                    indication: 'antimicrobialPpx',
                    population: 'adult',
                    routes: [ 'po' ],
                    description: 'For use in colorectal surgery in conjunction with a mechanical bowel preparation.',
                    dose: {
                        dose: '1 g',
                        frequency: '(no redose)'
                    }
                }, {
                    indication: 'antimicrobialPpx',
                    population: 'pediatric',
                    routes: [ 'po' ],
                    description: 'For use in colorectal surgery in conjunction with a mechanical bowel preparation.',
                    dose: {
                        dose: '15 mg/kg',
                        absoluteMax: '1 mg',
                        frequency: '(no redose)'
                    }
                }
            ],
            preparations: [
                {
                    concentration: '5 mg/mL'
                }
            ]
        }
    ] );



    /**
     * Midazolam
     */
    mw.calculators.addDrugs( [
        {
            id: 'midazolam',
            name: 'Midazolam',
            tradeNames: [
                'Versed'
            ],
            color: 'benzodiazepine',
            dosages: [
                {
                    indication: 'anxiolysis',
                    population: 'general',
                    dose: {
                        min: '0.01 mg/kg',
                        max: '0.03 mg/kg'
                    }
                }, {
                    indication: 'anxiolysis',
                    population: 'general',
                    routes: [ 'im' ],
                    dose: {
                        min: '0.07 mg/kg',
                        max: '0.08 mg/kg'
                    }
                }, {
                    indication: 'anxiolysis',
                    population: 'general',
                    routes: [ 'po' ],
                    dose: {
                        dose: '0.5 mg/kg',
                        absoluteMax: '20 mg'
                    }
                }, {
                    indication: 'generalAnesthesia',
                    population: 'general',
                    dose: {
                        min: '0.1 mg/kg',
                        max: '0.3 mg/kg',
                        weightCalculation: [ 'lbw', 'ibw' ]
                    }
                }
            ],
            preparations: [
                {
                    concentration: '1 mg/mL'
                }, {
                    concentration: '5 mg/mL'
                }
            ]
        }
    ] );



    /**
     * Milrinone
     */
    mw.calculators.addDrugs( [
        {
            id: 'milrinone',
            name: 'Milrinone',
            tradeNames: [
                'Primicor'
            ],
            color: 'cardiovascularAgonist',
            description: '<ul><li>Used in cardiogenic shock</li><li>Dose adjustment needed in renal impairment</li></ul>',
            dosages: [
                {
                    indication: 'hypotension',
                    population: 'general',
                    references: [
                        'Hollenberg SM. Vasoactive drugs in circulatory shock. Am J Respir Crit Care Med. 2011 Apr 1;183(7):847-55. doi: 10.1164/rccm.201006-0972CI. Epub 2010 Nov 19. PMID: 21097695.'
                    ],
                    dose: [
                        {
                            name: 'Load (optional)',
                            dose: '50 mcg/kg',
                            duration: '10 min'
                        }, {
                            name: 'Maintenance',
                            min: '0.125 mcg/kg/min',
                            max: '0.75 mcg/kg/min'
                        }
                    ]
                }
            ],
            preparations: [
                {
                    concentration: '0.2 mg/mL'
                }, {
                    concentration: '1 mg/mL'
                }
            ]
        }
    ] );



    /**
     * Misoprostol
     */
    mw.calculators.addDrugs([
        {
            id: 'misoprostol',
            name: 'Misoprostol',
            tradeNames: [
                'Cytotec'
            ],
            references: [
                'Hofmeyr GJ, Gülmezoglu AM, Novikova N, Linder V, Ferreira S, Piaggio G. Misoprostol to prevent and treat postpartum haemorrhage: a systematic review and meta-analysis of maternal deaths and dose-related effects. Bull World Health Organ. 2009 Sep;87(9):666-77. doi: 10.2471/blt.08.055715. PMID: 19784446; PMCID: PMC2739911.',
                'WHO Recommendations for the Prevention and Treatment of Postpartum Haemorrhage. Geneva: World Health Organization; 2012. PMID: 23586122.',
            ],
            dosages: [
                {
                    indication: 'postpartumHemorrhage',
                    population: 'general',
                    routes: [ 'sl' ],
                    dose: {
                        min: '400 mcg',
                        max: '800 mcg'
                    }
                }, {
                    indication: 'postpartumHemorrhage',
                    population: 'general',
                    routes: [ 'pr' ],
                    references: [
                        'Nasr A, Shahin AY, Elsamman AM, Zakherah MS, Shaaban OM. Rectal misoprostol versus intravenous oxytocin for prevention of postpartum hemorrhage. Int J Gynaecol Obstet. 2009 Jun;105(3):244-7. doi: 10.1016/j.ijgo.2009.01.018. Epub 2009 Feb 26. PMID: 19249048.'
                    ],
                    dose: {
                        min: '800 mcg',
                        max: '1000 mcg'
                    }
                }
            ],
            preparations: [
                {
                    concentration: '200 mcg/pill'
                }
            ]
        }
    ] );



    /**
     * Morphine
     */
    mw.calculators.addDrugs( [
        {
            id: 'morphine',
            name: 'Morphine',
            color: 'opioid',
            dosages: [
                {
                    indication: 'analgesia',
                    population: 'adult',
                    routes: [ 'iv', 'im' ],
                    dose: {
                        min: '2.5 mg',
                        max: '10 mg'
                    }
                }, {
                    indication: 'analgesia',
                    population: 'pediatric',
                    routes: [ 'iv', 'im' ],
                    dose: {
                        min: '0.05 mg/kg',
                        max: '0.1 mg/kg'
                    }
                }
            ],
            preparations: [
                {
                    concentration: '2 mg/mL'
                }, {
                    concentration: '4 mg/mL'
                }, {
                    concentration: '5 mg/mL'
                }, {
                    concentration: '8 mg/mL'
                }, {
                    concentration: '10 mg/mL',
                    default: true
                }
            ]
        }
    ] );



    /**
     * Moxifloxacin
     */
    mw.calculators.addDrugs( [
        {
            id: 'moxifloxacin',
            name: 'Moxifloxacin',
            tradeNames: [
                'Avelox',
                'Vigamox',
                'Moxiflox'
            ],
            references: [
                'Bratzler DW, Dellinger EP, Olsen KM, Perl TM, Auwaerter PG, Bolon MK, Fish DN, Napolitano LM, Sawyer RG, Slain D, Steinberg JP, Weinstein RA; American Society of Health-System Pharmacists; Infectious Disease Society of America; Surgical Infection Society; Society for Healthcare Epidemiology of America. Clinical practice guidelines for antimicrobial prophylaxis in surgery. Am J Health Syst Pharm. 2013 Feb 1;70(3):195-283. doi: 10.2146/ajhp120568. PMID: 23327981.'
            ],
            dosages: [
                {
                    indication: 'antimicrobialPpx',
                    population: 'adult',
                    dose: {
                        dose: '400 mg',
                        frequency: '(no redose)'
                    }
                }, {
                    indication: 'antimicrobialPpx',
                    population: 'pediatric',
                    dose: {
                        dose: '10 mg/kg',
                        absoluteMax: '400 mg',
                        frequency: '(no redose)'
                    }
                }
            ],
            preparations: [
                {
                    concentration: '1.6 mg/mL'
                }
            ]
        }
    ] );



    /**
     * Naloxone
     */
    mw.calculators.addDrugs([
        {
            id: 'naloxone',
            name: 'Naloxone',
            tradeNames: [
                'Narcan'

            ],
            color: 'opioidReversal',
            dosages: [
                {
                    indication: 'delayedEmergence',
                    population: 'adult',
                    dose: {
                        min: '20 mcg',
                        max: '200 mcg',
                        frequency: 'q2-3m'
                    }
                }, {
                    indication: 'delayedEmergence',
                    population: 'pediatric',
                    dose: {
                        min: '0.5 mcg/kg',
                        max: '1 mcg/kg',
                        frequency: 'q2-3m'
                    }
                }, {
                    indication: 'opioidOverdose',
                    population: 'adult',
                    routes: [ 'iv', 'im', 'ett' ],
                    dose: {
                        min: '0.1 mg',
                        max: '2 mg',
                        frequency: 'q2-3m'
                    }
                }, {
                    indication: 'opioidOverdose',
                    population: 'pediatric',
                    routes: [ 'iv', 'im', 'ett' ],
                    dose: {
                        dose: '10 mcg/kg',
                        frequency: 'q2-3m'
                    }
                }, {
                    indication: 'opioidOverdose',
                    population: 'general',
                    description: 'Can give initial dose of 2 mg for patients at risk of severe opioid withdrawal',
                    routes: [ 'in' ],
                    dose: {
                        dose: '4 mg',
                        frequency: 'q2-3m'
                    }
                }

            ],
            preparations: [
                {
                    concentration: '0.4 mg/mL'
                }, {
                    concentration: '1 mg/mL'
                }, {
                    concentration: '40 mg/mL'
                }
            ]
        }
    ] );



    /**
     * Neostigmine
     */
    mw.calculators.addDrugs( [
        {
            id: 'neostigmine',
            name: 'Neostigmine',
            color: 'neuromuscularBlockerReversal',
            searchData: 'glycopyrrolate',
            dosages: [
                {
                    indication: 'neuromuscularBlockadeReversal',
                    population: 'general',
                    description: 'For each 1 mg of neostigmine, give 0.2 mg of glycopyrrolate to avoid bradycardia',
                    dose: {
                        min: '0.03 mg/kg',
                        max: '0.07 mg/kg',
                        absoluteMax: '5 mg'
                    }
                }
            ],
            preparations: [
                {
                    concentration: '0.5 mg/mL'
                }, {
                    concentration: '1 mg/mL'
                }
            ]
        }
    ] );



    /**
     * Nitroglycerin
     */
    mw.calculators.addDrugs([
        {
            id: 'nitroglycerin',
            name: 'Nitroglycerin',
            tradeNames: [
                'Nipride'
            ],
            color: 'cardiovascularAntagonist',
            dosages: [
                {
                    indication: 'hypertension',
                    population: 'adult',
                    description: '<ul><li>Titrate by 0.1-0.2 mcg/kg/min q3-5m until desired effect achieved</li></ul>',
                    dose: [
                        {
                            name: 'Bolus',
                            min: '10 mcg',
                            max: '40 mcg'
                        }, {
                            name: 'Maintenance',
                            min: '0.1 mcg/kg/min',
                            max: '3 mcg/kg/min'
                        }
                    ]
                }, {
                    indication: 'hypertension',
                    population: 'pediatric',
                    description: '<ul><li>Titrate by 0.2-0.5 mcg/kg/min q3-5m until desired effect achieved</li></ul>',
                    dose: [
                        {
                            name: 'Bolus',
                            min: '0.1 mcg/kg',
                            max: '0.2 mcg/kg'
                        }, {
                            name: 'Maintenance',
                            min: '0.5 mcg/kg/min',
                            max: '20 mcg/kg/min'
                        }
                    ]
                }, {
                    indication: 'angina',
                    population: 'adult',
                    description: '<ul><li>Titrate by 0.1-0.2 mcg/kg/min q3-5m until desired effect achieved</li></ul>',
                    dose: {
                        min: '0.1 mcg/kg/min',
                        max: '3 mcg/kg/min'
                    }
                }, {
                    indication: 'angina',
                    population: 'adult',
                    routes: [ 'sl' ],
                    dose: {
                        min: '0.4 mg',
                        max: '0.8 mg'
                    }
                }, {
                    indication: 'tocolysis',
                    population: 'adult',
                    description: 'Maternal hypotension may result',
                    references: [
                        'O\'Grady JP, Parker RK, Patel SS. Nitroglycerin for rapid tocolysis: development of a protocol and a literature review. J Perinatol. 2000 Jan-Feb;20(1):27-33. doi: 10.1038/sj.jp.7200303. PMID: 10693097.'
                    ],
                    dose: [
                        {
                            name: 'When rapid reliable tocolysis is required:',
                            min: '250 mcg',
                            max: '500 mcg'
                        }, {
                            name: 'In less urgent circumstances:',
                            min: '50 mcg',
                            max: '250 mcg'
                        }
                    ]
                }, {
                    indication: 'tocolysis',
                    population: 'adult',
                    routes: [ 'sl' ],
                    references: [
                        'O\'Grady JP, Parker RK, Patel SS. Nitroglycerin for rapid tocolysis: development of a protocol and a literature review. J Perinatol. 2000 Jan-Feb;20(1):27-33. doi: 10.1038/sj.jp.7200303. PMID: 10693097.'
                    ],
                    dose: {
                        min: '0.4 mg',
                        max: '0.8 mg'
                    }
                }
            ],
            preparations: [
                {
                    concentration: '10 mcg/mL'
                }, {
                    concentration: '200 mcg/mL'
                }, {
                    concentration: '400 mcg/mL'
                }, {
                    concentration: '0.4 mg/spray'
                }, {
                    concentration: '5 mg/mL'
                }
            ]
        }
    ] );



    /**
     * Nitroprusside
     */
    mw.calculators.addDrugs([
        {
            id: 'nitroprusside',
            name: 'Nitroprusside',
            tradeNames: [
                'Nipride'
            ],
            color: 'cardiovascularAntagonist',
            description: '<ul><li>Titrate by 0.5 mcg/kg/min q3-5m until desired effect achieved</li><li>High doses (8-10 mcg/kg/min) should not be used for more than 10 minutes</li></ul>',
            searchData: 'snp',
            dosages: [
                {
                    indication: 'hypertension',
                    population: 'adult',
                    references: [
                        'Schulz V. Clinical pharmacokinetics of nitroprusside, cyanide, thiosulphate and thiocyanate. Clin Pharmacokinet. 1984 May-Jun;9(3):239-51. doi: 10.2165/00003088-198409030-00005. PMID: 6375932.'
                    ],
                    dose: [
                        {
                            name: 'Bolus',
                            min: '12.5 mcg',
                            max: '25 mcg'
                        }, {
                            name: 'Maintenance',
                            min: '0.3 mcg/kg/min',
                            max: '2 mcg/kg/min'
                        }
                    ]
                }, {
                    indication: 'hypertension',
                    population: 'pediatric',
                    references: [
                        'Hegenbarth MA; American Academy of Pediatrics Committee on Drugs. Preparing for pediatric emergencies: drugs to consider. Pediatrics. 2008 Feb;121(2):433-43. doi: 10.1542/peds.2007-3284. PMID: 18245435.'
                    ],
                    dose: [
                        {
                            name: 'Bolus',
                            min: '0.1 mcg/kg',
                            max: '0.2 mcg/kg'
                        }, {
                            name: 'Maintenance',
                            min: '0.3 mcg/kg/min',
                            max: '2 mcg/kg/min'
                        }
                    ]
                }
            ],
            preparations: [
                {
                    concentration: '5 mcg/mL'
                }, {
                    concentration: '25 mcg/mL'
                }, {
                    concentration: '500 mcg/mL',
                    default: true
                }
            ]
        }
    ] );



    /**
     * Norepinephrine
     */
    mw.calculators.addDrugs( [
        {
            id: 'norepinephrine',
            name: 'Norepinephrine',
            tradeNames: [
                'Levophed'
            ],
            color: 'cardiovascularAgonist',
            description: 'First line vasopressor for septic and hypovolemic shock',
            dosages: [
                {
                    indication: 'hypotension',
                    population: 'adult',
                    references: [
                        'Hollenberg SM. Vasoactive drugs in circulatory shock. Am J Respir Crit Care Med. 2011 Apr 1;183(7):847-55. doi: 10.1164/rccm.201006-0972CI. Epub 2010 Nov 19. PMID: 21097695.'
                    ],
                    dose: [
                        {
                            name: 'Bolus',
                            min: '5 mcg',
                            max: '20 mcg'
                        }, {
                            name: 'Infusion',
                            min: '0.05 mcg/kg/min',
                            max: '3.3 mcg/kg/min'
                        }
                    ]
                }, {
                    indication: 'hypotension',
                    population: 'pediatric',
                    dose: [
                        {
                            name: 'Bolus',
                            min: '0.05 mcg/kg',
                            max: '0.1 mcg/kg'
                        }, {
                            name: 'Infusion',
                            min: '0.05 mcg/kg/min',
                            max: '2 mcg/kg/min'
                        }
                    ]
                }
            ],
            preparations: [
                {
                    concentration: '10 mcg/mL'
                }, {
                    concentration: '16 mcg/mL'
                }, {
                    concentration: '1 mg/mL',
                    dilutionRequired: true
                }
            ]
        }
    ] );



    /**
     * Ondansetron
     */
    mw.calculators.addDrugs( [
        {
            id: 'ondansetron',
            name: 'Ondansetron',
            tradeNames: [
                'Zofran'
            ],
            description: '<ul><li>Maximum recommended daily dose 16 mg due to QT prolongation risk<ul><li>Reduced to 8 mg in patients with severe hepatic impairment</li></ul></li></ul>',
            references: [
                'Griddine A, Bush JS. Ondansetron. [Updated 2022 Sep 22]. In: StatPearls [Internet]. Treasure Island (FL): StatPearls Publishing; 2022 Jan-. Available from: https://www.ncbi.nlm.nih.gov/books/NBK499839/'
            ],
            dosages: [
                {
                    indication: 'ponv',
                    population: 'adult',
                    dose: {
                        dose: '4 mg'
                    }
                }, {
                    indication: 'ponv',
                    population: 'adult',
                    routes: [ 'po' ],
                    dose: {
                        dose: '8 mg',
                        frequency: 'q12h'
                    }
                }, {
                    indication: 'ponv',
                    population: 'pediatric',
                    dose: {
                        dose: '0.15 mg/kg',
                        absoluteMax: '16 mg'
                    }
                }
            ],
            preparations: [
                {
                    concentration: '2 mg/mL'
                }
            ]
        }
    ] );



    /**
     * Oxycodone
     */
    mw.calculators.addDrugs( [
        {
            id: 'oxycodone',
            name: 'Oxycodone',
            color: 'opioid',
            description: 'Higher doses may be required in opioid-tolerant patients',
            dosages: [
                {
                    indication: 'analgesia',
                    population: 'adult',
                    routes: [ 'po' ],
                    dose: {
                        min: '5 mg',
                        max: '15 mg',
                        frequency: 'q4-6h'
                    }
                }, {
                    indication: 'analgesia',
                    population: 'pediatric',
                    routes: [ 'po' ],
                    dose: {
                        min: '0.05 mg/kg',
                        max: '0.2 mg/kg',
                        frequency: 'q4-6h'
                    }
                }
            ]
        }
    ] );



    /**
     * Palonosetron
     */
    mw.calculators.addDrugs( [
        {
            id: 'palonosetron',
            name: 'Palonosetron',
            tradeNames: [
                'Aloxi'
            ],
            dosages: [
                {
                    indication: 'ponv',
                    population: 'adult',
                    references: [
                        'Kovac AL, Eberhart L, Kotarski J, Clerici G, Apfel C; Palonosetron 04-07 Study Group. A randomized, double-blind study to evaluate the efficacy and safety of three different doses of palonosetron versus placebo in preventing postoperative nausea and vomiting over a 72-hour period. Anesth Analg. 2008 Aug;107(2):439-44. doi: 10.1213/ane.0b013e31817abcd3. PMID: 18633021.'
                    ],
                    dose: {
                        dose: '0.075 mg'
                    }
                }, {
                    indication: 'ponv',
                    population: 'pediatric',
                    references: [
                        'Bicer C, Aksu R, Ulgey A, Madenoglu H, Dogan H, Yildiz K, Boyaci A. Different doses of palonosetron for the prevention of postoperative nausea and vomiting in children undergoing strabismus surgery. Drugs R D. 2011;11(1):29-36. doi: 10.2165/11586940-000000000-00000. PMID: 21284406; PMCID: PMC3585907.'
                    ],
                    dose: {
                        min: '0.5 mcg/kg',
                        max: '1.5 mcg/kg',
                        absoluteMax: '75 mcg'
                    }
                }
            ],
            preparations: [
                {
                    concentration: '0.05 mg/mL'
                }
            ]
        }
    ] );



    /**
     * Pancuronium
     */
    mw.calculators.addDrugs( [
        {
            id: 'pancuronium',
            name: 'Pancuronium',
            tradeNames: [
                'Nembutal'
            ],
            color: 'neuromuscularBlocker',
            description: 'Reduce dose or avoid in renal impairment',
            references: [
                'Holmgreen WC, Nishioka G, Smith RB. Pancuronium rapid induction sequence. Anesth Prog. 1987 Sep-Oct;34(5):171-6. PMID: 3479916; PMCID: PMC2148540.'
            ],
            dosages: [
                {
                    indication: 'neuromuscularBlockade',
                    population: 'general',
                    dose: [
                        {
                            name: 'Standard',
                            min: '0.04 mg/kg',
                            max: '0.1 mg/kg',
                            weightCalculation: [ 'ibw', 'lbw' ]
                        }, {
                            name: 'Rapid sequence',
                            min: '0.1 mg/kg',
                            max: '0.15 mg/kg',
                            weightCalculation: [ 'ibw', 'lbw' ]
                        }, {
                            name: 'Maintenance (bolus)',
                            min: '0.015 mg/kg',
                            max: '0.1 mg/kg',
                            frequency: 'q30-60m',
                            weightCalculation: [ 'ibw', 'lbw' ]
                        }, {
                            name: 'Maintenance (infusion)',
                            dose: '0.1 mg/kg/hr',
                            weightCalculation: [ 'ibw', 'lbw' ]
                        }
                    ]
                }
            ],
            preparations: [
                {
                    concentration: '1 mg/mL'
                }
            ]
        }
    ] );



    /**
     * Phenylephrine
     */
    mw.calculators.addDrugs( [
        {
            id: 'phenylephrine',
            name: 'Phenylephrine',
            tradeNames: [
                'Neosynephrine'
            ],
            color: 'cardiovascularAgonist',
            dosages: [
                {
                    indication: 'hypotension',
                    population: 'adult',
                    dose: [
                        {
                            name: 'Bolus',
                            min: '50 mcg',
                            max: '200 mcg'
                        }, {
                            name: 'Infusion',
                            min: '0.25 mcg/kg/min',
                            max: '1 mcg/kg/min'
                        }
                    ]
                }, {
                    indication: 'hypotension',
                    population: 'pediatric',
                    dose: [
                        {
                            name: 'Bolus',
                            min: '0.5 mcg/kg',
                            max: '1 mcg/kg'
                        }, {
                            name: 'Infusion',
                            min: '0.1 mcg/kg/min',
                            max: '0.5 mcg/kg/min'
                        }
                    ]
                }
            ],
            preparations: [
                {
                    concentration: '10 mcg/mL'
                }, {
                    concentration: '100 mcg/mL',
                    default: true
                }, {
                    concentration: '160 mcg/mL'
                }, {
                    concentration: '10 mg/mL',
                    dilutionRequired: true
                }
            ]
        }
    ] );



    /**
     * Piperacillin-tazobactam
     */
    mw.calculators.addDrugs( [
        {
            id: 'piperacillinTazobactam',
            name: 'Piperacillin-tazobactam',
            tradeNames: [
                'Zosyn'
            ],
            references: [
                'Bratzler DW, Dellinger EP, Olsen KM, Perl TM, Auwaerter PG, Bolon MK, Fish DN, Napolitano LM, Sawyer RG, Slain D, Steinberg JP, Weinstein RA; American Society of Health-System Pharmacists; Infectious Disease Society of America; Surgical Infection Society; Society for Healthcare Epidemiology of America. Clinical practice guidelines for antimicrobial prophylaxis in surgery. Am J Health Syst Pharm. 2013 Feb 1;70(3):195-283. doi: 10.2146/ajhp120568. PMID: 23327981.'
            ],
            dosages: [
                {
                    indication: 'antimicrobialPpx',
                    population: 'adult',
                    dose: {
                        dose: '3.375 g',
                        frequency: 'q2h'
                    }
                }, {
                    indication: 'antimicrobialPpx',
                    population: 'pediatric2mo9mo',
                    description: '<ul><li>Only administer piperacillin component</li><li>Not recommended for children under 2 mo</li></ul>',
                    dose: {
                        dose: '80 mg/kg',
                        absoluteMax: '3.375 g',
                        frequency: 'q2h'
                    }
                }, {
                    indication: 'antimicrobialPpx',
                    population: 'pediatricGt9moLe40kg',
                    description: 'Only administer piperacillin component',
                    dose: {
                        dose: '100 mg/kg',
                        absoluteMax: '3.375 g',
                        frequency: 'q2h'
                    }
                }, {
                    indication: 'antimicrobialPpx',
                    population: 'pediatricGt40kg',
                    dose: {
                        dose: '3.375 g',
                        frequency: 'q2h'
                    }
                }
            ],
            preparations: [
                {
                    concentration: '2.25 g/vial'
                }, {
                    concentration: '3.375 g/vial'
                }, {
                    concentration: '4.5 g/vial'
                }
            ]
        }
    ] );



    /**
     * Prochlorperazine
     */
    mw.calculators.addDrugs( [
        {
            id: 'prochlorperazine',
            name: 'Prochlorperazine',
            tradeNames: [
                'Compazine'
            ],
            description: 'Contraindicated in children <2 years old',
            dosages: [
                {
                    indication: 'ponv',
                    population: 'adult',
                    description: 'Max 40 mg/day',
                    dose: {
                        min: '2.5 mg',
                        max: '10 mg',
                        frequency: 'q3-4h'
                    }
                }, {
                    indication: 'ponv',
                    population: 'adult',
                    description: 'Max 40 mg/day',
                    routes: [ 'im', 'po' ],
                    dose: {
                        min: '5 mg',
                        max: '10 mg',
                        frequency: 'q3-4h'
                    }
                }, {
                    indication: 'ponv',
                    population: 'pediatricGe2yo',
                    routes: [ 'iv', 'im', 'po', 'pr' ],
                    dose: {
                        min: '0.1 mg/kg',
                        max: '0.15 mg/kg',
                        absoluteMax: '10 mg',
                        frequency: 'q6-8h'
                    }
                }, {
                    indication: 'ponv',
                    population: 'pediatricLt2yo',
                    dose: {
                        text: 'Contraindicated in children <2 years old'
                    }
                }
            ],
            preparations: [
                {
                    concentration: '5 mg/mL'
                }
            ]
        }
    ] );



    /**
     * Promethazine
     */
    mw.calculators.addDrugs( [
        {
            id: 'promethazine',
            name: 'Promethazine',
            tradeNames: [
                'Phenergan'
            ],
            description: '<ul><li>IM is preferred over IV due to risk of tissue necrosis if extravasation occurs.</li><li>Contraindicated in children <2 years old</li></ul>',
            dosages: [
                {
                    indication: 'ponv',
                    population: 'adult',
                    description: 'Max 40 mg/day',
                    routes: [ 'im', 'iv', 'po', 'pr' ],
                    dose: {
                        min: '12.5 mg',
                        max: '25 mg',
                        frequency: 'q4-6h'
                    }
                }, {
                    indication: 'ponv',
                    population: 'pediatricGe2yo',
                    routes: [ 'im', 'iv', 'po', 'pr' ],
                    dose: {
                        min: '0.25 mg/kg',
                        max: '1 mg/kg',
                        absoluteMax: '25 mg',
                        frequency: 'q4-6h'
                    }
                }, {
                    indication: 'ponv',
                    population: 'pediatricLt2yo',
                    dose: {
                        text: 'Contraindicated in children <2 years old'
                    }
                }
            ],
            preparations: [
                {
                    concentration: '25 mg/mL'
                }, {
                    concentration: '50 mg/mL'
                }
            ]
        }
    ] );



    /**
     * Propofol
     */
    mw.calculators.addDrugs( [
        {
            id: 'propofol',
            name: 'Propofol',
            tradeNames: [
                'Diprivan'
            ],
            color: 'sedativeHypnotic',
            references: [
                'Ingrande J, Lemmens HJ. Dose adjustment of anaesthetics in the morbidly obese. Br J Anaesth. 2010 Dec;105 Suppl 1:i16-23. doi: 10.1093/bja/aeq312. PMID: 21148651.',
            ],
            dosages: [
                {
                    indication: 'generalAnesthesia',
                    population: 'adult',
                    dose: [
                        {
                            name: 'Induction',
                            min: '1 mg/kg',
                            max: '2.5 mg/kg',
                            weightCalculation: [ 'lbw', 'ibw' ]
                        }, {
                            name: 'Maintenance',
                            min: '100 mcg/kg/min',
                            max: '200 mcg/kg/min'
                        }
                    ]
                }, {
                    indication: 'generalAnesthesia',
                    population: 'pediatric',
                    dose: [
                        {
                            name: 'Induction',
                            min: '2.5 mg/kg',
                            max: '3.5 mg/kg',
                            weightCalculation: [ 'lbw', 'ibw' ]
                        }, {
                            name: 'Maintenance',
                            min: '125 mcg/kg/min',
                            max: '300 mcg/kg/min'
                        }
                    ]
                }, {
                    indication: 'generalAnesthesia',
                    population: 'geriatric',
                    dose: [
                        {
                            name: 'Induction',
                            min: '1 mg/kg',
                            max: '1.5 mg/kg',
                            weightCalculation: [ 'lbw', 'ibw' ]
                        }, {
                            name: 'Maintenance',
                            min: '50 mcg/kg/min',
                            max: '100 mcg/kg/min'
                        }
                    ]
                }, {
                    indication: 'mac',
                    population: 'general',
                    dose: {
                        min: '25 mcg/kg/min',
                        max: '75 mcg/kg/min'
                    }
                }
            ],
            preparations: [
                {
                    concentration: '10 mg/mL'
                }
            ]
        }
    ] );



    /**
     * Remifentanil
     */
    mw.calculators.addDrugs( [
        {
            id: 'remifentanil',
            name: 'Remifentanil',
            color: 'opioid',
            references: [
                'Egan TD, Huizinga B, Gupta SK, Jaarsma RL, Sperry RJ, Yee JB, Muir KT. Remifentanil pharmacokinetics in obese versus lean patients. Anesthesiology. 1998 Sep;89(3):562-73. doi: 10.1097/00000542-199809000-00004. PMID: 9743391.'
            ],
            dosages: [
                {
                    indication: 'tiva',
                    population: 'general',
                    dose: [
                        {
                            name: 'Load',
                            min: '1 mcg/kg',
                            max: '2 mcg/kg',
                            weightCalculation: [ 'lbw', 'ibw' ]
                        }, {
                            name: 'Maintenance',
                            min: '0.1 mcg/kg/min',
                            max: '1 mcg/kg/min',
                            weightCalculation: [ 'lbw', 'ibw' ]
                        }
                    ]
                }
            ],
            preparations: [
                {
                    concentration: '50 mcg/mL'
                }, {
                    concentration: '1 mg/vial',
                    dilutionRequired: true
                }, {
                    concentration: '2 mg/vial',
                    dilutionRequired: true
                }
            ]
        }
    ] );



    /**
     * Remimazolam
     */
    mw.calculators.addDrugs([
        {
            id: 'remimazolam',
            name: 'Remimazolam',
            tradeNames: [
                'Byfavo'
            ],
            color: 'benzodiazepine',
            dosages: [
                {
                    indication: 'mac',
                    population: 'adult',
                    dose: {
                        min: '2.5 mg',
                        max: '5 mg',
                        frequency: 'q2m'
                    }
                }
            ],
            preparations: [
                {
                    concentration: '1 mg/mL'
                }, {
                    concentration: '20 mg/vial',
                    dilutionRequired: true
                }
            ]
        }
    ] );



    /**
     * Rocuronium
     */
    mw.calculators.addDrugs( [
        {
            id: 'rocuronium',
            name: 'Rocuronium',
            tradeNames: [
                'Zemuron'
            ],
            color: 'neuromuscularBlocker',
            references: [
                'Ingrande J, Lemmens HJ. Dose adjustment of anaesthetics in the morbidly obese. Br J Anaesth. 2010 Dec;105 Suppl 1:i16-23. doi: 10.1093/bja/aeq312. PMID: 21148651.',
                'Gaszynski TM, Szewczyk T. Rocuronium for rapid sequence induction in morbidly obese patients: a prospective study for evaluation of intubation conditions after administration 1.2 mg kg⁻¹ ideal body weight of rocuronium. Eur J Anaesthesiol. 2011 Aug;28(8):609-10. doi: 10.1097/EJA.0b013e32834753d0. PMID: 21562423.',
                'Kim KN, Kim KS, Choi HI, Jeong JS, Lee HJ. Optimal precurarizing dose of rocuronium to decrease fasciculation and myalgia following succinylcholine administration. Korean J Anesthesiol. 2014 Jun;66(6):451-6. doi: 10.4097/kjae.2014.66.6.451. Epub 2014 Jun 26. PMID: 25006369; PMCID: PMC4085266.'
            ],
            dosages: [
                {
                    indication: 'neuromuscularBlockade',
                    population: 'general',
                    dose: [
                        {
                            name: 'Standard',
                            dose: '0.6 mg/kg',
                            weightCalculation: [ 'ibw', 'lbw' ]
                        }, {
                            name: 'Rapid sequence',
                            dose: '1.2 mg/kg',
                            weightCalculation: [ 'ibw', 'lbw' ]
                        }, {
                            name: 'Defasciculation',
                            dose: '0.04 mg/kg',
                            weightCalculation: [ 'ibw', 'lbw' ]
                        }, {
                            name: 'Maintenance (bolus)',
                            min: '0.1 mg/kg',
                            max: '0.2 mg/kg',
                            weightCalculation: [ 'ibw', 'lbw' ]
                        }, {
                            name: 'Maintenance (infusion)',
                            min: '0.01 mg/kg/min',
                            max: '0.012 mg/kg/min',
                            weightCalculation: [ 'ibw', 'lbw' ]
                        }
                    ]
                }
            ],
            preparations: [
                {
                    concentration: '10 mg/mL'
                }
            ]
        }
    ] );



    /**
     * Ropivacaine
     */
    mw.calculators.addDrugs([
        {
            id: 'ropivacaine',
            name: 'Ropivacaine',
            tradeNames: [
                'Naropin'
            ],
            color: 'localAnesthetic'
        }
    ] );



    /**
     * Scopolamine
     */
    mw.calculators.addDrugs( [
        {
            id: 'scopolamine',
            name: 'Scopolamine',
            color: 'anticholinergic',
            dosages: [
                {
                    indication: 'ponv',
                    population: 'general',
                    description: '1 transdermal patch delivers scopolamine 1.5 mg over 72 hours',
                    routes: [ 'td' ],
                    dose: {
                        dose: '1.5 mg',
                        frequency: 'q72h'
                    }
                }
            ],
            preparations: [
                {
                    concentration: '1.5 mg/patch'
                }
            ]
        }
    ] );



    /**
     * Sodium bicarbonate
     */
    mw.calculators.addDrugs( [
        {
            id: 'sodiumBicarbonate',
            name: 'Sodium bicarbonate',
            dosages: [
                {
                    indication: 'acidemia',
                    population: 'general',
                    dose: {
                        min: '1 mEq/kg',
                        max: '2 mEq/kg'
                    }
                }
            ],
            preparations: [
                {
                    concentration: '1 mEq/mL'
                }
            ]
        }
    ] );



    /**
     * Sodium citrate-citric acid
     */
    mw.calculators.addDrugs( [
        {
            id: 'sodiumCitrateCitricAcid',
            name: 'Sodium citrate-citric acid',
            tradeNames: [
                'Bicitra'
            ],
            dosages: [
                {
                    indication: 'aspirationPpx',
                    population: 'adult',
                    routes: [ 'po' ],
                    dose: {
                        min: '15 mL',
                        max: '30 mL'
                    }
                }, {
                    indication: 'aspirationPpx',
                    population: 'pediatric',
                    routes: [ 'po' ],
                    dose: {
                        min: '1 mL/kg',
                        max: '1.5 mL/kg',
                        absoluteMax: '30 mL'
                    }
                }
            ]
        }
    ] );



    /**
     * Succinylcholine
     */
    mw.calculators.addDrugs( [
        {
            id: 'succinylcholine',
            name: 'Succinylcholine',
            tradeNames: [
                'Anectine'
            ],
            color: 'succinylcholine',
            dosages: [
                {
                    indication: 'neuromuscularBlockade',
                    population: 'general',
                    dose: {
                        min: '1 mg/kg',
                        max: '1.5 mg/kg'
                    }
                }, {
                    indication: 'neuromuscularBlockade',
                    population: 'general',
                    routes: [ 'im' ],
                    description: 'Max 5 mL per injection site',
                    dose: {
                        min: '3 mg/kg',
                        max: '5 mg/kg'
                    }
                }
            ],
            preparations: [
                {
                    concentration: '20 mg/mL'
                }, {
                    concentration: '100 mg/mL'
                }
            ]
        }
    ] );



    /**
     * Sufentanil
     */
    mw.calculators.addDrugs( [
        {
            id: 'sufentanil',
            name: 'Sufentanil',
            color: 'opioid',
            dosages: [
                {
                    indication: 'tiva',
                    population: 'general',
                    references: [

                    ],
                    dose: [
                        {
                            name: 'Load',
                            min: '0.25 mcg/kg',
                            max: '2 mcg/kg',
                            weightCalculation: [ 'lbw', 'ibw' ]
                        }, {
                            name: 'Maintenance',
                            min: '0.3 mcg/kg/hr',
                            max: '1.5 mcg/kg/hr'
                        }
                    ]
                }
            ],
            preparations: [
                {
                    concentration: '5 mcg/mL'
                }, {
                    concentration: '50 mcg/mL'
                }
            ]
        }
    ] );



    /**
     * Sugammadex
     */
    mw.calculators.addDrugs( [
        {
            id: 'sugammadex',
            name: 'Sugammadex',
            tradeNames: [
                'Bridion'
            ],
            color: 'neuromuscularBlockerReversal',
            dosages: [
                {
                    indication: 'neuromuscularBlockadeReversal',
                    population: 'general',
                    dose: [
                        {
                            name: '&ge;2 twitches on TOF:',
                            dose: '2 mg/kg',
                        }, {
                            name: '1-2 posttetanic twitches:',
                            dose: '4 mg/kg',
                        }, {
                            name: 'Immediate reversal:',
                            dose: '16 mg/kg',
                        }
                    ]
                }
            ],
            preparations: [
                {
                    concentration: '100 mg/mL'
                }
            ]
        }
    ] );



    /**
     * Terbutaline
     */
    mw.calculators.addDrugs( [
        {
            id: 'terbutaline',
            name: 'Terbutaline',
            color: 'cardiovascularAgonist',
            description: '<ul><li>Avoid prolonged treatment (48-72 hr)</li><li>Use caution in patients with tachycardia-sensitive cardiac disease or poorly controlled hypothyroidism or diabetes mellitus</li></ul>',
            dosages: [
                {
                    indication: 'tocolysis',
                    population: 'general',
                    description: '<ul><li>Initiate infusion at 2.5-5 mcg/min</li><li>Increase by 2.5 to 5 mcg/min q20-30m until desired effect achieved (max 25 mcg/min)</li></ul>',
                    dose: [
                        {
                            min: '2.5 mcg/min',
                            max: '25 mcg/min',
                        }
                    ]
                }, {
                    indication: 'tocolysis',
                    population: 'general',
                    routes: [ 'sq' ],
                    dose: [
                        {
                            name: 'To induce tocolysis:',
                            dose: '0.25 mg',
                            frequency: 'q20-30m (4 doses max)'
                        }, {
                            name: 'After tocolysis achieved, maintain with:',
                            dose: '0.25 mg',
                            frequency: 'q3-4h',
                            duration: '24 hr'
                        }
                    ]
                }
            ],
            preparations: [
                {
                    concentration: '1 mg/mL'
                }
            ]
        }
    ] );



    /**
     * Thiopental
     */
    mw.calculators.addDrugs( [
        {
            id: 'thiopental',
            name: 'Thiopental',
            color: 'sedativeHypnotic',
            references: [
                'Russo H, Bressolle F. Pharmacodynamics and pharmacokinetics of thiopental. Clin Pharmacokinet. 1998 Aug;35(2):95-134. doi: 10.2165/00003088-199835020-00002. PMID: 9739479.'
            ],
            searchData: 'pentothal',
            dosages: [
                {
                    indication: 'generalAnesthesia',
                    population: 'adult',
                    dose: {
                        min: '3 mg/kg',
                        max: '5 mg/kg',
                        weightCalculation: [ 'lbw', 'ibw' ]
                    }
                }, {
                    indication: 'generalAnesthesia',
                    population: 'neonatal',
                    dose: {
                        min: '3 mg/kg',
                        max: '4 mg/kg'
                    }
                }, {
                    indication: 'generalAnesthesia',
                    population: 'pediatric',
                    dose: {
                        min: '5 mg/kg',
                        max: '8 mg/kg',
                        weightCalculation: [ 'lbw', 'ibw' ]
                    }
                }, {
                    indication: 'generalAnesthesia',
                    population: 'pediatric',
                    routes: [ 'pr' ],
                    dose: {
                        min: '20 mg/kg',
                        max: '50 mg/kg'
                    }
                }, {
                    indication: 'generalAnesthesia',
                    population: 'pediatric',
                    routes: [ 'po' ],
                    dose: {
                        min: '10 mg/kg'
                    }
                }
            ],
            preparations: [
                {
                    concentration: '500 mg/vial'
                }, {
                    concentration: '1 g/vial'
                }
            ]
        }
    ] );



    /**
     * Vancomycin
     */
    mw.calculators.addDrugs( [
        {
            id: 'vancomycin',
            name: 'Vancomycin',
            tradeNames: [
                'Vancocin'
            ],
            references: [
                'Bratzler DW, Dellinger EP, Olsen KM, Perl TM, Auwaerter PG, Bolon MK, Fish DN, Napolitano LM, Sawyer RG, Slain D, Steinberg JP, Weinstein RA; American Society of Health-System Pharmacists; Infectious Disease Society of America; Surgical Infection Society; Society for Healthcare Epidemiology of America. Clinical practice guidelines for antimicrobial prophylaxis in surgery. Am J Health Syst Pharm. 2013 Feb 1;70(3):195-283. doi: 10.2146/ajhp120568. PMID: 23327981.'
            ],
            dosages: [
                {
                    indication: 'antimicrobialPpx',
                    population: 'general',
                    dose: {
                        dose: '15 mg/kg',
                        frequency: '(no redose)'
                    }
                }
            ],
            preparations: [
                {
                    concentration: '1 g/vial'
                }
            ]
        }
    ] );



    /**
     * Vasopressin
     */
    mw.calculators.addDrugs( [
        {
            id: 'vasopressin',
            name: 'Vasopressin',
            color: 'cardiovascularAgonist',
            dosages: [
                {
                    indication: 'hypotension',
                    population: 'adult',
                    description: 'Use caution with sustained infusions >0.04 units/min which can cause cardiac and splanchnic ischemia',
                    references: [
                        'Hollenberg SM. Vasoactive drugs in circulatory shock. Am J Respir Crit Care Med. 2011 Apr 1;183(7):847-55. doi: 10.1164/rccm.201006-0972CI. Epub 2010 Nov 19. PMID: 21097695.'
                    ],
                    dose: [
                        {
                            name: 'Bolus',
                            min: '0.5 units',
                            max: '1 units'
                        }, {
                            name: 'Infusion',
                            min: '0.01 units/min',
                            max: '0.07 units/min'
                        }
                    ]
                }, {
                    indication: 'hypotension',
                    population: 'pediatric',
                    references: [
                        'Choong K, Kissoon N. Vasopressin in pediatric shock and cardiac arrest. Pediatr Crit Care Med. 2008 Jul;9(4):372-9. doi: 10.1097/PCC.0b013e318172d7c8. PMID: 18496412.'
                    ],
                    dose: [
                        {
                            name: 'Bolus',
                            min: '0.005 units/kg',
                            max: '0.01 units/kg'
                        }, {
                            name: 'Infusion',
                            min: '0.0002 units/kg/min',
                            max: '0.008 units/kg/min'
                        }
                    ]
                }
            ],
            preparations: [
                {
                    concentration: '1 unit/mL'
                }, {
                    concentration: '20 units/mL'
                }
            ]
        }
    ] );



    /**
     * Vecuronium
     */
    mw.calculators.addDrugs( [
        {
            id: 'vecuronium',
            name: 'Vecuronium',
            color: 'neuromuscularBlocker',
            references: [
                'Ramzy M, McAllister RK. Vecuronium. [Updated 2021 Jul 25]. In: StatPearls [Internet]. Treasure Island (FL): StatPearls Publishing; 2021 Jan-. Available from: https://www.ncbi.nlm.nih.gov/books/NBK493143/',
                'Smith CE, Kovach B, Polk JD, Hagen JF, Fallon WF Jr. Prehospital tracheal intubating conditions during rapid sequence intubation: rocuronium versus vecuronium. Air Med J. 2002 Jan-Feb;21(1):26-32. doi: 10.1067/mmj.2002.121713. PMID: 11805764.',
                'Baumgarten RK, Carter CE, Reynolds WJ, Brown JL, DeVera HV. Priming with nondepolarizing relaxants for rapid tracheal intubation: a double-blind evaluation. Can J Anaesth. 1988 Jan;35(1):5-11. doi: 10.1007/BF03010536. PMID: 2894903.',
                'Ingrande J, Lemmens HJ. Dose adjustment of anaesthetics in the morbidly obese. Br J Anaesth. 2010 Dec;105 Suppl 1:i16-23. doi: 10.1093/bja/aeq312. PMID: 21148651.'
            ],
            dosages: [
                {
                    indication: 'neuromuscularBlockade',
                    population: 'general',
                    description: 'For rapid sequence, can give priming dose of 0.01 mg/kg three minutes before induction to reduce onset of paralysis to 75 to 90 seconds.',
                    dose: [
                        {
                            name: 'Standard',
                            dose: '0.1 mg/kg',
                            weightCalculation: [ 'ibw', 'lbw' ]
                        }, {
                            name: 'Rapid sequence',
                            min: '0.15 mg/kg',
                            max: '0.2 mg/kg',
                            weightCalculation: [ 'ibw', 'lbw' ]
                        }, {
                            name: 'Maintenance (bolus)',
                            min: '0.01 mg/kg',
                            max: '0.015 mg/kg',
                            frequency: 'q20-40m',
                            weightCalculation: [ 'ibw', 'lbw' ]
                        }, {
                            name: 'Maintenance (infusion)',
                            min: '0.05 mg/kg/hr',
                            max: '0.07 mg/kg/hr',
                            weightCalculation: [ 'ibw', 'lbw' ]
                        }
                    ]
                }
            ],
            preparations: [
                {
                    concentration: '10 mg/vial'
                }
            ]
        }
    ] );
}() );