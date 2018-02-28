
//
//  DataManager.swift
//  GameStats
//
//  Created by Angular-Dev on 2/28/18.
//  Copyright © 2018 Hans. All rights reserved.
//

import UIKit

class DataManager {
    static let sharedInstance = DataManager()
    
    /**
     * team
     */
    func createTeam(name: String) -> Bool {
        if name == "" {
            print("teamName is required")
            return false
        }
        let team = Team()
        team.name = name
        if team.save() != 0 {
            print("team was saved successfully")
        } else {
            print("sql error")
            return false
        }
        return true
    }
    
    func getTeams() -> [AnyObject] {
        var result = [AnyObject]()
        let teams = Team.rows(order:"id ASC") as! [Team]
        
        for team in teams {
            let players = self.getTeamPlayers(teamId: team.id)
            result.append([
                "teamId": team.id,
                "teamName": team.name,
                "players": players
                ] as AnyObject)
        }
        
        return result
    }
    
    func getTeam(id: Int) -> [String: Any]? {
        let team = Team.rowBy(id: id) as? Team
        if team == nil {
            print("team does not exist")
            return nil
        }
        
        let players = self.getTeamPlayers(teamId: team!.id)
        return [
            "teamId": team!.id,
            "teamName": team!.name,
            "players": players
        ]
    }
    
    func updateTeam(id: Int, name: String) -> Bool {
        
        let team = Team.rowBy(id: id) as? Team
        if team == nil {
            print("team does not exist")
            return false
        }
        team!.name = name
        if team!.save() != 0 {
            print("team updated successfully")
        } else {
            print("sql error")
            return false
        }
        return true
    }
    
    func deleteTeam(id: Int) -> Bool {
        let team = Team.rowBy(id: id) as? Team
        if team == nil {
            print("team does not exist")
            return false
        }
        
        if team!.delete() {
            print("team deleted successfully")
            let matches = Match.rows(order:"id ASC") as! [Match]
            for match in matches {
                if match.homeId == id, match.awayId == id {
                    _ = match.delete()
                }
            }
        } else {
            print("sql error")
            return false
        }
        return true
    }
    
    /**
     * player
     */
    func createPlayer(data: [String: Any]) -> Bool {
        
        guard let _ = data["teamId"] else {
            print("teamId is required")
            return false
        }
        
        guard let _ = data["playerName"] else {
            print("playerName is required")
            return false
        }
        let player = Player(data: data)
        if player.save() != 0 {
            print("player was saved successfully")
        } else {
            print("sql error")
            return false
        }
        return true
    }
    
    func getPlayer(index: Int) -> Player? {
        let player = Player.rowBy(id: index) as? Player
        if player == nil {
            print("player does not exist")
            return nil
        }
        return player
    }
    
    func updatePlayer(index: Int, data: [String: Any]) -> Bool {
        let player = Player.rowBy(id: index) as? Player
        if player == nil {
            print("player does not exist")
            return false
        }
        player!.initValue(data: data)
        player!.id = index
        if player!.save() != 0 {
            print("player updated successfully")
        }
        return true
    }
    
    func deletePlayer(index: Int) -> Bool {
        let player = Player.rowBy(id: index) as? Player
        if player == nil {
            print("player does not exist")
            return false
        }
        
        if player!.delete() {
            print("player deleted successfully")
        }
        
        return true
    }
    
    /**
     * match
     */
    func createMatch(homeId: Int, awayId: Int) -> Bool {
        
        let match = Match()
        match.homeId = homeId
        match.awayId = awayId
        if match.save() != 0 {
            print("match was saved successfully")
        } else {
            print("sql error")
            return false
        }
        return true
    }
    
    func getMatches() -> [AnyObject]? {
        var result = [AnyObject]()
        let matches = Match.rows(order:"id ASC") as! [Match]
        
        for match in matches {
            guard let homeTeam = Team.rowBy(id: match.homeId) as? Team else {
                print("sql error")
                return nil
            }
            guard let awayTeam = Team.rowBy(id: match.awayId) as? Team else {
                print("sql error")
                return nil
            }
            let homePlayers = self.getTeamPlayers(teamId: match.homeId)
            let awayPlayers = self.getTeamPlayers(teamId: match.awayId)
            result.append([
                "home":[
                    "teamId": match.homeId,
                    "teamName": homeTeam.name,
                    "players": homePlayers
                ],
                "away":[
                    "teamId": match.awayId,
                    "teamName": awayTeam.name,
                    "players": awayPlayers
                ]
                ] as AnyObject)
        }
        return result
    }
    
    func getMatch(id: Int) -> [String: AnyObject]? {
        let match = Match.rowBy(id: id) as? Match
        if match == nil {
            print("match does not exist")
            return nil
        }
        
        guard let homeTeam = Team.rowBy(id: match!.homeId) as? Team else {
            print("sql error")
            return nil
        }
        guard let awayTeam = Team.rowBy(id: match!.awayId) as? Team else {
            print("sql error")
            return nil
        }
        let homePlayers = self.getTeamPlayers(teamId: match!.homeId)
        let awayPlayers = self.getTeamPlayers(teamId: match!.awayId)
        return [
            "home":[
                "teamId": match!.homeId,
                "teamName": homeTeam.name,
                "players": homePlayers
            ],
            "away":[
                "teamId": match!.awayId,
                "teamName": awayTeam.name,
                "players": awayPlayers
            ]
            ] as [String: AnyObject]
    }
    
    func updateMatch(id: Int, home: Int?, away: Int?) -> Bool {
        let match = Match.rowBy(id: id) as? Match
        if match == nil {
            print("match does not exist")
            return false
        }
        
        if let homeId = home {
            match!.homeId = homeId
        }
        
        if let awayId = away {
            match!.awayId = awayId
        }
        
        if match!.save() != 0 {
            print("match updated successfully")
        } else {
            print("sql error")
            return false
        }
        return true
    }
    
    func deleteMatch(index: Int) -> Bool {
        let match = Match.rowBy(id: index) as? Match
        if match == nil {
            print("match does not exist")
            return false
        }
        
        if match!.delete() {
            print("match deleted successfully")
        } else {
            print("sql error")
            return false
        }
        return true
    }
    
    /**
     * utils
     */
    func getTeamPlayers(teamId: Int) -> [Player] {
        let players = Player.rows(filter: "teamId=\(teamId)")
        return players as! [Player]
    }
    
    func clear() {
        Team.zap()
        Match.zap()
        Player.zap()
    }
}
