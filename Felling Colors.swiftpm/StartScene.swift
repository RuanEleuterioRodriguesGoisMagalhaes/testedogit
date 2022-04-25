import Foundation
import UIKit
import SpriteKit
import SwiftUI


public class StartScene: SKScene{
    
    
    var GameScene: (() -> Void)! = nil
    public override func didMove(to view: SKView) {
        super.didMove(to: view)
        GameScene = {
            let scene = Gamescene(size:view.bounds.size)
            view.presentScene(scene)
            
        }
        
    }
    public override func sceneDidLoad() {
        super.sceneDidLoad()
        backgroundColor = .white
        let line = SKSpriteNode(imageNamed: "Start")
        line.position = CGPoint(x: 400, y: 600)
        line.setScale(1.5)
        let line2 = SKSpriteNode(imageNamed: "TAP")
        self.addChild(line)
        self.addChild(line2)
        line2.position = CGPoint(x: 400, y: 100)
        line2.setScale(0.5)
       
       
  
        
        }
    
    override public func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        k = 0
        j = 0
        l = 0
        self.GameScene()
        
    }
        
       
}
    

