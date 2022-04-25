import SwiftUI
import SpriteKit

public class Sadscene: SKScene{
    
    var nextScene: (() -> Void)! = nil
    var LoveScene: (() -> Void)! = nil
    var HappyScene: (() -> Void)! = nil
    
    var NPC:NPCNOde?
    var Ballon:BallonNode?
    public override func didMove(to view: SKView) {
        super.didMove(to: view)
        LoveScene = {
            let scene = Lovescene(size: view.bounds.size)
            view.presentScene(scene)
            
        }
        HappyScene = {
            let scene = Happyscene(size: view.bounds.size)
            view.presentScene(scene)
        }
        nextScene = {
            let scene = Finalscene(size: view.bounds.size)
            view.presentScene(scene)
        }
    }
    
   public override func sceneDidLoad() {
        super.sceneDidLoad()
        j = j + 1
        let background = SKSpriteNode(imageNamed: "Sadscene")
        background.zPosition = -3
        background.position = CGPoint(x: 500, y: 540)
        background.setScale(1.8)
        self.NPC = NPCNOde()
        self.NPC?.position.x = 100
        self.NPC?.position.y = 220
        self.NPC?.setScale(0.2)
        self.addChild(background)
        self.addChild(self.NPC!)
        i = 0
        NPC?.Animation()
       let talk = SKSpriteNode(imageNamed: "taptotalk2")
       self.addChild(talk)
       talk.position = CGPoint(x: 400, y: 35)
       talk.setScale(0.6)
       let sadmusic = SKAudioNode(fileNamed: "sad.wav")
       self.addChild(sadmusic)
       sadmusic.run(SKAction.play())
       
   }
    override public func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.Ballon?.label?.isHidden = true
        let sadmusic = SKAudioNode(fileNamed: "sad.wav")
        let Lovebutton = ButtonNode(image: .init(imageNamed: "LoveButton")){
            self.LoveScene()
            sadmusic.run(SKAction.stop())
            
        }
        
        let Happybutton = ButtonNode(image: .init(imageNamed: "HappyButton")){
               self.HappyScene()
            sadmusic.run(SKAction.stop())
        }
        
        let finalbutton = ButtonNode(image: .init(imageNamed: "Final")){
            self.nextScene()
            sadmusic.run(SKAction.stop())
        }
        
        self.addChild(finalbutton)
        self.addChild(Lovebutton)
        self.addChild(Happybutton)
        self.Ballon?.label?.isHidden = true
        self.Ballon = BallonNode(image:.init(imageNamed: "Ballon"), label: .init(text:SadText[i]))
        self.addChild(self.Ballon!)
        self.Ballon?.image?.position = CGPoint(x: 300, y: 360)
        self.Ballon?.label?.position = CGPoint(x: 250, y: 340)
        self.Ballon?.image?.setScale(2)
        i = i + 1
      
        
        Lovebutton.position = CGPoint(x: 400, y: 250)
        Lovebutton.setScale(1.8)
        Happybutton.setScale(1.8)
        Happybutton.position = CGPoint(x: 600, y: 250)
        finalbutton.position = CGPoint(x: 500, y: 150)
        finalbutton.setScale(1.8)
        Happybutton.isHidden = true
        Lovebutton.isHidden = true
        finalbutton.isHidden = true
            
        if i == 8{
            Lovebutton.isHidden = false
            Happybutton.isHidden = false
            i = 0
            if (j >= 1 && k >= 1 && l >= 1){
              
                finalbutton.isHidden = false
                   
                }
            
        }
    }
    
}
