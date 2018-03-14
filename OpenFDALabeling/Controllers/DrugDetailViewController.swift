//
//  DrugDetailViewController.swift
//  OpenFDALabeling
//
//  Created by Admin on 3/13/18.
//  Copyright © 2018 Binary Bros. All rights reserved.
//

import UIKit

class DrugDetailViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    @IBOutlet var footerView: UIView!
    
    var drug:Result!
    
    public enum DrugCellType: Int {
        case Name = 0
        case Purpose
        case InactiveIngredients
        case Route
        case Warning
        case KeepOutOfReachOfChildren
        case Questions
        
        static var count: Int { return DrugCellType.Questions.hashValue + 1}

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    @IBAction func viewMoreInformation(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let controller = storyboard.instantiateViewController(withIdentifier: "DrugMoreInformationViewController") as? DrugMoreInformationViewController else { return }
        controller.drug = drug
        self.navigationController?.pushViewController(controller, animated: true)
    }
    

    
    

}
