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
        case GameConstants.StringConstants.finishLineName, GameConstants.StringConstants.enemyName, GameConstants.StringConstants.powerUpName,
            _ where GameConstants.StringConstants.superCoinName.contains(name):
            PhysicsHelper.addPhysicsBody(to: sprite, with: name)
        default:
            let component = name.components(separatedBy: NSCharacterSet.decimalDigits.inverted)
            if let rows = Int(component[0]), let cols = Int(component[1]){
                calculateGridWidth(rows: rows, cols: cols, parent: sprite)
            }
        }
    }
    
    static func calculateGridWidth(rows: Int, cols: Int, parent: SKSpriteNode){
        parent.color = UIColor.clear

        for x in 0..<cols{
            for y in 0..<rows{
                let position = CGPoint(x: x, y: y)
                addCoin(to: parent, at: position, columns: cols)
            }
        }
    }
    
    static func addCoin(to parent: SKSpriteNode, at position: CGPoint, columns: Int){
        let coin = SKSpriteNode(imageNamed: GameConstants.StringConstants.coinImageName)
        coin.size = CGSize(width: parent.size.width / CGFloat(columns), height: parent.size.width / CGFloat(columns))
        coin.name = GameConstants.StringConstants.coinName
        
        coin.position = CGPoint(x: position.x * coin.size.width + coin.size.width / 2 , y: position.y * coin.size.height + coin.size.height / 2 )
        
        let coinFrames = AnimationHelper.loadTextures(from: SKTextureAtlas(named: GameConstants.StringConstants.coinRotateAtlas), withName: GameConstants.StringConstants.coinPrefixKey)
        
        coin.run(SKAction.repeatForever(SKAction.animate(with: coinFrames, timePerFrame: 0.1)))
        
        
        PhysicsHelper.addPhysicsBody(to: coin, with: GameConstants.StringConstants.coinName)
        
        parent.addChild(coin)
    }
}
