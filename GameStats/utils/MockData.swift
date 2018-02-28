
//
//  MockData.swift
//  GameStats
//
//  Created by Angular-Dev on 2/28/18.
//  Copyright © 2018 Hans. All rights reserved.
//

import Foundation

class MockData: NSObject {
    
    static let teams:[String] = [
        "Arizona Cardinals",
        "Atlanta Falcons",
        "Baltimore Ravens",
        "Buffalo Bills",
        "Dallas Cowboys"
    ]
    
    static let players: [AnyObject] = [
        [
            "teamId": 1,
            "playerName": "Dinesh Nambisan",
            "playerJersey": 1,
            "turnovers": 1
            ] as AnyObject,
        [
            "teamId": 1,
            "playerName": "Dinesh Nambisan",
            "playerJersey": 2,
            "turnovers": 3
            ] as AnyObject,
        [
            "teamId": 2,
            "playerName": "Arnold Oscar",
            "playerJersey": 3,
            "turnovers": 5
            ] as AnyObject,
        [
            "teamId": 2,
            "playerName": "Kevin Kirby",
            "playerJersey": 4,
            "turnovers": 7
            ] as AnyObject,
        [
            "teamId": 4,
            "playerName": "Sanjay Sansom",
            "playerJersey": 5,
            "turnovers": 2
            ] as AnyObject,
        [
            "teamId": 4,
            "playerName": "Raj Rouben",
            "playerJersey": 6,
            "turnovers": 8
            ] as AnyObject,
        [
            "teamId": 1,
            "playerName": "Andy Lee",
            "playerJersey": 7,
            "turnovers": 2
            ] as AnyObject,
        [
            "teamId": 2,
            "playerName": "Xue Wang",
            "playerJersey": 2,
            "turnovers": 9
            ] as AnyObject,
        [
            "teamId": 1,
            "playerName": "Joyce Chu",
            "playerJersey": 9,
            "turnovers": 11
            ] as AnyObject,
        [
            "teamId": 4,
            "playerName": "Maha Almenier",
            "playerJersey": 12,
            "turnovers": 3
            ] as AnyObject,
        [
            "teamId": 2,
            "playerName": "Jason Emilar",
            "playerJersey": 12,
            "turnovers": 1
            ] as AnyObject
    ]
    
    static let matches: [AnyObject] = [
        [
            "home": 1,
            "away": 2
            ] as AnyObject,
        [
            "home": 1,
            "away": 3
            ] as AnyObject,
        [
            "home": 2,
            "away": 3
            ] as AnyObject
    ]
}
