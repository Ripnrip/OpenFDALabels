//
//  DrugDetailViewController+TableView.swift
//  OpenFDALabeling
//
//  Created by Admin on 3/14/18.
//  Copyright © 2018 Binary Bros. All rights reserved.
//

import Foundation
import UIKit

extension DrugDetailViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let identifier = "cell\(indexPath.row + 1)"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: identifier) else { return UITableViewCell() }
        
        switch indexPath.row + 1 {
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? DrugNameTableViewCell else { return UITableViewCell() }
            cell.nameLabel.text = "Name: " + (drug.openfda.brandName?[0] ?? "N/A")
            return cell
        case 2:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? DrugPurposeTableViewCell else { return UITableViewCell() }
            cell.purposeTextView.text = drug.purpose?[0] ?? "N/A"
            return cell
        case 3:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? DrugInactiveIngridientsTableViewCell else { return UITableViewCell() }
            cell.inactiveIngredientsTextView.text = drug.inactiveIngredient?[0] ?? "N/A"
            return cell
        case 4:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? DrugRouteTableViewCell else { return UITableViewCell() }
            cell.routeLabel.text = "Route: " + ((drug.openfda.route?[0]).map { $0.rawValue } ?? "N/A")
            return cell
        case 5:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? DrugWarningTableViewCell else { return UITableViewCell() }
            cell.warningTextView.text = drug.warnings?[0] ?? "N/A"
            return cell
        case 6:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? DrugKeepOutOfReachChildrenTableViewCell else { return UITableViewCell() }
            cell.keepOutOfReachOfChildrenTextView.text = drug.keepOutOfReachOfChildren?[0] ?? "N/A"
            return cell
        case 7:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? DrugQuestionsTableViewCell else { return UITableViewCell() }
            cell.questionsTextView.text = drug.questions?[0] ?? "N/A"
            return cell
        default:
            return UITableViewCell()
        }
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let row = indexPath.row + 1
        if row == 2 || row == 3 || row == 5 || row == 6 || row == 7 {
            return 138
        }
        return 44
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return self.footerView
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 44
    }
    
}
