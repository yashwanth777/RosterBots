//
//  Owner.swift
//  RosterBots
//
//  Created by Yashwanth on 10/4/17.
//  Copyright © 2017 Yashwanth. All rights reserved.
//

import Foundation

///Class that reprents owner of a Robot Team
class Owner{
    /// Array of total team of players.
    var playerArray = [Player]();
    
    ///Instance of a player.
    var player : Player?
    
    /**
     Generates Players with unique names and unique total ability score.
     -return - an array of 15 players.
     */
    func generatePlayers() -> [Player]{
        if playerArray.count > 0{
            playerArray = [];
        }
        for i in stride(from: 0, through: 14, by: 1) {
            player = Player();
            for var j in stride(from: i - 1 , through: 0, by: -1) where j >= 0  {
                if player?.name == playerArray[j].name {
                    player?.generateName();
                    j = i - 1;
                    continue;
                }
                if player?.totalAbilityScore == playerArray[j].totalAbilityScore{
                    player?.generateScore();
                    j = i - 1;
                    continue;
                }
            }
            playerArray.append(player!);
        }
        distributeSalary(total: 175);
        return playerArray;
    }
    
    /**
     Distributes a Total Salary of 175(as mentioned in the document) among 15 players as per their total ability score.
     */
    
    func distributeSalary(total : Float){
        var totalScore : Float = 0;
        var scorePerPlayer:Float = 0;
        for i in 0..<playerArray.count{
            totalScore += Float(playerArray[i].totalAbilityScore);
        }
        scorePerPlayer = total / totalScore;
        for i in 0..<playerArray.count{
            playerArray[i].playerSalary = Int(Float(playerArray[i].totalAbilityScore) * scorePerPlayer);
        }
        
    }
}

