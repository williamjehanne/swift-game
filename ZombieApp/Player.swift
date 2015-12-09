//
//  Player.swift
//  ZombieApp
//
//  Created by William JEHANNE on 09/12/2015.
//  Copyright © 2015 William JEHANNE. All rights reserved.
//

import Foundation

class Player : Character {
    let colorPlayer:String = "#4400FF"
    var health: Int!
    var name:String!
    var score:Int!
    
    init(health:Int, x:Int, y:Int, name:String) {
        self.health = health
        self.name = name
        self.score = 0
        super.init(x:x, y:y, color:self.colorPlayer)
    }
}
