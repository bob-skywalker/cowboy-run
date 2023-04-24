# Mighty Ninja Run
[Mighty Ninja Run](https://apps.apple.com/us/app/mighty-ninja-run/id1666743843) a platform video game for iOS. The player controls our mighty ninja as he automatically run across the screen while timing jumps to collect coins and dodge lethal enemies.

The player's end goal is to steer our mighty ninja safely across the level and reach the end of the line. Player can also activate double jump techniques by quickly tapping the screen twice to make the character jump higher. The player can tap and interact with varies objects to either collect them and become more powerful or jump to avoid them if they are enemies. Let's get into business and see how many coins you can collect, compete with your friends and family!

**Key Features:**

* Utilizing SpriteKit Framework to build the world and its physics and object collision logics

* Control our mighty ninja to jump and collect coins as he goes across the map

* Automatically update player's high score after each completion of the game

* collision detector logic - based on bitmasks of various objects to determine which object is collided with the player, if it's collectibles then the player collects them. and if they are enemies, the player dies

## Technologies, Libraries, APIs

* SpriteKit Framework 

* Custom Physics Helper, Object helper, Cocoa touch class 

* UIKit, MVC design pattern, Delegate Protocol, Swift struct, Object Oriented Programming.

* Inheritance, SKSpriteNode, SKSprite Animation, SKSprite Action, etc..

**Front-end:**

* Swift

* UIKit

* Swift Struct

* Computed Properties

* StoryBoard

* SpriteKit

* Swift Delegate Pattern

**Module Bundler** 

* UIKit 

* SpriteKit

# Aplication Preview

## Mighty Ninja Run Layout

![Clime8 Layout](https://i.postimg.cc/FsvGDxys/Untitled-design-2.png)

## Code Snippet

**Swift Dynamic rendering of game background layer** 
```swift
  
func createLayers(){
        worldLayer = Layer()
        worldLayer.zPosition = GameConstants.ZPositions.worldZ
        addChild(worldLayer)
        worldLayer.layerVelocity = CGPoint(x: -200.0, y: 0.0)
        
        backgroundLayer = RepeatingLayer()
        backgroundLayer.zPosition = GameConstants.ZPositions.farBGZ
        addChild(backgroundLayer)
        
        for i in 0...1{
            let backgroundImage = SKSpriteNode(imageNamed: GameConstants.StringConstants.worldBackgroundNames[world])
            backgroundImage.name = String(i)
            backgroundImage.scale(to: frame.size, width: false, multiplier: 1.0)
            backgroundImage.anchorPoint = CGPoint.zero
            backgroundImage.position = CGPoint(x: 0.0 + CGFloat(i) * backgroundImage.size.width, y: 0.0)
            backgroundLayer.addChild(backgroundImage)
        }
        backgroundLayer.layerVelocity = CGPoint(x: -100.0, y: 0.0)
        
        load(level: levelKey)
        
        if world == 1 {
            
            foregroundLayer = RepeatingLayer()
            foregroundLayer.zPosition = GameConstants.ZPositions.hudZ
            addChild(foregroundLayer)
            
            for i in 0...1{
                let foregroundImage = SKSpriteNode(imageNamed: GameConstants.StringConstants.foregroundLayer)
                foregroundImage.name = String(i)
                foregroundImage.scale(to: frame.size, width: false, multiplier: 1 / 15)
                foregroundImage.anchorPoint = CGPoint.zero
                foregroundImage.position = CGPoint(x: 0.0 + CGFloat(i) * foregroundImage.size.width, y: -0.6 * foregroundImage.size.height)
                foregroundLayer.addChild(foregroundImage)
                
            }
            foregroundLayer.layerVelocity = CGPoint(x: -300, y: 0.0)
        }
    }
```
