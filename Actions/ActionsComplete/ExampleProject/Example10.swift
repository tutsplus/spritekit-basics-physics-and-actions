//
//  Example10.swift
//  ExampleProject
//
//  Created by James Tyner on 5/23/17.
//  Copyright © 2017 James Tyner. All rights reserved.
//

import UIKit
import SpriteKit
class Example10: SKScene {
    let explosion = SKSpriteNode(imageNamed: "explosion1")
    let goBackLabel = SKLabelNode(text: "GO BACK")
    override func didMove(to view: SKView) {
        explosion.position = CGPoint(x: size.width/2, y: 300)
        addChild(explosion)
        var explosionTextures:[SKTexture] = []
        
        for i in 1...6 {
            explosionTextures.append(SKTexture(imageNamed: "explosion\(i)"))
        }
    
       let explosionAnimation = SKAction.animate(with: explosionTextures,
                                           timePerFrame: 0.3)
       explosion.run(explosionAnimation)
        
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
    }
}

