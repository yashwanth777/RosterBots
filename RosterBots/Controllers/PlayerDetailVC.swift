//
//  PlayerDetailVC.swift
//  RosterBots
//
//  Created by Yashwanth on 10/5/17.
//  Copyright © 2017 Yashwanth. All rights reserved.
//

import UIKit

class PlayerDetailVC: UIViewController {

    /// properties
    @IBOutlet weak var playerNameLbl: UILabel!
    @IBOutlet weak var speedLbl: UILabel!
    @IBOutlet weak var agilityLbl: UILabel!
    @IBOutlet weak var strengthLbl: UILabel!
    @IBOutlet weak var totalLbl: UILabel!
    @IBOutlet weak var salaryLbl: UILabel!
    
    /// It stores data that is being received from PlayerVC.
    var player : Player?
    
    /**
     populates all the properties based on the player instance coming from PlayerVC.
     */
    override func viewDidLoad() {
        super.viewDidLoad()
        if player != nil{
            playerNameLbl.text = player!.name;
            speedLbl.text = String(describing: player!.speed);
            agilityLbl.text = String(describing: player!.agility);
            strengthLbl.text = String(describing: player!.strength);
            totalLbl.text = String(describing: player!.totalAbilityScore);
            salaryLbl.text = String(describing : player!.playerSalary);
        }
    }

    /**
     Dismisses the current View Controller.
     */
    @IBAction func backBtnClicked(_ sender: Any) {
        dismiss(animated: true, completion: nil);
    }
    
}
