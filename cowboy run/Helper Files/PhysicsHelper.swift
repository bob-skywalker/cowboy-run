//
//  PhysicsHelper.swift
//  cowboy run
//
//  Created by Bo Zhong on 1/15/23.
//

import SpriteKit

class PhysicsHelper{
    static func addPhysicsBody(to sprite: SKSpriteNode, with name: String){
        switch name {
        case GameConstants.StringConstants.playerName:
            sprite.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: sprite.size.width / 2, height: sprite.size.height))
            sprite.physicsBody!.restitution = 0.0
            sprite.physicsBody!.allowsRotation = false
        default:
            sprite.physicsBody = SKPhysicsBody(rectangleOf: sprite.size)
        }
    }
}
