//
//  Zombie.swift
//  ZombieApp
//
//  Created by William JEHANNE on 09/12/2015.
//  Copyright © 2015 William JEHANNE. All rights reserved.
//

import Foundation

class Zombie: Character {
    let colorZombie:String = "#A16422"
    var isActive:Bool?

    init(x:Int, y:Int, name:String) {
        super.init(x:x, y:y, color:self.colorZombie)
        self.isActive = true
    }
}
