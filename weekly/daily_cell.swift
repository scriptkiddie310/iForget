//
//  daily_cell.swift
//  weekly
//
//  Created by Felix on 10/24/15.
//  Copyright © 2015 Felix. All rights reserved.
//

import UIKit

class daily_cell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBOutlet var del: delete_button!
    @IBOutlet weak var entry: UILabel!
    @IBOutlet weak var time: UILabel!
    var rank: Int!
}
