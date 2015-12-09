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
    var subview:UIView!
    
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
        
        self.subview = UIView(frame: rectCharacter)
        self.subview.backgroundColor = UIColor.redColor()
        
        view.addSubview(self.subview)
    }
    
    func goDown(game: Game) {
        self.subview.frame.origin.y += CGFloat(game.heightCell!)
    }
    
    func goUp(game: Game) {
        self.subview.frame.origin.y -= CGFloat(game.heightCell!)
    }
    
    func goRight(game: Game) {
        self.subview.frame.origin.x += CGFloat(game.widthCell!)
    }
    
    func goLeft(game: Game) {
        self.subview.frame.origin.x -= CGFloat(game.widthCell!)
    }
}
