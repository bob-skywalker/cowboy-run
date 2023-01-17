//
//  ObjectHelper.swift
//  cowboy run
//
//  Created by bo zhong on 1/16/23.
//

import SpriteKit

class ObjectHelper{
    
    static func handleChild(sprite: SKSpriteNode, with name: String) {
        switch name {
        case GameConstants.StringConstants.finishLineName, GameConstants.StringConstants.enemyName:
            PhysicsHelper.addPhysicsBody(to: sprite, with: name)
        default:
            break
        }
    }
}
