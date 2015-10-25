//
//  TableViewCell.swift
//  weekly
//
//  Created by Felix on 10/23/15.
//  Copyright © 2015 Felix. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

    @IBOutlet var day: UILabel!
    @IBOutlet var plans: UILabel!
    var week_index: Int = -1
    var count: Int = 0
    
}
