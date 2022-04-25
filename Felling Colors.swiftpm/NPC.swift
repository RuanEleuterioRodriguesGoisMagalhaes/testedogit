import SwiftUI
import SpriteKit

class NPCNOde: SKNode{
    let sprite: SKSpriteNode
    
    override init() {
            self.sprite = SKSpriteNode(imageNamed: "NPC1")
            super.init()
        self.sprite.name = "sprite"
            self.addChild(sprite)
        }
    required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    public func Animation(){
        sprite.run(.repeatForever(.animate(with: .init(withFormat: "NPC%@", range: 1...2), timePerFrame: 0.3)))
    }
    
}
