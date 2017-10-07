//
//  MainVC.swift
//  RosterBots
//
//  Created by Yashwanth on 10/6/17.
//  Copyright © 2017 Yashwanth. All rights reserved.
//

import UIKit
/// Initial View Controller

class MainVC: UIViewController {
    var playerArray = [Player]();

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
  /**
     Creates an object for owner class and generates 15 players required for the game.
     Players  are initially sorted according to their total ability score.     */
    
    @IBAction func createPlayersBtnClicked(_ sender: Any) {
        let owner = Owner();
       playerArray =  owner.generatePlayers().sorted (by: { $0.totalAbilityScore > $1.totalAbilityScore});
        for i in 0...14{
            print(playerArray[i].playerSalary);
        }
       performSegue(withIdentifier: "owner", sender: self);
    }
    
    /**
     Checks for players in players array if created before else shows an alert to user to create players before starting game. Once the user finishes creating players it launches PlayerVC.
     */
    @IBAction func playGameBtnClicked(_ sender: Any) {
        if playerArray.count < 1{
            let alert = UIAlertController(title: "Alert", message: "Please Create Players Before Starting Game.", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        else{
            performSegue(withIdentifier: "owner", sender: self);
        }
    }
    
    /**
     Used to transfer created player data to PlayerVC.
     */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "owner") {
            let viewController = segue.destination as! PlayerVC
            viewController.totalPlayerArray = playerArray;
        }
    }
}
