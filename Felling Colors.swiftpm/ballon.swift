import SwiftUI
import SpriteKit

public class BallonNode: SKNode{
    
    var image: SKSpriteNode?
    var label: SKLabelNode?
   
    
    init(image:SKSpriteNode,label:SKLabelNode){
        self.image = image
        self.label = label
        super.init()
        self.addChild(label)
        self.addChild(image)
        self.image?.setScale(2.5)
        self.image?.zPosition = -3
        label.fontColor = .black
        label.fontName = "dogipixelcabold"
        label.fontSize = 25
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

