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
        if (self.y == (game.sizeY-1)){
            self.subview.frame.origin.y = 0
            self.y = 0
        }else{
            self.subview.frame.origin.y += CGFloat(game.heightCell!)
            self.y! += 1
        }
    }
    
    func goUp(game: Game) {
        if (self.y == 0){
            self.subview.frame.origin.y = CGFloat((game.sizeY! - 1) * game.heightCell!)
            self.y = game.sizeY-1
        }else{
            self.subview.frame.origin.y -= CGFloat(game.heightCell!)
            self.y! -= 1
        }
    }
    
    func goRight(game: Game) {
        if (self.x == (game.sizeX-1)) {
            self.subview.frame.origin.x = 0
            self.x = 0
        } else {
            self.subview.frame.origin.x += CGFloat(game.widthCell!)
            self.x! += 1
        }
     }
    
    func goLeft(game: Game) {
        if (self.x == 0) {
            self.subview.frame.origin.x = CGFloat(game.widthCell!*(game.sizeX!-1))
            self.x! = game.sizeX-1
        } else {
            self.subview.frame.origin.x -= CGFloat(game.widthCell!)
            self.x! -= 1
        }
    }
}
