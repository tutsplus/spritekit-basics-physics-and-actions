//
//  Example1.swift
//  ExampleProject
//
//  Created by James Tyner on 5/23/17.
//  Copyright © 2017 James Tyner. All rights reserved.
//

import UIKit
import SpriteKit
class Example1: SKScene {
    let player = SKSpriteNode(imageNamed: "player")
    let goBackLabel = SKLabelNode(text: "GO BACK")
    
    override func didMove(to view: SKView) {
        player.position = CGPoint(x: 200, y: player.size.height)
        addChild(player)
        
        let movePlayerAction = SKAction.moveTo(y: 900, duration: 2)
        player.run(movePlayerAction)
        
        goBackLabel.position = CGPoint(x: size.width/2, y: size.height/2)
        goBackLabel.name = "goback"
        addChild(goBackLabel)
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
    }}
