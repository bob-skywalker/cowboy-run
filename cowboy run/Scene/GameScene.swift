//
//  GameScene.swift
//  cowboy run
//
//  Created by bo zhong on 1/11/23.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var mapNode: SKNode!
    var tileMap: SKTileMapNode!
    
    override func didMove(to view: SKView) {
        load(level: "Level_0-1")
    }
    
    func load(level: String){
        if let levelNode = SKNode.unarchiveFromFile(file: level){
            mapNode = levelNode
            addChild(mapNode)
            loadTileMap()
        }
    }
    
    func loadTileMap() {
        if let groundTiles = mapNode.childNode(withName: "Ground Tiles") as? SKTileMapNode{
            tileMap = groundTiles
            tileMap.scale(to: frame.size, width: false, multiplier: 1.0)
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        
    }
}


