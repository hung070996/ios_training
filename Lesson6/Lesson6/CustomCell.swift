//
//  CustomCell.swift
//  Lesson6
//
//  Created by Do Hung on 7/16/18.
//  Copyright © 2018 Do Hung. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var urlLabel: UILabel!
    @IBOutlet var desLabel: UILabel!
    @IBOutlet var createLabel: UILabel!
    @IBOutlet var sizeLabel: UILabel!
    @IBOutlet var watcherLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
