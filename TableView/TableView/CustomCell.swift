//
//  CustomCell.swift
//  TableView
//
//  Created by Do Hung on 7/13/18.
//  Copyright © 2018 Do Hung. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {

    @IBOutlet var img: UIImageView!
    @IBOutlet var lbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
