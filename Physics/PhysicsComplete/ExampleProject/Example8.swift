//
//  Example8.swift
//  ExampleProject
//
//  Created by James Tyner on 5/27/17.
//  Copyright © 2017 James Tyner. All rights reserved.
//
import UIKit
import SpriteKit
class Example8: SKScene,SKPhysicsContactDelegate{
    let goBackLabel = SKLabelNode(text: "GO BACK")
    let player = SKSpriteNode(imageNamed: "enemy1")
    var dx = -20
    var dy = -20
    override func didMove(to view: SKView) {
        
        goBackLabel.position = CGPoint(x: size.width/2, y: 800)
        goBackLabel.name = "goback"
        addChild(goBackLabel)
        
        player.physicsBody = SKPhysicsBody(texture: player.texture!, size: player.size)
        player.physicsBody?.allowsRotation = false
        player.physicsBody?.restitution = 0.0
        player.physicsBody?.categoryBitMask = PhysicsCategories.Player
        player.physicsBody?.contactTestBitMask = PhysicsCategories.RedBall
        player.physicsBody?.collisionBitMask = PhysicsCategories.EdgeLoop
        player.position = CGPoint(x: size.width/2 , y: size.height - player.size.height)
        addChild(player)
        player.physicsBody?.applyImpulse(CGVector(dx: dx, dy: dy))
        
        
        let redBall = SKShapeNode(circleOfRadius: 100)
        redBall.fillColor = SKColor.red
        redBall.position = CGPoint(x: size.width/2, y: size.height/2)
        redBall.physicsBody = SKPhysicsBody(circleOfRadius: 100)
        redBall.physicsBody?.isDynamic = false
        redBall.physicsBody?.categoryBitMask = PhysicsCategories.RedBall
        addChild(redBall)
        
        physicsWorld.gravity = CGVector(dx:0, dy: 0)
        physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
        physicsWorld.contactDelegate = self
        physicsBody?.categoryBitMask = PhysicsCategories.EdgeLoop
       physicsBody?.contactTestBitMask = PhysicsCategories.Player
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

    func didBegin(_ contact: SKPhysicsContact) {
        var firstBody: SKPhysicsBody
        var secondBody: SKPhysicsBody
        
        if(contact.bodyA.categoryBitMask < contact.bodyB.categoryBitMask){
            firstBody = contact.bodyA
            secondBody = contact.bodyB
        }else{
            firstBody = contact.bodyB
            secondBody = contact.bodyA
        }
        
        if((firstBody.categoryBitMask & PhysicsCategories.Player != 0) && (secondBody.categoryBitMask & PhysicsCategories.RedBall != 0)){
            print("Player and RedBall Contact")
      
        }
        
        if((firstBody.categoryBitMask & PhysicsCategories.Player != 0) && (secondBody.categoryBitMask & PhysicsCategories.EdgeLoop != 0)){
            print ("Player and EdgeLoop Contact")
            dx *= -1
            dy *= -1
            player.physicsBody?.applyImpulse(CGVector(dx: dx, dy: dy))
        }
    }
}
