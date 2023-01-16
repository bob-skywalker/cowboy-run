//
//  AnimationHelper.swift
//  cowboy run
//
//  Created by Bo Zhong on 1/16/23.
//

import SpriteKit

class AnimationHelper{
    
    static func loadTextures(from atlas: SKTextureAtlas, withName name:String) -> [SKTexture] {
        var textures = [SKTexture]()
        for index in 0..<atlas.textureNames.count {
            let textureName = name + String(index)
            textures.append(atlas.textureNamed(textureName))
        }
        
        return textures
    }
    
}
