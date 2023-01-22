//
//  SoundPlayer.swift
//  cowboy run
//
//  Created by bo zhong on 1/19/23.
//

import SpriteKit

class SoundPlayer{
    
    let buttonSound = SKAction.playSoundFileNamed("button", waitForCompletion: false)
    let coinSound = SKAction.playSoundFileNamed("coin", waitForCompletion: false)
    let completedSound = SKAction.playSoundFileNamed("completed", waitForCompletion: false)
    let gameoverSound = SKAction.playSoundFileNamed("gameover", waitForCompletion: false)
    let powerupSound = SKAction.playSoundFileNamed("powerup", waitForCompletion: false)
    
}
