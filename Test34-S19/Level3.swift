import SpriteKit
import GameplayKit

class Level3: SKScene {
    
    let lemming = SKSpriteNode(imageNamed: "lemming")
  
    
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
       lemming.position = CGPoint(x:self.size.width*0.25, y:self.size.height/2)
        //square.position = CGPoint(x:self.size.width/2, y:self.size.height/2)
        //triangle.position = CGPoint(x:self.size.width*0.75, y:self.size.height/2)
        
        // add physics to circle
        lemming.physicsBody = SKPhysicsBody(circleOfRadius: lemming.size.width / 2)
        self.lemming.physicsBody?.affectedByGravity = false
        
        // add physics to square
       // self.square.physicsBody = SKPhysicsBody(rectangleOf:self.square.frame.size)
        
        // add physics to triangle
       // self.triangle.physicsBody = SKPhysicsBody(rectangleOf:self.triangle.frame.size)
        
       //
        // add L
        //self.lshape.name = "shape"
       // self.lshape.position = CGPoint(x: self.size.width * 0.5,
                                //       y: self.size.height * 0.75)
       // self.lshape.physicsBody = SKPhysicsBody(texture: self.lshape.texture!, size: self.lshape.size)
        
        addChild(lemming)
        
    }
    func spawnlemming() {
        let lemming = SKSpriteNode(imageNamed:"lemming")
        
        // put sand at a random (x,y) position
        let x = self.size.width/2
        let y = self.size.height - 100
        lemming.position.x = x
        lemming.position.y = y
        
        // add physics
        lemming.physicsBody = SKPhysicsBody(circleOfRadius: lemming.size.width / 2)
        self.lemming.physicsBody?.affectedByGravity = true
        
        addChild(lemming)
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // make new sand every 10ms
        self.dt = currentTime - timeOfLastUpdate
        if (self.dt >= 0.1) {
            timeOfLastUpdate = currentTime
            self.spawnlemming()
        }
        
        
    }
}

