//
//  RosterBotsTests.swift
//  RosterBotsTests
//
//  Created by Roger on 10/4/17.
//  Copyright © 2017 Yashwanth. All rights reserved.
//

import XCTest
@testable import RosterBots

class RosterBotsTests: XCTestCase {
    var own = Owner();
    var totalplayersArray = [Player]()
    var names = Set<String>();
    var scores = Set<Int>()

    override func setUp() {
        super.setUp()
        totalplayersArray = own.generatePlayers();
        for i in 0..<totalplayersArray.count{
            names.insert(totalplayersArray[i].name);
            scores.insert(totalplayersArray[i].totalAbilityScore);
        }
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    
    func testPlayerName() {
        let player = Player();
        XCTAssertLessThan(1, 100)
        let charset = CharacterSet(charactersIn: "ABCDEFGHIJKLKMNOPQRSTUVWXYZ0123456789");
        XCTAssertTrue((player.name.rangeOfCharacter(from: charset) != nil));
        
    }
    
    func testTotalPlayerCount(){
        XCTAssertEqual(totalplayersArray.count, 15);
    }
    
    func testPlayerTotalScore(){
        for i in 0..<totalplayersArray.count{
            XCTAssertLessThan( totalplayersArray[i].totalAbilityScore,100);
        }
    }
    
    func testPlayerUniqueScores(){
        XCTAssertEqual(scores.count, 15);
    }
    
    func testPlayerUniqueNames(){
        XCTAssertEqual(names.count, 15);
    }
    
}
