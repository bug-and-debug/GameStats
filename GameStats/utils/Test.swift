//
//  Test.swift
//  GameStats
//
//  Created by Angular-Dev on 2/28/18.
//  Copyright © 2018 Hans. All rights reserved.
//

import Foundation

class Test: NSObject {
    
    let dataManager = DataManager.sharedInstance
    
    func run() {
        let db = SQLiteDB.shared
        db.dropDB()
        _ = db.openDB(copyFile: false)
        
        dataManager.clear()
        
        // create teams
        for teamName in MockData.teams {
            _ = dataManager.createTeam(name: teamName)
        }
        
        // create players
        for player in MockData.players {
            _ = dataManager.createPlayer(data: player as! [String: Any])
        }
        
        // create matches
        for match in MockData.matches {
            _ = dataManager.createMatch(homeId: (match as! [String: Int])["home"]!, awayId: (match as! [String: Int])["away"]!)
        }
        
        // get team list
        print("********* GET TEAMS LIST *********")
        print(dataManager.getTeams())
        
        // get team by id
        print("******** GET TEAM BY ID *********")
        print(dataManager.getTeam(id: 1) ?? "no team")
        
        // get matches list
        print("******** GET MATCHES LIST *********")
        print(dataManager.getMatches() ?? "no matches")
        
        // get match by id
        print("******* GET MATCH BY ID *********")
        print(dataManager.getMatch(id: 1) ?? "no match")
        
        // get player by id
        print("******* GET PLAYER BY ID ********")
        print(dataManager.getPlayer(index: 1) ?? "no player")
        
        // update Team
        print("******* UPDATE TEAM BY ID *******")
        if dataManager.updateTeam(id: 1, name: "Updated Team") {
            print("updated team: \n")
            print(dataManager.getTeam(id: 1)!)
        }
        
        // update match
        print("***** UPDATE MATCH BY ID ********")
        if dataManager.updateMatch(id: 1, home: 2, away: 1) {
            print("updated match: \n")
            print(dataManager.getMatch(id: 1)!)
        }
        
        // update player
        print("***** UPDATE PLAYER BY ID ******")
        if dataManager.updatePlayer(index: 1, data: ["playerName": "Super Hans"]) {
            print("updated player: \n")
            print(dataManager.getPlayer(index: 1)!)
        }
        
        // delete team
        print("***** DELETE TEAM BY ID ******")
        _ = dataManager.deleteTeam(id: 1)
        
        // delete match
        print("***** DELETE MATCH BY ID ******")
        _ = dataManager.deleteMatch(index: 1)
        
        // delete match
        print("***** DELETE PLAYER BY ID ******")
        _ = dataManager.deletePlayer(index: 1)
    }
}
