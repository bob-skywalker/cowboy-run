//
//  GameViewController.swift
//  cowboy run
//
//  Created by bo zhong on 1/11/23.
//

import UIKit
import SpriteKit
import AVFoundation

var backgroundMusicPlayer: AVAudioPlayer!

var avPlayer: AVPlayer!
var avPlayerLayer: AVPlayerLayer!
var paused: Bool = false



class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        presentMenuScene()
        startBackgroundMusic()
        playVideoBackground()
    }
    
    func startBackgroundMusic(){
        let path = Bundle.main.path(forResource: "background", ofType: "wav")
        let url = URL(fileURLWithPath: path!)
        backgroundMusicPlayer = try! AVAudioPlayer(contentsOf: url)
        backgroundMusicPlayer.numberOfLoops = -1
        backgroundMusicPlayer.play()
    }
    
    
    func playVideoBackground(){
        guard let path = Bundle.main.path(forResource: "MenuBackground", ofType: "mp4") else {
            return
        }
        let player = AVPlayer(url: URL(fileURLWithPath: path))
        let playerLayer = AVPlayerLayer(player: player)
        playerLayer.frame = self.view.bounds
        playerLayer.videoGravity = .resizeAspectFill
        
        player.play()
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
