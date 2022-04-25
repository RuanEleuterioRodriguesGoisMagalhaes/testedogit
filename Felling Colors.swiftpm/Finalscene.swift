import SwiftUI
import SpriteKit

public class Finalscene: SKScene{
    
    var nextScene: (() -> Void)! = nil
 
    var NPC:NPCNOde?
    var Ballon:BallonNode?
    public override func didMove(to view: SKView) {
        super.didMove(to: view)
        nextScene = {
            let scene = StartScene(size:  view.bounds.size)
            view.presentScene(scene)
        }
        
    }
    
   public override func sceneDidLoad() {
        super.sceneDidLoad()
        backgroundColor = .white
        self.NPC = NPCNOde()
        self.NPC?.position.x = 150
        self.NPC?.position.y = 300
        self.NPC?.setScale(0.5)
        self.addChild(self.NPC!)
        i = 0
         
        NPC?.Animation()
       let talk = SKSpriteNode(imageNamed: "taptotalk")
       self.addChild(talk)
       talk.position = CGPoint(x: 400, y: 20)
       talk.setScale(2)
    
       
    }
   
    override public func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
      
       
        self.Ballon?.label?.isHidden = true
        let finalbutton = ButtonNode(image: .init(imageNamed: "homebutton")){
               self.nextScene()
        }
        self.addChild(finalbutton)
        self.Ballon?.label?.isHidden = true
        self.Ballon = BallonNode(image:.init(imageNamed: "Ballon"), label: .init(text:FinalText[i]))
        self.addChild(self.Ballon!)
        self.Ballon?.image?.position = CGPoint(x: 410, y: 490)
        self.Ballon?.label?.position = CGPoint(x: 335, y: 470)
        i = i + 1
      
       
        finalbutton.position = CGPoint(x: 400, y: 300)
        finalbutton.isHidden = true
        
        if i == 5{
            finalbutton.isHidden = false
            i = 0
         
        }
        
        
        
        
        
    

}
}
