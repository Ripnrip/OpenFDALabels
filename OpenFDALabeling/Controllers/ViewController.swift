//
//  ViewController.swift
//  OpenFDALabeling
//
//  Created by Admin on 3/12/18.
//  Copyright © 2018 Binary Bros. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    @IBOutlet var footerView: UIView!
    @IBOutlet var loadMoreButton: UIButton!
    @IBOutlet var loadingIndicator: UIActivityIndicatorView!
    
    var paginationCount = 20
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        self.title = "FDA Drug Labels"
        loadingIndicator.isHidden = true
//        let appDelegate = UIApplication.shared.delegate as! AppDelegate
//        let context = appDelegate.persistentContainer.viewContext
//        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Drug")
//        //request.predicate = NSPredicate(format: "age = %@", "12")
//        //request.returnsObjectsAsFaults = false
//        do {
//            let result = try context.fetch(request)
//            for data in result as! [NSManagedObject] {
//                print(data.value(forKey: "name") as! String)
//            }
//        } catch {
//            print("Failed getting coreDataObjects")
//        }
        
        Networking.sharedInstance.getDrugs { (success) in
            if success {
                print("success in retrieving drugs")
                self.tableView.reloadData()
            } else {
                print("error in retrieving drugs")
            }
        }
    }

    @IBAction func loadMoreDrugs(_ sender: Any) {
        
        if paginationCount <= Networking.sharedInstance.drugs.count {
        
        loadingIndicator.isHidden = false
        loadingIndicator.startAnimating()
        loadMoreButton.setTitle("Loading...", for: .normal)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.paginationCount += 20
            self.tableView.reloadData()
            self.scrollToBottom()
            
            self.loadingIndicator.isHidden = true
            self.loadMoreButton.setTitle("Load More", for: .normal)
        }
            
        }else{
            Networking.sharedInstance.getMoreDrugs { (success) in
                if success {
                    print("got more drugs with count \(Networking.sharedInstance.drugs.count)")
                    self.loadMoreDrugs(self)
                }else{
                    print("error loading MORE drugs")
                }
            }
        }
        
    }
    
    func scrollToBottom(){
        DispatchQueue.main.async {
            if self.paginationCount > Networking.sharedInstance.drugs.count {
                let indexPath = IndexPath(row: Networking.sharedInstance.drugs.count-1, section: 0)
                self.tableView.scrollToRow(at: indexPath, at: .bottom, animated: true)
            }else {
                let indexPath = IndexPath(row: self.paginationCount-1, section: 0)
                self.tableView.scrollToRow(at: indexPath, at: .bottom, animated: true)
            }
        }
    }
    


}

