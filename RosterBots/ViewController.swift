//
//  ViewController.swift
//  RosterBots
//
//  Created by Roger on 10/4/17.
//  Copyright © 2017 Yashwanth. All rights reserved.
//

import UIKit

class PlayerVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let own = Owner();
       var arr =  own.generatePlayers();
        
        arr = arr.sorted (by: { $0.totalAbilityScore > $1.totalAbilityScore})
        
        var mainPlayersArray = arr[0...9];
        var substitutePlayerArray = arr[10...14];
        
        print(mainPlayersArray.count);
        print(substitutePlayerArray.count);
        
            
        
        
        for i in 1...14
        {
            let p1 = arr[i] ;
         //   print("name : \(p1.name) agility:  \(p1.agility)   speed : \(p1.speed)  strength : \(p1.strength)  total is:   \(p1.totalAbilityScore)");
        }
            
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    


}

