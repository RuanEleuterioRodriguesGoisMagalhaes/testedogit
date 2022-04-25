import SwiftUI
import SpriteKit

public class Happyscene: SKScene{
    var SadScene: (() -> Void)! = nil
    var LoveScene: (() -> Void)! = nil
    var nextScene: (() -> Void)! = nil
    var NPC:NPCNOde?
    var Ballon:BallonNode?
    
    
    var audioNode = SKNode()
    
    public override func didMove(to view: SKView) {
        super.didMove(to: view)
        SadScene = {
            let scene = Sadscene(size:  view.bounds.size)
            view.presentScene(scene)
            
        }
        LoveScene = {
                let scene = Lovescene(size:  view.bounds.size)
                self.view?.presentScene(scene)
            }
        nextScene = {
            let scene = Finalscene(size: view.bounds.size)
            view.presentScene(scene)
        }
        }
    

   public override func sceneDidLoad() {
        super.sceneDidLoad()
        l = l + 1
        let background = SKSpriteNode(imageNamed: "Happyscene")
        background.zPosition = -3
        background.position = CGPoint(x: 480, y: 500)
        background.setScale(0.6)
        

        self.addChild(audioNode)
        self.NPC = NPCNOde()
        self.NPC?.position = CGPoint(x: 100, y: 140)
        self.NPC?.setScale(0.3)
        self.addChild(background)
        self.addChild(self.NPC!)
        i = 0
        NPC?.Animation()
        let talk = SKSpriteNode(imageNamed: "taptotalk2")
        self.addChild(talk)
        talk.position = CGPoint(x: 400, y: 30)
        talk.setScale(0.6)
        let happymusic = SKAudioNode(fileNamed: "happy.mp3")
        self.addChild(happymusic)
        happymusic.run(SKAction.play())
       
       
   }
    override public func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.Ballon?.label?.isHidden = true
        let happymusic = SKAudioNode(fileNamed: "happy.mp3")
        let Lovebutton = ButtonNode(image: .init(imageNamed: "LoveButton")){
            self.LoveScene()
            happymusic.run(SKAction.stop())
        }
        
        let Sadbutton = ButtonNode(image: .init(imageNamed: "SadButton")){
               self.SadScene()
               happymusic.run(SKAction.stop())
        }
        
        let finalbutton = ButtonNode(image: .init(imageNamed: "Final")){
            self.nextScene()
            happymusic.run(SKAction.stop())
        }
        
        self.addChild(finalbutton)
        self.addChild(Lovebutton)
        self.addChild(Sadbutton)
        self.Ballon?.label?.isHidden = true
        self.Ballon = BallonNode(image:.init(imageNamed: "Ballon"), label: .init(text:HappyText[i]))
       self.addChild(self.Ballon!)
        self.Ballon?.image?.position = CGPoint(x: 300, y: 300)
        self.Ballon?.label?.position = CGPoint(x: 250, y: 280)
        self.Ballon?.image?.setScale(2.2)
       i = i + 1
      
       
        Lovebutton.position = CGPoint(x: 500, y: 200)
        Sadbutton.position = CGPoint(x: 700, y: 200)
        Lovebutton.setScale(1.8)
        Sadbutton.setScale(1.8)
        finalbutton.position = CGPoint(x: 600, y: 100)
        finalbutton.setScale(1.8)
        Sadbutton.isHidden = true
        Lovebutton.isHidden = true
        finalbutton.isHidden = true
        
        if i == 7{
            Lovebutton.isHidden = false
            Sadbutton.isHidden = false
            i = 0
            if (j >= 1 && k >= 1 && l >= 1){
                    
                    finalbutton.isHidden = false
                   
                }
        }
    
    }
    
}
