//
//  Rules.swift
//  ZombieApp
//
//  Created by William JEHANNE on 09/12/2015.
//  Copyright © 2015 William JEHANNE. All rights reserved.
//

import Foundation
import UIKit

class Game {
    var sizeX: Int!
    var sizeY: Int!
    var levelHealthStart: Int!
    var rateSpawn: Int!
    var widthCell:Int?
    var heightCell:Int?
    
    init(sizeX:Int, sizeY:Int, levelHealthStart:Int, rateSpawn:Int) {
        self.sizeX = sizeX
        self.sizeY = sizeY
        self.levelHealthStart = levelHealthStart
        self.rateSpawn = rateSpawn
    }
    
    func setCalculateSizeCell(width:Int, height:Int) {
        self.widthCell = width/self.sizeX
        self.heightCell = height/self.sizeY
        
        print("widthCell \(self.widthCell)")
        print("heightCell \(self.heightCell)")
    }
}
