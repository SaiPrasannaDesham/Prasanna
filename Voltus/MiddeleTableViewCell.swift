//
//  MiddeleTableViewCell.swift
//  Voltus
//
//  Created by vw-mac-01 on 01/04/17.
//  Copyright © 2017 vw-mac-01. All rights reserved.
//

import UIKit

class MiddeleTableViewCell: UITableViewCell {
    @IBOutlet weak var middleTableViewImage:UIImageView?
    @IBOutlet weak var middleTableViewLabel:UILabel?

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
