//
//  GameConstants.swift
//  cowboy run
//
//  Created by Bo Zhong on 1/15/23.
//

import Foundation
import CoreGraphics

struct GameConstants{
    
    struct ZPositions{
        static let farBGZ: CGFloat = 0
        static let closeBGZ: CGFloat = 1
        static let worldZ: CGFloat = 2
        static let objectZ: CGFloat = 3
        static let playerZ: CGFloat = 4
        static let hudZ: CGFloat = 5 
    }
    
    struct StringConstants{
        static let groundTilesName = "Ground Tiles"
        static let worldBackgroundNames = ["DesertBackground", "GrassBackground"]
        static let playerName = "Player"
        static let playerImageName = "Idle_0"
    }
    
    
}
