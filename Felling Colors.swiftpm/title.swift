import SpriteKit

public class LineNode: SKNode {
    
    var title: SKLabelNode
    var subtitle: SKLabelNode
    
    public init(title: String, subtitle: String) {
        self.title = SKLabelNode(text: title)
        self.subtitle = SKLabelNode(text: subtitle)
        super.init()
        
        self.title.fontSize = 130
        self.title.verticalAlignmentMode = .center
        self.title.setScale(0.7)
        self.title.fontName = "Baskerville Bold Italic"
        self.title.fontColor = .black
        self.addChild(self.title)
        
        
        self.subtitle.fontSize = 130
        self.subtitle.verticalAlignmentMode = .center
        self.subtitle.setScale(0.7)
        self.subtitle.fontName = "Baskerville Bold Italic"
        self.subtitle.position.y -= 80
        self.subtitle.fontColor = .black
        self.addChild(self.subtitle)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}



