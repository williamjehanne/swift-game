//
//  ViewController.swift
//  ZombieApp
//
//  Created by William JEHANNE on 09/12/2015.
//  Copyright © 2015 William JEHANNE. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var boardView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let bounds = boardView.frame
        let heightScreen    = Int(bounds.height)
        let widthScreen     = Int(bounds.width)
        
        print("widthScreen \(widthScreen)")
        print("heightScreen \(heightScreen)")

        let game : Game     = Game(sizeX:20, sizeY:16, levelHealthStart:10, rateSpawn:5)
        let player : Player = Player(health: game.levelHealthStart, x:6, y:0, name:"William")
        
        game.setCalculateSizeCell(widthScreen, height: heightScreen)
       
        player.drawCharacter(boardView, game: game)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

