//
//  SceneManagerDelegate.swift
//  cowboy run
//
//  Created by Bo Zhong on 1/18/23.
//

import Foundation

protocol SceneManagerDelegate{
    func presentLevelScene(for world: Int)
    func presentGameScene(for level: Int, in world: Int)
    func presentMenuScene()
}
