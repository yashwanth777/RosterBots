//
//  Player.swift
//  RosterBots
//
//  Created by Yashwanth on 10/4/17.
//  Copyright © 2017 Yashwanth. All rights reserved.
//

import Foundation

/// A player bot who plays RosterBots game.
class Player {
    /// The strength of a player
    private (set) var strength : Int = 0
    /// The speed of a player
    private (set) var speed = 0
    /// The agility of a player
    private (set) var agility = 0
    /// The name of a player
    private (set) var name = ""
    ///The total ability score of a player.
    private (set) var totalAbilityScore = 0
    ///Salary of a player
     var playerSalary = 0
    
    
    /**
     Initializes Player class with all the unique random generated properties.
     
     - Returns - A fully loaded custom built player.   */
    init() {
        self.generateScore();
        self.generateName();
    }
    
    /**
     It generates an alpha numeric name for a player by concatinating four digit number and four letter string.
     - Output - "ABCD3547".    */
    
    func generateName() {
        name = generateWordId() + generateFourDigitNumber()  ;
    }
    
    /**
     Generates random scores for a player.
     */
    
    func generateScore() {
        let ability = Double(arc4random_uniform(100))
        let randoms = [drand48(), drand48(), drand48()]
        let factors = randoms.map { $0 * Double(1 / randoms.reduce(0, +)) }
        
        agility = Int(ability * factors[0])
        speed = Int(ability * factors[1])
        strength = Int(ability * factors[2])
        
        //speed = Int(arc4random_uniform(100));
        //strength = Int(arc4random_uniform(UInt32(100  - (speed))));
        //agility = Int(arc4random_uniform(UInt32(100 - (speed + strength ))));
        
        totalAbilityScore = speed + strength + agility;

    }
    
    /**
     Generates a random four digit Number.
     */
    func generateFourDigitNumber() -> String {
        var result = ""
        repeat {
            result = String(format:"%04d", arc4random_uniform(10000) )
        } while Set<Character>(result.characters).count < 4
        return result
    }
    
    /**
     Generates a four digit string from list of captialized letters.
     */
    func generateWordId() -> String {
        var result = ""
        let randomChars = [Character]("ABCDEFGHIJKLMNOPQRSTUVWXYZ".characters)
        for _ in 0..<4 {
            let random = Int(arc4random_uniform(26))
            result.append(randomChars[random])
        }
        return result
    }
    
    
}
