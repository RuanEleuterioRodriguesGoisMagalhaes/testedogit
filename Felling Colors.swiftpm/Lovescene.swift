import SwiftUI
import SpriteKit

public class Lovescene: SKScene{
    var nextScene: (() -> Void)! = nil
    var SadScene: (() -> Void)! = nil
    var HappyScene: (() -> Void)! = nil
    
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
        
        nextScene = {
            let scene = Finalscene(size: view.bounds.size)
            view.presentScene(scene)
        }
    }
    
   public override func sceneDidLoad() {
        super.sceneDidLoad()
        k = k + 1
        let background = SKSpriteNode(imageNamed: "Lovescene")
        background.zPosition = -3
        background.position = CGPoint(x: 450, y: 550)
        background.setScale(0.75)
        background.yScale = 0.8
        self.NPC = NPCNOde()
        self.NPC?.position = CGPoint(x: 100, y: 450)
        self.NPC?.setScale(0.3)
        self.addChild(background)
        self.addChild(self.NPC!)
        i = 0
        NPC?.Animation()
       let talk = SKSpriteNode(imageNamed: "taptotalk2")
       self.addChild(talk)
       talk.position = CGPoint(x: 400, y: 20)
       talk.setScale(0.6)
       let lovemusic = SKAudioNode(fileNamed: "love.mp3")
       self.addChild(lovemusic)
       lovemusic.run(SKAction.play())
   }
    override public func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.Ballon?.label?.isHidden = true
        let lovemusic = SKAudioNode(fileNamed: "love.mp3")
        let Happybutton = ButtonNode(image: .init(imageNamed: "HappyButton")){
            self.HappyScene()
            lovemusic.run(SKAction.stop())
               
        }
        
        let Sadbutton = ButtonNode(image: .init(imageNamed: "SadButton")){
               self.SadScene()
            lovemusic.run(SKAction.stop())
        }
        let finalbutton = ButtonNode(image: .init(imageNamed: "Final")){
            self.nextScene()
            lovemusic.run(SKAction.stop())
        }
        
        self.addChild(finalbutton)
        self.addChild(Happybutton)
        self.addChild(Sadbutton)
        self.Ballon?.label?.isHidden = true
        self.Ballon = BallonNode(image:.init(imageNamed: "Ballon"), label: .init(text:LoveText[i]))
        self.addChild(self.Ballon!)
        self.Ballon?.image?.position = CGPoint(x: 350, y: 615)
        self.Ballon?.label?.position = CGPoint(x: 300, y: 600)
        self.Ballon?.image?.setScale(2.2)
       i = i + 1
      
       
        Happybutton.position = CGPoint(x: 500, y: 300)
        Sadbutton.position = CGPoint(x: 700, y: 300)
        Happybutton.setScale(1.8)
        Sadbutton.setScale(1.8)
        finalbutton.position = CGPoint(x: 600, y: 200)
        finalbutton.setScale(1.8)
        Sadbutton.isHidden = true
        Happybutton.isHidden = true
        finalbutton.isHidden = true
        
        if i == 8{
            Happybutton.isHidden = false
            Sadbutton.isHidden = false
            i = 0
            if (j >= 1 && k >= 1 && l >= 1){
                  
                    finalbutton.isHidden = false
                   
                }
        }
        
      
    }
    
}
