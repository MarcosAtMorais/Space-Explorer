//
//  GameScene.swift
//  Space Explorer
//
//  Created by Marcos Morais on 28/09/2017.
//  Copyright © 2017 Marcos Morais. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    // MARK: - Atributos essenciais das camadas utilizadas no Game
    var gameLayer: GameLayer!
    var backgroundLayer: BackgroundLayer!
    var foregroundLayer: ForegroundLayer!
    var hudLayer: HudLayer!
    var cameraNode = SKCameraNode()
    
    override func didMove(to view: SKView) {
        self.setupScenePhysics()
    }
    
    override init(size: CGSize) {
        super.init(size: size)
        self.camera = cameraNode
        self.addChild(self.camera!)
        self.setupLayers(size: size)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Touches Delegate Methods
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.gameLayer.touchesBegan(touches, with: event)
        self.hudLayer.touchesBegan(touches, with: event)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.gameLayer.touchesMoved(touches, with: event)
        self.hudLayer.touchesMoved(touches, with: event)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.gameLayer.touchesEnded(touches, with: event)
        self.hudLayer.touchesEnded(touches, with: event)
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.gameLayer.touchesCancelled(touches, with: event)
    }
    
    // MARK: - Update Method
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        self.gameLayer.delegate?.update(timeInterval: currentTime)
        self.camera?.position = self.gameLayer.ship.position
    }
    
    // MARK: Setup Methods
    /**
     Método que instancia cada uma das camadas utilizadas no jogo. GameLayer, BackgroundLayer, HudLayer e Foreground Layer. O método chama o outro método addLayers para adicionar as recém instanciadas camadas.
     
     - parameters: size (tamanho da scene em CGSize).
     
     */
    
    
    func setupLayers(size: CGSize) {
//        self.backgroundColor = .black
        self.gameLayer = GameLayer(size: size)
        self.backgroundLayer = BackgroundLayer(size: size)
        self.foregroundLayer = ForegroundLayer(size: size)
        self.hudLayer = HudLayer(size: size)
        self.hudLayer.joystick.trackingHandler = self.gameLayer.ship.handlerTracking
        self.hudLayer.shootableDelegate = self.gameLayer.ship
        
        addLayers()
    }
    
    func addLayers() {
        self.addChild(backgroundLayer)
        self.camera!.addChild(foregroundLayer)
        self.camera!.addChild(hudLayer)
        self.addChild(gameLayer)
    }
    
}
