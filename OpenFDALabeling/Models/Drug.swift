//
//  Drug.swift
//  OpenFDALabeling
//
//  Created by Admin on 3/12/18.
//  Copyright © 2018 Binary Bros. All rights reserved.
//

import Foundation

struct Welcome: Codable {
    let meta: Meta
    let results: [Result]
}

struct Meta: Codable {
    let disclaimer, terms, license, lastUpdated: String
    let results: Results
    
    enum CodingKeys: String, CodingKey {
        case disclaimer, terms, license
        case lastUpdated = "last_updated"
        case results
    }
}

struct Results: Codable {
    let skip, limit, total: Int
}

struct Result: Codable {
    let effectiveTime: String
    let inactiveIngredient, keepOutOfReachOfChildren, purpose, warnings: [String]?
    let questions, splProductDataElements: [String]?
    let openfda: Openfda
    let version: String
    let dosageAndAdministration, pregnancyOrBreastFeeding, stopUse, storageAndHandling: [String]?
    let doNotUse, packageLabelPrincipalDisplayPanel, indicationsAndUsage: [String]?
    let setID, id: String
    let activeIngredient, whenUsing, splUnclassifiedSectionTable, drugInteractions: [String]?
    let geriatricUse, precautions, microbiologyTable, description: [String]?
    let generalPrecautions, clinicalPharmacologyTable, pharmacokinetics, dosageAndAdministrationTable: [String]?
    let pediatricUse, contraindications, pregnancy, microbiology: [String]?
    let nursingMothers, adverseReactions, splUnclassifiedSection, howSupplied: [String]?
    let informationForPatients, clinicalStudies, clinicalPharmacology, carcinogenesisAndMutagenesisAndImpairmentOfFertility: [String]?
    let nonteratogenicEffects, laborAndDelivery, precautionsTable, drugInteractionsTable: [String]?
    let boxedWarning, laboratoryTests, splMedguide, overdosage: [String]?
    let recentMajorChanges, pharmacodynamics, splPatientPackageInsert, nonclinicalToxicology: [String]?
    let dosageFormsAndStrengths, mechanismOfAction, clinicalStudiesTable, adverseReactionsTable: [String]?
    let warningsAndCautions, recentMajorChangesTable, useInSpecificPopulations, splPatientPackageInsertTable: [String]?
    let drugAbuseAndDependence, drugAndOrLaboratoryTestInteractions, howSuppliedTable, warningsTable: [String]?
    let useInSpecificPopulationsTable, pediatricUseTable, references, teratogenicEffects: [String]?
    let animalPharmacologyAndOrToxicology, askDoctor, askDoctorOrPharmacist, activeIngredientTable: [String]?
    let purposeTable, referencesTable, userSafetyWarnings, otherSafetyInformation: [String]?
    let drugAbuseAndDependenceTable, pharmacokineticsTable, controlledSubstance, splMedguideTable: [String]?
    let dosageFormsAndStrengthsTable, descriptionTable, abuse, geriatricUseTable: [String]?
    let dependence, pharmacodynamicsTable, pharmacogenomics, instructionsForUse: [String]?
    let patientMedicationInformation, instructionsForUseTable, safeHandlingWarning, warningsAndCautionsTable: [String]?
    
    enum CodingKeys: String, CodingKey {
        case effectiveTime = "effective_time"
        case inactiveIngredient = "inactive_ingredient"
        case keepOutOfReachOfChildren = "keep_out_of_reach_of_children"
        case purpose, warnings, questions
        case splProductDataElements = "spl_product_data_elements"
        case openfda, version
        case dosageAndAdministration = "dosage_and_administration"
        case pregnancyOrBreastFeeding = "pregnancy_or_breast_feeding"
        case stopUse = "stop_use"
        case storageAndHandling = "storage_and_handling"
        case doNotUse = "do_not_use"
        case packageLabelPrincipalDisplayPanel = "package_label_principal_display_panel"
        case indicationsAndUsage = "indications_and_usage"
        case setID = "set_id"
        case id
        case activeIngredient = "active_ingredient"
        case whenUsing = "when_using"
        case splUnclassifiedSectionTable = "spl_unclassified_section_table"
        case drugInteractions = "drug_interactions"
        case geriatricUse = "geriatric_use"
        case precautions
        case microbiologyTable = "microbiology_table"
        case description
        case generalPrecautions = "general_precautions"
        case clinicalPharmacologyTable = "clinical_pharmacology_table"
        case pharmacokinetics
        case dosageAndAdministrationTable = "dosage_and_administration_table"
        case pediatricUse = "pediatric_use"
        case contraindications, pregnancy, microbiology
        case nursingMothers = "nursing_mothers"
        case adverseReactions = "adverse_reactions"
        case splUnclassifiedSection = "spl_unclassified_section"
        case howSupplied = "how_supplied"
        case informationForPatients = "information_for_patients"
        case clinicalStudies = "clinical_studies"
        case clinicalPharmacology = "clinical_pharmacology"
        case carcinogenesisAndMutagenesisAndImpairmentOfFertility = "carcinogenesis_and_mutagenesis_and_impairment_of_fertility"
        case nonteratogenicEffects = "nonteratogenic_effects"
        case laborAndDelivery = "labor_and_delivery"
        case precautionsTable = "precautions_table"
        case drugInteractionsTable = "drug_interactions_table"
        case boxedWarning = "boxed_warning"
        case laboratoryTests = "laboratory_tests"
        case splMedguide = "spl_medguide"
        case overdosage
        case recentMajorChanges = "recent_major_changes"
        case pharmacodynamics
        case splPatientPackageInsert = "spl_patient_package_insert"
        case nonclinicalToxicology = "nonclinical_toxicology"
        case dosageFormsAndStrengths = "dosage_forms_and_strengths"
        case mechanismOfAction = "mechanism_of_action"
        case clinicalStudiesTable = "clinical_studies_table"
        case adverseReactionsTable = "adverse_reactions_table"
        case warningsAndCautions = "warnings_and_cautions"
        case recentMajorChangesTable = "recent_major_changes_table"
        case useInSpecificPopulations = "use_in_specific_populations"
        case splPatientPackageInsertTable = "spl_patient_package_insert_table"
        case drugAbuseAndDependence = "drug_abuse_and_dependence"
        case drugAndOrLaboratoryTestInteractions = "drug_and_or_laboratory_test_interactions"
        case howSuppliedTable = "how_supplied_table"
        case warningsTable = "warnings_table"
        case useInSpecificPopulationsTable = "use_in_specific_populations_table"
        case pediatricUseTable = "pediatric_use_table"
        case references
        case teratogenicEffects = "teratogenic_effects"
        case animalPharmacologyAndOrToxicology = "animal_pharmacology_and_or_toxicology"
        case askDoctor = "ask_doctor"
        case askDoctorOrPharmacist = "ask_doctor_or_pharmacist"
        case activeIngredientTable = "active_ingredient_table"
        case purposeTable = "purpose_table"
        case referencesTable = "references_table"
        case userSafetyWarnings = "user_safety_warnings"
        case otherSafetyInformation = "other_safety_information"
        case drugAbuseAndDependenceTable = "drug_abuse_and_dependence_table"
        case pharmacokineticsTable = "pharmacokinetics_table"
        case controlledSubstance = "controlled_substance"
        case splMedguideTable = "spl_medguide_table"
        case dosageFormsAndStrengthsTable = "dosage_forms_and_strengths_table"
        case descriptionTable = "description_table"
        case abuse
        case geriatricUseTable = "geriatric_use_table"
        case dependence
        case pharmacodynamicsTable = "pharmacodynamics_table"
        case pharmacogenomics
        case instructionsForUse = "instructions_for_use"
        case patientMedicationInformation = "patient_medication_information"
        case instructionsForUseTable = "instructions_for_use_table"
        case safeHandlingWarning = "safe_handling_warning"
        case warningsAndCautionsTable = "warnings_and_cautions_table"
    }
}

struct Openfda: Codable {
    let splID, productNdc, substanceName: [String]?
    let productType: [ProductType]?
    let route: [Route]?
    let isOriginalPackager: [Bool]?
    let packageNdc, genericName, splSetID, brandName: [String]?
    let manufacturerName, unii, upc, nui: [String]?
    let pharmClassCS, originalPackagerProductNdc, rxcui, applicationNumber: [String]?
    let pharmClassEpc, pharmClassMoa, pharmClassPE: [String]?
    
    enum CodingKeys: String, CodingKey {
        case splID = "spl_id"
        case productNdc = "product_ndc"
        case substanceName = "substance_name"
        case productType = "product_type"
        case route
        case isOriginalPackager = "is_original_packager"
        case packageNdc = "package_ndc"
        case genericName = "generic_name"
        case splSetID = "spl_set_id"
        case brandName = "brand_name"
        case manufacturerName = "manufacturer_name"
        case unii, upc, nui
        case pharmClassCS = "pharm_class_cs"
        case originalPackagerProductNdc = "original_packager_product_ndc"
        case rxcui
        case applicationNumber = "application_number"
        case pharmClassEpc = "pharm_class_epc"
        case pharmClassMoa = "pharm_class_moa"
        case pharmClassPE = "pharm_class_pe"
    }
}

enum ProductType: String, Codable {
    case humanOtcDrug = "HUMAN OTC DRUG"
    case humanPrescriptionDrug = "HUMAN PRESCRIPTION DRUG"
}

enum Route: String, Codable {
    case ophthalmic = "OPHTHALMIC"
    case oral = "ORAL"
    case topical = "TOPICAL"
    case intramuscular = "INTRAMUSCULAR"
    case intravenous = "INTRAVENOUS"
    case intraderman = "INTRADERMAL"
    case subcutaneous = "SUBCUTANEOUS"
    case respiratory = "RESPIRATORY (INHALATION)"
    case vaginal = "VAGINAL"
    case nasal = "NASAL"
    case dental = "DENTAL"
    case sublingual = "SUBLINGUAL"
    case rectal = "RECTAL"
    case intrathecal = "INTRATHECAL"
    case transdermal = "TRANSDERMAL"
    case buccal = "BUCCAL"
    case auricular = "AURICULAR (OTIC)"
    case cutaneous = "CUTANEOUS"
}



// MARK: Convenience initializers

extension Welcome {
    init(data: Data) throws {
        self = try JSONDecoder().decode(Welcome.self, from: data)
    }
    
    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }
    
    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }
    
    func jsonData() throws -> Data {
        return try JSONEncoder().encode(self)
    }
    
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

extension Meta {
    init(data: Data) throws {
        self = try JSONDecoder().decode(Meta.self, from: data)
    }
    
    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }
    
    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }
    
    func jsonData() throws -> Data {
        return try JSONEncoder().encode(self)
    }
    
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

extension Results {
    init(data: Data) throws {
        self = try JSONDecoder().decode(Results.self, from: data)
    }
    
    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }
    
    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }
    
    func jsonData() throws -> Data {
        return try JSONEncoder().encode(self)
    }
    
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

extension Result {
    init(data: Data) throws {
        self = try JSONDecoder().decode(Result.self, from: data)
    }
    
    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }
    
    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }
    
    func jsonData() throws -> Data {
        return try JSONEncoder().encode(self)
    }
    
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

extension Openfda {
    init(data: Data) throws {
        self = try JSONDecoder().decode(Openfda.self, from: data)
    }
    
    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }
    
    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }
    
    func jsonData() throws -> Data {
        return try JSONEncoder().encode(self)
    }
    
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}
