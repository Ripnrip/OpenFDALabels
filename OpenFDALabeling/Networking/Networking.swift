//
//  Networking.swift
//  OpenFDALabeling
//
//  Created by Admin on 3/12/18.
//  Copyright © 2018 Binary Bros. All rights reserved.
//

import Foundation
import Alamofire
import CoreData

class Networking {
    
    static let sharedInstance = Networking()
    
    //App Token
    static let appToken = "vB90rsIEUdloOP75ZtWkQ08sBATH1kRZgeS8JmNj"
    
    //Pagination count, should be by intervals of 100
    var paginationCount = 0
    
    //Endpoints
    let openFDALabelURL = "https://api.fda.gov/drug/label.json?limit=100&skip="
    
    //Variables
    var drugs = [Result]()
    
    var hasValues = false
    
    //MARK: Get Drug information from endpoint
    func getDrugs(completionHandler:@escaping (Bool) -> ()){
        
        let url = "\(openFDALabelURL)\(paginationCount)"
    
        Alamofire.request(url, method: HTTPMethod.get, parameters: nil, encoding: URLEncoding.default, headers: nil).responseJSON { (dataResponse) in
            
            if dataResponse.error != nil {
                print("there was an error getting the drugs: \(String(describing: dataResponse.error))")
                completionHandler(false)
            }
            guard let request = dataResponse.request, let response = dataResponse.response, let value = dataResponse.value as? [String:Any], let data = dataResponse.data else { return }
            
            let meta = value["meta"] as? [String:Any]
            let results = value["results"] as? [[String:Any]]
            let jsonData = try? JSONSerialization.data(withJSONObject: results, options: [])
            //print("the meta is \(meta) and the results are \(results)")
            
            do {
                let decoder = JSONDecoder()
                let loadedItems = try decoder.decode([Result].self, from: jsonData!)
                self.drugs = loadedItems.filter({$0.openfda.brandName != nil}) //Filter out drugs with no brand names
                self.loadDrugsIntoCoreData(loadedDrugs: self.drugs)
                self.hasValues = true
                print("Decoded Drugs \(self.drugs.count)")
                

                completionHandler(true)
            } catch let err {
                print("Err", err)
                completionHandler(false)
            }
        }
    }
    
    //MARK: Get more drugs from pagination request
    func getMoreDrugs(completionHandler:@escaping (Bool) -> ()) {
        
        //Get next 100 drugs to be pre-fetched and added to the drugs count
        paginationCount += 100
        let url = "\(openFDALabelURL)\(paginationCount)"
        
        Alamofire.request(url, method: HTTPMethod.get, parameters: nil, encoding: URLEncoding.default, headers: nil).responseJSON { (dataResponse) in
            
            if dataResponse.error != nil {
                print("there was an error getting the drugs: \(String(describing: dataResponse.error))")
                completionHandler(false)
            }
            guard let request = dataResponse.request, let response = dataResponse.response, let value = dataResponse.value as? [String:Any], let data = dataResponse.data else { return }
            
            let meta = value["meta"] as? [String:Any]
            let results = value["results"] as? [[String:Any]]
            let jsonData = try? JSONSerialization.data(withJSONObject: results, options: [])

            do {
                let decoder = JSONDecoder()
                let loadedItems = try decoder.decode([Result].self, from: jsonData!)
                self.drugs.append(contentsOf: loadedItems.filter({$0.openfda.brandName != nil}))
                self.loadDrugsIntoCoreData(loadedDrugs: self.drugs)
                print("added Decoded Drugs \(self.drugs.count)")
                
                completionHandler(true)
            } catch let err {
                print("Err", err)
                completionHandler(false)
            }
        }

        
    }
    
    //MARK: Load drugs into coredata
    func loadDrugsIntoCoreData(loadedDrugs: [Result]){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Drug", in: context)
        let newDrug = NSManagedObject(entity: entity!, insertInto: context)
        
        loadedDrugs.forEach { (drug) in
            newDrug.setValue(drug.setID as NSString? , forKey: "setID")
            newDrug.setValue(drug.openfda.brandName?[0] as NSString?, forKey: "name")
            newDrug.setValue(drug.purpose?[0] as NSString? , forKey: "purpose")
            newDrug.setValue(drug.inactiveIngredient?[0] as NSString? , forKey: "inactiveIngredients")
            newDrug.setValue((drug.openfda.route?[0]).map { $0.rawValue } as NSString? , forKey: "route")
            newDrug.setValue(drug.warnings?[0] as NSString? , forKey: "warning")
            newDrug.setValue(drug.keepOutOfReachOfChildren?[0] as NSString? , forKey: "keepOutOfReachOfChildren")
            newDrug.setValue(drug.questions?[0] as NSString? , forKey: "questions")
            
            let shouldSave = !isExist(id: drug.setID)
            //short circuit if it exists
            if shouldSave {
                do { try context.save() } catch { print("Failed saving drug into coredata \(drug.setID)") }
            }else{
                //print("the drug \(drug.setID) is already saved")
            }
        }
        
        //Prevent duplicates
        func isExist(id: String) -> Bool {
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Drug")
            fetchRequest.predicate = NSPredicate(format: "setID == %@", id)
            
            let res = try! context.fetch(fetchRequest)
            //print("the result from seeing if the item exists in coredata is \(res)")
            return res.count > 0 ? true : false
        }
        
    }
    

        
        
}

