//
//  GameLayer.swift
//  Pong
//
//  Created by Marcos Morais on 22/09/2017.
//  Copyright © 2017 Marcos Morais. All rights reserved.
//

import SpriteKit

class GameLayer: SKNode {
    
    // MARK: Atributos essenciais
    var delegate: Updatable?
    var ship: Ship!

    // MARK: Construtor
    init(size: CGSize) {
        super.init()
        self.delegate = self
        self.createShip(size: size)
        self.planetGenerator()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Métodos iniciais essenciais
    
    func createShip(size: CGSize) {
        self.ship = Ship(position: CGPoint(x: size.width/2, y: size.height/2), size: CGSize(width: 5, height: 5))
        self.addChild(self.ship)
        self.ship.createSmokeEffect()
    }
    
    func planetGenerator() {
        let createPlanet = SKAction.run {
            self.createPlanet()
        }
        let repeatForever = SKAction.repeat(createPlanet, count: 100)
        self.run(repeatForever)
    }
    
    func createPlanet() {
        let planetNumber = Int.random(min: 0, max: 4)
        let planetTexture: SKTexture!
        switch planetNumber {
        case Planets.earth.rawValue:
            planetTexture = SKTexture(image: #imageLiteral(resourceName: "Planeta5"))
        case Planets.desert.rawValue:
            planetTexture = SKTexture(image: #imageLiteral(resourceName: "Planeta3"))
        case Planets.mars.rawValue:
            planetTexture = SKTexture(image: #imageLiteral(resourceName: "Planeta1"))
        case Planets.pinky.rawValue:
            planetTexture = SKTexture(image: #imageLiteral(resourceName: "Planeta2"))
        default:
            planetTexture = SKTexture(image: #imageLiteral(resourceName: "Planeta4"))
        }
        planetTexture.filteringMode = .nearest
        let planet = Planet(position: CGPoint(x: self.ship.position.x+CGFloat.random(min: -5000, max: 5000), y: self.ship.position.y+CGFloat.random(min: -5000, max: 5000)), planetTexture: planetTexture)
        self.addChild(planet)
    }
    
    // MARK: - METEORS!
    
}
