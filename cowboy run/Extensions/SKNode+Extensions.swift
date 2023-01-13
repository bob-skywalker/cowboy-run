//
//  SKNode+Extensions.swift
//  cowboy run
//
//  Created by bo zhong on 1/12/23.
//

import SpriteKit

extension SKNode{
    class func unarchiveFromFile(file: String) -> SKNode? {
        if let path = Bundle.main.path(forResource: file, ofType: "sks"){
            let url = URL(fileURLWithPath: path)
            do {
                let sceneData = try Data(contentsOf: url, options: .mappedIfSafe)
                let archiver = try NSKeyedUnarchiver(forReadingFrom: sceneData)
                archiver.setClass(self.classForKeyedUnarchiver(), forClassName: "SKScene")
                archiver.requiresSecureCoding = false
                let scene = archiver.decodeObject(forKey: NSKeyedArchiveRootObjectKey) as! SKNode
                archiver.finishDecoding()
                return scene
            } catch{
                print(error.localizedDescription)
                return nil
            }
        } else {
            return nil
        }
    }
    
    func scale(to screenSize: CGSize, width: Bool, multiplier: CGFloat){
        let scale = width ? (screenSize.width * multiplier) / self.frame.size.width : (screenSize.height * multiplier) / self.frame.size.height
        self.setScale(scale)
    }
    
    
    func turnGravity(on value: Bool){
        physicsBody?.affectedByGravity = value
    }
    
    
    func createUserData(entry: Any, forKey key: String) {
        if userData == nil{
            let userDataDictionary = NSMutableDictionary()
            userData = userDataDictionary
        }
        
        userData?.setValue(entry, forKey: key)
    }
}


