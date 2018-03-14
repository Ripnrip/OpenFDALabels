//
//  ViewController+TableView.swift
//  OpenFDALabeling
//
//  Created by Admin on 3/12/18.
//  Copyright © 2018 Binary Bros. All rights reserved.
//

import Foundation
import UIKit

extension ViewController : UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return Networking.sharedInstance.drugs.count
        if self.paginationCount > Networking.sharedInstance.drugs.count { return Networking.sharedInstance.drugs.count }
        return self.paginationCount
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") else { return UITableViewCell() }
        cell.textLabel?.font = UIFont(name:"Avenir", size:15)
        if Networking.sharedInstance.hasValues == true {
        let drug = Networking.sharedInstance.drugs[indexPath.row]
        cell.textLabel?.text = drug.openfda.brandName?[0] ?? drug.openfda.genericName?[0] ?? "N/A"
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return self.footerView
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 44
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let controller = storyboard.instantiateViewController(withIdentifier: "DrugDetailViewController") as? DrugDetailViewController else { return }
        controller.drug = Networking.sharedInstance.drugs[indexPath.row]
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    
}
