import SpriteKit
import GameplayKit

class Level3: SKScene, SKPhysicsContactDelegate {
    
    let entrance = SKSpriteNode(imageNamed: "entrance")
   let platform = SKSpriteNode(imageNamed: "platform")
    let exit = SKSpriteNode(imageNamed: "exit")
    
   
    
    var timeOfLastUpdate:TimeInterval = 0
    var dt: TimeInterval = 0
    
    override func didMove(to view: SKView) {
        // THE GAME SCENE
        // ---------------------
        // set the physics properties of this world
        
        
        // set boundaries around the scene
        self.physicsBody = SKPhysicsBody(edgeLoopFrom: self.frame)
        
        
        // SPRITES
        // ---------------------
        entrance.position = CGPoint(x:self.size.width*0.25, y:self.size.height/2)
        platform.position = CGPoint(x:self.size.width/2, y:self.size.height/2)
        exit.position = CGPoint(x:self.size.width*0.75, y:self.size.height/2)
        
        // add physics to circle
        entrance.physicsBody = SKPhysicsBody(circleOfRadius: entrance.size.width / 2)
        self.entrance.physicsBody?.affectedByGravity = false
        
        // add physics to square
        self.platform.physicsBody = SKPhysicsBody(rectangleOf:self.platform.frame.size)
        
        // add physics to triangle
        self.exit.physicsBody = SKPhysicsBody(rectangleOf:self.exit.frame.size)
        
        self.exit.physicsBody?.affectedByGravity = false
        
     
      
        addChild(entrance)
        addChild(platform)
        addChild(exit)
       
    }
    func spawnSand() {
        let sand = SKSpriteNode(imageNamed:"sand")
        
        // put sand at a random (x,y) position
        let x = self.size.width/2
        let y = self.size.height - 100
        sand.position.x = x
        sand.position.y = y
        
        // add physics
        sand.physicsBody = SKPhysicsBody(circleOfRadius: sand.size.width / 2)
        self.entrance.physicsBody?.affectedByGravity = true
        
        addChild(sand)
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // make new sand every 10ms
        self.dt = currentTime - timeOfLastUpdate
        
        
       
        if (self.dt >= 2) {
            timeOfLastUpdate = currentTime
            self.spawnSand()
        }
        
        
        // MARK: Switch Levels
       
        
        //if (node.name == "nextLevelButton") {
            let scene = SKScene(fileNamed:"Level1")
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
