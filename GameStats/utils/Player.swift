
//
//  Player.swift
//  GameStats
//
//  Created by Angular-Dev on 2/28/18.
//  Copyright © 2018 Hans. All rights reserved.
//

import UIKit

class Player:SQLTable {
    var id = -1
    var teamId = 0
    var playerName: String = ""
    var playerJersey: Int = 0
    var turnovers:Int = 0
    var offensiveRebounds:Int = 0
    var defensiveRebounds:Int = 0
    var freeThrowsMade:Int = 0
    var freeThrowsMissed:Int = 0
    var fieldGoalsMade:Int = 0
    var fieldGoalsMissed:Int = 0
    var threePointShotsMade:Int = 0
    var threePointShotsMissed:Int = 0
    var steals:Int = 0
    var blocks:Int = 0
    var assists:Int = 0
    var fouls:Int = 0
    var hustlePoints:Int = 0
    var shootingPercent:double_t = 0
    var freeThrowPercent:double_t = 0
    var onCourt: Bool = false
    var entryOwnScore: Int = 0
    var entryOppScore: Int = 0
    var prevPlusMinus: Int = 0
    var plusMinus: Int = 0
    
    var playingTime: Int = 0
    
    var playedQ1: Bool = false
    var playedQ2: Bool = false
    var playedQ3: Bool = false
    var playedQ4: Bool = false
    
    var isHighestPts: Bool = false
    var isHighestTrb: Bool = false
    var isHighestStls: Bool = false
    var isHighestBlk: Bool = false
    var isHighestAst: Bool = false
    var isHighestTov: Bool = false
    var isHighestFouls: Bool = false
    var isHighestPlusMinus: Bool = false
    var isHighestEfficiency: Bool = false
    var isHighestFGPercentt: Bool = false
    var isHighestFTPPercent: Bool = false
    var isHighestTSP: Bool = false
    
    init(data: [String: Any]) {
        super.init()
        initValue(data: data)
    }
    
    func initValue(data: [String: Any]) {
        if let teamId = data["teamId"] {
            self.teamId = teamId as! Int
        }
        
        if let playerName = data["playerName"] {
            self.playerName = playerName as! String
        }
        
        if let playerJersey = data["playerJersey"] {
            self.playerJersey = playerJersey as! Int
        }
        
        if let turnovers = data["turnovers"] {
            self.turnovers = turnovers as! Int
        }
        
        if let offensiveRebounds = data["offensiveRebounds"] {
            self.offensiveRebounds = offensiveRebounds as! Int
        }
        
        if let defensiveRebounds = data["defensiveRebounds"] {
            self.defensiveRebounds = defensiveRebounds as! Int
        }
        
        if let freeThrowsMade = data["freeThrowsMade"] {
            self.freeThrowsMade = freeThrowsMade as! Int
        }
        
        if let freeThrowsMissed = data["freeThrowsMissed"] {
            self.freeThrowsMissed = freeThrowsMissed as! Int
        }
        
        if let steals = data["steals"] {
            self.steals = steals as! Int
        }
        
        if let blocks = data["blocks"] {
            self.blocks = blocks as! Int
        }
        
        if let assists = data["assists"] {
            self.assists = assists as! Int
        }
        
        if let fouls = data["fouls"] {
            self.fouls = fouls as! Int
        }
        
        if let hustlePoints = data["hustlePoints"] {
            self.hustlePoints = hustlePoints as! Int
        }
        
        if let shootingPercent = data["shootingPercent"] {
            self.shootingPercent = shootingPercent as! double_t
        }
        
        if let freeThrowPercent = data["freeThrowPercent"] {
            self.freeThrowPercent = freeThrowPercent as! double_t
        }
        
        if let onCourt = data["onCourt"] {
            self.onCourt = onCourt as! Bool
        }
        
        if let entryOwnScore = data["entryOwnScore"] {
            self.entryOwnScore = entryOwnScore as! Int
        }
        
        if let entryOppScore = data["entryOppScore"] {
            self.entryOppScore = entryOppScore as! Int
        }
        
        if let prevPlusMinus = data["prevPlusMinus"] {
            self.prevPlusMinus = prevPlusMinus as! Int
        }
        
        if let plusMinus = data["plusMinus"] {
            self.plusMinus = plusMinus as! Int
        }
        
        if let playingTime = data["playingTime"] {
            self.playingTime = playingTime as! Int
        }
        
        if let playedQ1 = data["playedQ1"] {
            self.playedQ1 = playedQ1 as! Bool
        }
        
        if let playedQ2 = data["playedQ2"] {
            self.playedQ2 = playedQ2 as! Bool
        }
        
        if let playedQ3 = data["playedQ3"] {
            self.playedQ3 = playedQ3 as! Bool
        }
        
        if let playedQ4 = data["playedQ4"] {
            self.playedQ4 = playedQ4 as! Bool
        }
        
        if let isHighestPts = data["isHighestPts"] {
            self.isHighestPts = isHighestPts as! Bool
        }
        
        if let isHighestTrb = data["isHighestTrb"] {
            self.isHighestTrb = isHighestTrb as! Bool
        }
        
        if let isHighestStls = data["isHighestStls"] {
            self.isHighestStls = isHighestStls as! Bool
        }
        
        if let isHighestBlk = data["isHighestBlk"] {
            self.isHighestBlk = isHighestBlk as! Bool
        }
        
        if let isHighestAst = data["isHighestAst"] {
            self.isHighestAst = isHighestAst as! Bool
        }
        
        if let isHighestTov = data["isHighestTov"] {
            self.isHighestTov = isHighestTov as! Bool
        }
        
        
        if let isHighestFouls = data["isHighestFouls"] {
            self.isHighestFouls = isHighestFouls as! Bool
        }
        
        if let isHighestPlusMinus = data["isHighestPlusMinus"] {
            self.isHighestPlusMinus = isHighestPlusMinus as! Bool
        }
        
        if let isHighestEfficiency = data["isHighestEfficiency"] {
            self.isHighestEfficiency = isHighestEfficiency as! Bool
        }
        
        if let isHighestFGPercentt = data["isHighestFGPercentt"] {
            self.isHighestFGPercentt = isHighestFGPercentt as! Bool
        }
        
        if let isHighestFTPPercent = data["isHighestFTPPercent"] {
            self.isHighestFTPPercent = isHighestFTPPercent as! Bool
        }
        
        if let isHighestTSP = data["isHighestTSP"] {
            self.isHighestTSP = isHighestTSP as! Bool
        }
    }
    
    override var description:String {
        return "id: \(id), name: \(playerName)"
    }
    
    required init() {
        
    }
}
