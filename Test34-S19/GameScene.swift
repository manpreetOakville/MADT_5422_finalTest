//
//  GameScene.swift
//  Test34-S19
//
//  Created by MacStudent on 2019-06-19.
//  Copyright © 2019 rabbit. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var nextLevelButton:SKLabelNode!
    var hair4 : SKSpriteNode!
    var hair3 : SKSpriteNode!
    var hair2 : SKSpriteNode!
    var hair1 : SKSpriteNode!
    var  lifes : SKLabelNode!
    var Names = "";
    var life = 10;
    
    override func didMove(to view: SKView) {
        print("This is level 1")
        self.nextLevelButton = self.childNode(withName: "nextLevelButton") as! SKLabelNode
        self.hair4 = self.childNode(withName: "hair1") as! SKSpriteNode
        self.hair3 = self.childNode(withName: "hair2") as! SKSpriteNode
        self.hair2 = self.childNode(withName: "hair3") as! SKSpriteNode
        self.hair1 = self.childNode(withName: "hair4") as! SKSpriteNode
        self.lifes = self.childNode(withName: "lifes") as! SKLabelNode
        lifes.text = "lifes : \(lifes)"
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        if (touch == nil) {
            return
        }
        
        let location = touch!.location(in:self)
        let node = self.atPoint(location)
    
        
        if(node.name == "hair4")
        {
            print("hair4")
        }
        
    
        
        // MARK: Switch Levels
        if (node.name == "nextLevelButton") {
            let scene = SKScene(fileNamed:"Level2")
            if (scene == nil) {
                print("Error loading level")
                return
            }
            else {
                scene!.scaleMode = .aspectFill
                view?.presentScene(scene!)
            }
        }
        
        
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesMoved(touches, with: event)
        var first = "hair4"
        
        
        for touch in touches {
            var location = touch.location(in: self)
            
            let node = self.atPoint(location)
            
            if(node.name == nil )
            {
                return
            }
            print(location)
            
            if(!Names.contains(node.name!))
            {
                Names = Names + node.name!
            }
            else
            {
                
            }
            
    
        }
        
        print("all names = \(Names)")
        if(Names == "hair1hair2hair3hair4")
        {
            print("Player wins")
            
            hair4.removeFromParent()
            
            hair4.isHidden = true;
            
            hair3.removeFromParent()
            
            hair3.isHidden = true
            
            hair2.removeFromParent()
            
            hair2.isHidden = true
            
            hair1.removeFromParent()
            
            hair1.isHidden = true
           
            
            
            let scene = SKScene(fileNamed:"Level2")
            if (scene == nil) {
                print("Error loading level")
                return
            }
            else {
                sleep(10)
                
                scene!.scaleMode = .aspectFill
                view?.presentScene(scene!)
            }
            
        }
            
        else
        {
            
            if(Names == "hair4")
            {
                
            }
            else if(Names == "hair4 hair3")
            {
                
            }
            else if(Names == "hair4 hair3 hair2")
            {
                
            }
            else if(Names == "hair4 hair3 hair2 hair1")
            {
                print("Player wins")
                
                let scene = SKScene(fileNamed:"Level2")
                if (scene == nil) {
                    print("Error loading level")
                    return
                }
                    
                else {
                    scene!.scaleMode = .aspectFill
                    view?.presentScene(scene!)
                }
                
            }
            else
            {
                self.life = life - 5
                self.lifes.text = "Lifes : \(lifes)"
                print("Lifes : \(life)")
                sleep(6)
                let scene = SKScene(fileNamed:"Level2")
                if (scene == nil) {
                    print("Error loading level")
                    return
                }
                    
                else {
                    scene!.scaleMode = .aspectFill
                    view?.presentScene(scene!)
                }
            }
            
            print("Player loses")
            
            
        }
        
    }
}
