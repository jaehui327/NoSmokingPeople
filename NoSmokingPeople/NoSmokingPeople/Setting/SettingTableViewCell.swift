//
//  SettingTableViewCell.swift
//  NoSmokingPeople
//
//  Created by 김재희 on 2017. 8. 31..
//  Copyright © 2017년 김재희. All rights reserved.
//

import UIKit

class SettingTableViewCell: UITableViewCell {

    @IBOutlet weak var maintitle: UILabel!
    @IBOutlet weak var versiontitle: UILabel!
    
    @IBOutlet weak var updatetitle: UILabel!
    @IBOutlet weak var pushnoticeswitch: UISwitch!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
