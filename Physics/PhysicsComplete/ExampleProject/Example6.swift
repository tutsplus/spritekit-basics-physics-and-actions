//
//  Example7.swift
//  ExampleProject
//
//  Created by James Tyner on 5/26/17.
//  Copyright © 2017 James Tyner. All rights reserved.
//

import UIKit
import SpriteKit
class Example6: SKScene {
    let goBackLabel = SKLabelNode(text: "GO BACK")
    let player = SKSpriteNode(imageNamed: "enemy1")
    override func didMove(to view: SKView) {
        
        goBackLabel.position = CGPoint(x: size.width/2, y: size.height/2)
        goBackLabel.name = "goback"
        addChild(goBackLabel)
        
        player.physicsBody = SKPhysicsBody(texture: player.texture!, size: player.size)
        player.physicsBody?.allowsRotation = false
        player.physicsBody?.restitution = 0.0
        player.name = "player"
        player.position = CGPoint(x: size.width/2 , y: size.height - player.size.height)
        addChild(player)
        
        
        let rectangle = SKSpriteNode(color: .blue, size: CGSize(width: size.width, height: 20))
        rectangle.physicsBody = SKPhysicsBody(rectangleOf: rectangle.size)
        rectangle.zRotation = 3.14 * 220 / 180
        rectangle.physicsBody?.isDynamic = false
        rectangle.physicsBody?.friction = 0.0
        rectangle.position = CGPoint(x: size.width/2, y: size.width/2)
        addChild(rectangle)
        
        physicsWorld.gravity = CGVector(dx:0, dy: 0)
        physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        
        guard let touch = touches.first else {
            return
        }
        
        let touchLocation = touch.location(in: self)
        let touchedNode = self.atPoint(touchLocation)
        
        if(touchedNode.name == "goback"){
            
            let gameScene = GameScene(size: size)
            view?.presentScene(gameScene)
        }
 
        physicsWorld.gravity = CGVector(dx:0 , dy: -9.8)
    }
    
   
}
