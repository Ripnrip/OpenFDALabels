//
//  DrugMoreInformationViewController.swift
//  OpenFDALabeling
//
//  Created by Admin on 3/14/18.
//  Copyright © 2018 Binary Bros. All rights reserved.
//

import UIKit

class DrugMoreInformationViewController: UIViewController {

    var drug:Result!

    @IBOutlet var infoTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        renderObjectToString()
    }
    
    func renderObjectToString(){
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        let data = try! encoder.encode(drug)
        let string = String(data: data, encoding: .utf8)!
        infoTextView.text = string
    }


}
