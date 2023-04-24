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

**Swift Async fetch from Unsplash API server** 
```swift
  
struct PhotoManager{
    var delegate: PhotoManagerDelegate?
    
    let photoURL =
    "https://api.unsplash.com/search/photos?client_id=Pa7ds2qwm2k0cqOa4FALgC4fKya3isGxtlx7lB7h0PI"
    
    func fetchPhotos(cityName: String){
        let replaced = cityName.replacingOccurrences(of: " ", with: "+", options: .literal, range: nil)
        let urlString = "\(photoURL)&query=\(replaced)"
        performImageRequest(with: urlString)
    }
    
    func performImageRequest(with urlString: String){
        if let url = URL(string: urlString){
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data: Data?, response: URLResponse?, error: Error?) in
                if error != nil{
                    self.delegate?.didFailWithPhotoError(error: error!)
                    return
                }
                if let safeData = data {
                    if let photo = self.parsePhotoJSON(safeData){
                        self.delegate?.didUpdatePhoto(self, photo: photo)
                    }
                }
            }
            task.resume()
        }
    }
    
    func parsePhotoJSON(_ photoData: Data) -> PhotoModel? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(PhotoData.self, from: photoData)
            if decodedData.results.count == 0 {
                print("no data loaded")
                return PhotoModel(photoURL: "https://i.postimg.cc/5y5kyB10/CITY-NOT-FOUND-1.png")
            }
            let photoURL = decodedData.results[0].urls.regular
            let photo = PhotoModel(photoURL: photoURL)
            return photo
            

        } catch {
            self.delegate?.didFailWithPhotoError(error: error)
            return nil
        }
    }
}
```
