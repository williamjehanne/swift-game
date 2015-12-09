//
//  Character.swift
//  ZombieApp
//
//  Created by William JEHANNE on 09/12/2015.
//  Copyright © 2015 William JEHANNE. All rights reserved.
//

import Foundation
import UIKit

class Character {
    var x: Int!
    var y: Int!
    var color:String!
    
    init(x:Int, y:Int, color:String) {
        self.color = color
        self.x = x
        self.y = y
    }
    
    func drawCharacter(view: UIView, game:Game) {
        let positionX = self.x*game.widthCell!
        let positionY = self.y*game.heightCell!
        
        print("positionX\(positionX)")
        print("positionY\(positionY)")
        
        let rectCharacter:CGRect = CGRect(x:positionX, y:positionY, width:game.widthCell!, height:game.heightCell!)
        
        let m:UIView = UIView(frame: rectCharacter)
        m.backgroundColor = UIColor.redColor()
        
        view.addSubview(m)
    }
}
