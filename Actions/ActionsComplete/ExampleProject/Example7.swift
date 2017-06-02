//
//  Example7.swift
//  ExampleProject
//
//  Created by James Tyner on 5/23/17.
//  Copyright © 2017 James Tyner. All rights reserved.
//

import UIKit
import SpriteKit

class Example7: SKScene {
        let player = SKSpriteNode(imageNamed: "player")
        let goBackLabel = SKLabelNode(text: "GO BACK")
        override func didMove(to view: SKView) {
            player.position = CGPoint(x: 100, y: player.size.height)
            addChild(player)
            
            
            let fadePlayerAction = SKAction.fadeOut(withDuration: 2)
            let fadePlayerActionReversed = fadePlayerAction.reversed()
            let fadePlayerSequence = SKAction.sequence([fadePlayerAction, fadePlayerActionReversed])
            let fadeOutInRepeatAction = SKAction.repeatForever(fadePlayerSequence)
            player.run(fadeOutInRepeatAction)
            
            goBackLabel.position = CGPoint(x: size.width/2, y: size.height/2)
            goBackLabel.name = "goback"
            addChild(goBackLabel)        }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        player.removeAllActions()
        
        guard let touch = touches.first else {
            return
        }
        
        let touchLocation = touch.location(in: self)
        let touchedNode = self.atPoint(touchLocation)
        
        if(touchedNode.name == "goback"){
            
            let gameScene = GameScene(size: size)
            view?.presentScene(gameScene)
        }
    }
    
}
