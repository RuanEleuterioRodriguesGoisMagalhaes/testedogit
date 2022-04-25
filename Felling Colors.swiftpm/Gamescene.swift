import SwiftUI
import SpriteKit

public class Gamescene: SKScene{
    
    var nextScene: (() -> Void)! = nil
    var SadScene: (() -> Void)! = nil
    var HappyScene: (() -> Void)! = nil
    var LoveScene: (() -> Void)! = nil
    var NPC:NPCNOde?
    var Ballon:BallonNode?
    public override func didMove(to view: SKView) {
        super.didMove(to: view)
        SadScene = {
            let scene = Sadscene(size:  view.bounds.size)
            view.presentScene(scene)
            
        }
        HappyScene = {
            let scene = Happyscene(size:  view.bounds.size)
            view.presentScene(scene)
        }
        
        LoveScene = {
            let scene = Lovescene(size:  view.bounds.size)
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
        NPC?.Animation()
       let talk = SKSpriteNode(imageNamed: "taptotalk")
       self.addChild(talk)
       talk.position = CGPoint(x: 400, y: 20)
       talk.setScale(2)
    
    }
   
    override public func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.Ballon?.label?.isHidden = true
    
        
        let Sadbutton = ButtonNode(image: .init(imageNamed: "SadButton")){
               self.SadScene()
        }
        
        let Happybutton = ButtonNode(image: .init(imageNamed: "HappyButton")){
               
             self.HappyScene()
        
        }
        
        let Lovebutton = ButtonNode(image: .init(imageNamed: "LoveButton")){
            
            self.LoveScene()
        }
        
        self.addChild(Sadbutton)
        self.addChild(Happybutton)
        self.addChild(Lovebutton)
        self.Ballon?.label?.isHidden = true
        self.Ballon = BallonNode(image:.init(imageNamed: "Ballon"), label: .init(text:Text[i]))
        self.addChild(self.Ballon!)
        self.Ballon?.image?.position = CGPoint(x: 410, y: 490)
        self.Ballon?.label?.position = CGPoint(x: 335, y: 470)
        i = i + 1
      
        Sadbutton.position = CGPoint(x: 400, y: 300)
        Happybutton.position = CGPoint(x: 550, y: 300)
        Lovebutton.position = CGPoint(x: 700, y: 300)
        Sadbutton.isHidden = true
        Happybutton.isHidden = true
        Lovebutton.isHidden = true
        
        if i == 5{
            Sadbutton.isHidden = false
            Happybutton.isHidden = false
            Lovebutton.isHidden = false
            i = 0
         
        }
        
        
        
        
        
    

}
}
