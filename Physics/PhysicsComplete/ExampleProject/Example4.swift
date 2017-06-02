//
//  Example4.swift
//  ExampleProject
//
//  Created by James Tyner on 5/25/17.
//  Copyright © 2017 James Tyner. All rights reserved.
//

import UIKit
import SpriteKit

class Example4: SKScene {
    
    let goBackLabel = SKLabelNode(text: "GO BACK")
    let player = SKSpriteNode(imageNamed: "enemy1")
    
    override func didMove(to view: SKView) {
        
        goBackLabel.position = CGPoint(x: size.width/2, y: size.height/2)
        goBackLabel.name = "goback"
        addChild(goBackLabel)
        
        player.physicsBody = SKPhysicsBody(texture: player.texture!, size: player.size)
        player.position = CGPoint(x: size.width/2 , y: size.height - player.size.height)
        addChild(player)
        
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
