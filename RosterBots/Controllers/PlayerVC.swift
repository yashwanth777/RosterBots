//
//  ViewController.swift
//  RosterBots
//
//  Created by Yashwanth on 10/4/17.
//  Copyright © 2017 Yashwanth. All rights reserved.
//

import UIKit

class PlayerVC: UIViewController,UITableViewDataSource,UITableViewDelegate{

    /// This property stores total number of players.
    var totalPlayerArray = [Player]();
    /// This property stores MainPlayers.
    var mainPlayerArray = [Player]();
    //// This property stores Sustitute Players.
    var substituePlayerArray = [Player]();
    ///This property used to store the selected player data from tableview.
    var selectedPlayer : Player? = nil;

    // MARK: viewcontroller lifecycle methods
    /**
    TotalPlayer is  split into two other sub arrays for loading tableview section data. */
    
    override func viewDidLoad() {
        super.viewDidLoad()
        splitTotalPlayersArray(arr: totalPlayerArray);
    }
    
    // MARK: tableview datasource
    /**
     This function returns number of sections as 2 for a given tableview.*/
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2;
    }
    
    /**
     This functions returns number of rows for each section.
     For section 1 it returns count of mainplayer array.
     For section 2 it returns count of sub player array.     */
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return mainPlayerArray.count;
        }
        else{ return substituePlayerArray.count};
    }
    
    /**
     This function creates custom tableview cell.
     It populates the cell data of scetion 1 using mainplayer array data.
     It populates the cell data of section 2 using substitue player array data.   */
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "playercell", for: indexPath) as! PlayerCell
        if indexPath.section == 0 {
            cell.nameLbl.text = mainPlayerArray[indexPath.row].name;
            cell.totalAbilityScoreLbl.text = String(mainPlayerArray[indexPath.row].totalAbilityScore);
        }
        else{
            cell.nameLbl.text = substituePlayerArray[indexPath.row].name;
            cell.totalAbilityScoreLbl.text = String(substituePlayerArray[indexPath.row].totalAbilityScore);

        }
        return cell;
    }
    
    // MARK: tableview delegate
    
    /**
     This function is used to populated selectedPlayer variable data using the selection of cell made on tableview.*/
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        if indexPath.section == 0{
            selectedPlayer = mainPlayerArray[indexPath.row]
        }
        else{
            selectedPlayer = substituePlayerArray[indexPath.row];
        }
        performSegue(withIdentifier: "player", sender: self);
    }
    
    /**
     It assigns title for two different section headers in tableview. */
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0{
            return "Main Players"
        }
        else{
            return "Sustitutes"
        }
    }
    
    // MARK: seague
    /**
     This function is used to transfer selected player data to DetailVC.*/
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "player") {
            let viewController = segue.destination as! PlayerDetailVC
            viewController.player = selectedPlayer
        }
    }
    
    @IBAction func bzckBtnClicked(_ sender: Any) {
        dismiss(animated: true, completion: nil);
    }
    // MARK: Split Array
    /**
     splits main player array into two sub arrays.
     
     - Parameters:
            -arr :  An array of main players
     */
    func splitTotalPlayersArray(arr : [Player]){

        for i in 0..<arr.count{
            if i < 10{
                mainPlayerArray.append(totalPlayerArray[i]);
            }
            else{
                substituePlayerArray.append(totalPlayerArray[i]);
            }
        }
        
    }
}


