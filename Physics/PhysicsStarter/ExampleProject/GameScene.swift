//
//  GameScene.swift
//  ExampleProject
//
//  Created by James Tyner on 5/15/17.
//  Copyright © 2017 James Tyner. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    let example1Label = SKLabelNode(text: "Example1")
    let example2Label = SKLabelNode(text: "Example2")
    let example3Label = SKLabelNode(text: "Example3")
    let example4Label = SKLabelNode(text: "Example4")
    let example5Label = SKLabelNode(text: "Example5")
    let example6Label = SKLabelNode(text: "Example6")
    let example7Label = SKLabelNode(text: "Example7")
    let example8Label = SKLabelNode(text: "Example8")
  
    
    override func didMove(to view: SKView) {
        let Labels = [example1Label,example2Label,example3Label,example4Label,example5Label,example6Label,
                      example7Label,example8Label]
        
        for i in 0 ..< Labels.count {
            Labels[i].position = CGPoint(x: size.width/2, y: CGFloat(i * 45)+25)
            Labels[i].name = String(i)
            addChild(Labels[i])
            
        }
    }

    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let Scenes = [Example1(size: size),Example2(size: size),Example3(size: size),Example4(size: size),Example5(size: size),Example6(size: size),Example7(size: size),Example8(size: size)]
        
        guard let touch = touches.first else {
            return
        }
        
        let touchLocation = touch.location(in: self)
        let touchedNode = self.atPoint(touchLocation)
        
        if(touchedNode is SKLabelNode){
            
            view?.presentScene(Scenes[Int(touchedNode.name!)!])
            
        }
    }
}


