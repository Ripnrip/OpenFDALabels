//
//  DrugWarningTableViewCell.swift
//  OpenFDALabeling
//
//  Created by Admin on 3/14/18.
//  Copyright © 2018 Binary Bros. All rights reserved.
//

import UIKit

class DrugWarningTableViewCell: UITableViewCell {
    @IBOutlet var warningTextView: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
