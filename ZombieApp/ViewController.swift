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
    @IBOutlet weak var myLabel: UILabel!
    var player:Player!
    var game:Game!
    var currentSpawnTime:Int? = 0
    var zombies:[Zombie] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let bounds = boardView.frame
        let heightScreen    = Int(bounds.height)
        let widthScreen     = Int(bounds.width)
        
        print("widthScreen \(widthScreen)")
        print("heightScreen \(heightScreen)")

        self.game = Game(sizeX:12, sizeY:16, levelHealthStart:10, rateSpawn:4)
        self.player = Player(health: game.levelHealthStart, x:11, y:0, name:"William")
        
        game.setCalculateSizeCell(widthScreen, height: heightScreen)
        player.drawCharacter(boardView, game: game)
        
        myLabel.text = String(0)
        listenerGesture()
    }
    
    func listenerGesture() {
        let swipeRight = UISwipeGestureRecognizer(target: self, action: "respondToSwipeGesture:")
        swipeRight.direction = UISwipeGestureRecognizerDirection.Right
        self.view.addGestureRecognizer(swipeRight)
        
        let swipeDown = UISwipeGestureRecognizer(target: self, action: "respondToSwipeGesture:")
        swipeDown.direction = UISwipeGestureRecognizerDirection.Down
        self.view.addGestureRecognizer(swipeDown)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: "respondToSwipeGesture:")
        swipeLeft.direction = UISwipeGestureRecognizerDirection.Left
        self.view.addGestureRecognizer(swipeLeft)
        
        let swipeUp = UISwipeGestureRecognizer(target: self, action: "respondToSwipeGesture:")
        swipeUp.direction = UISwipeGestureRecognizerDirection.Up
        self.view.addGestureRecognizer(swipeUp)
    }
    
    func createZombie() {
        let z:Zombie = Zombie(x:11, y:2, name:"Zombie")
        z.drawCharacter(boardView, game: self.game)
        self.zombies.append(z)
    }
    
    func respondToSwipeGesture(gesture: UIGestureRecognizer) {
        
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            self.player!.score! += 1
            self.currentSpawnTime? += 1
            
            if (self.currentSpawnTime == self.game?.rateSpawn) {
                self.currentSpawnTime = 0
                createZombie()
            }
            
            for z in self.zombies {
            
                let lower : UInt32 = 0
                let upper : UInt32 = 4
                let randomNumber = arc4random_uniform(upper - lower) + lower
                
                switch randomNumber {
                    case 0:
                        z.goRight(self.game)
                    case 1:
                        z.goLeft(self.game)
                    case 2:
                        z.goDown(self.game)
                    case 3:
                        z.goUp(self.game)
                    default:
                        break
                }
                
            }
            
            myLabel.text = String(self.player!.score)
            
            switch swipeGesture.direction {
            case UISwipeGestureRecognizerDirection.Right:
                player.goRight(self.game)
            case UISwipeGestureRecognizerDirection.Down:
                player.goDown(self.game)
            case UISwipeGestureRecognizerDirection.Left:
                player.goLeft(self.game)
            case UISwipeGestureRecognizerDirection.Up:
                player.goUp(self.game)
            default:
                break
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

