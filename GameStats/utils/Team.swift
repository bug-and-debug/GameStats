
//
//  Team.swift
//  GameStats
//
//  Created by Angular-Dev on 2/28/18.
//  Copyright © 2018 Hans. All rights reserved.
//

import UIKit

class Team:SQLTable {
    var id = -1
    var name = ""
    
    override var description:String {
        return "id: \(id), name: \(name)"
    }
}
