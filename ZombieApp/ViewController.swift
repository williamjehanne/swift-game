//
//  ViewController.swift
//  ZombieApp
//
//  Created by William JEHANNE on 09/12/2015.
//  Copyright © 2015 William JEHANNE. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lifeLabel: UILabel!
    @IBOutlet weak var boardView: UIView!
    @IBOutlet weak var myLabel: UILabel!
    var player:Player!
    var game:Game!
    var currentSpawnTime:Int? = 0
    var zombies:[Zombie] = []
    var index:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let bounds = boardView.frame
        let heightScreen    = Int(bounds.height)
        let widthScreen     = Int(bounds.width)

        self.game = Game(sizeX:12, sizeY:16, levelHealthStart:10, rateSpawn:5)
        self.lifeLabel.text = String(self.game.levelHealthStart)
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
            
            self.player?.subview.backgroundColor = UIColor(hexString: self.player.color)
            
            if (self.currentSpawnTime == self.game?.rateSpawn) {
                self.currentSpawnTime = 0
                createZombie()
            }
            
            index = 0
            
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
            
            for z in self.zombies {
                let lower : UInt32 = 0
                let upper : UInt32 = 4
                let randomNumber = arc4random_uniform(upper - lower) + lower
                
                if(z.x==self.player?.x && z.y == self.player?.y && z.isActive == true) {
                    self.player?.health! -= 1
                    self.lifeLabel.text = String(self.player.health)
                    z.subview.removeFromSuperview()
                    z.isActive = false
                    self.player?.subview.backgroundColor = UIColor.redColor()
                }
                
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
                
                if(z.x==self.player?.x && z.y == self.player?.y && z.isActive == true) {
                    self.player?.health! -= 1
                    self.lifeLabel.text = String(self.player.health)
                    z.subview.removeFromSuperview()
                    z.isActive = false
                    self.player?.subview.backgroundColor = UIColor.redColor()
                }
                index += 1;
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

