//
//  GameViewController.swift
//  cowboy run
//
//  Created by bo zhong on 1/11/23.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        presentMenuScene()
    }
}

extension GameViewController: SceneManagerDelegate {
    func presentLevelScene(for world: Int) {
        let scene = LevelScene(size: view.bounds.size)
        scene.scaleMode = .aspectFill
        scene.world = world
        scene.sceneManagerDelegate = self
        present(scene: scene)
    }
    
    func presentGameScene(for level: Int, in world: Int) {
        let scene = GameScene(size: view.bounds.size, world: world, level: level, sceneManagerDelegate: self)
        scene.scaleMode = .aspectFill
        present(scene: scene)
    }
    
    func presentMenuScene() {
        let scene = MenuScene(size: view.bounds.size)
        scene.scaleMode = .aspectFill
        scene.sceneManagerDelegate = self
        present(scene: scene)
    }
    
    func present(scene: SKScene){
        if let view = self.view as! SKView? {
            view.presentScene(scene)
            
            
            view.ignoresSiblingOrder = true
            view.showsFPS = true
            view.showsNodeCount = true
            view.showsPhysics = true
        }
    }
    
    
}
