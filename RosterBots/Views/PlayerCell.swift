//
//  PlayerCell.swift
//  RosterBots
//
//  Created by Yashwanth on 10/5/17.
//  Copyright © 2017 Yashwanth. All rights reserved.
//

import UIKit

class PlayerCell: UITableViewCell {
   /// Tableview Cell Properties used to display player details.
    @IBOutlet weak var totalAbilityScoreLbl: UILabel!
    @IBOutlet weak var nameLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
