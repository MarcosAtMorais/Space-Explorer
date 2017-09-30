//
//  GameScene+SKPhysics.swift
//  Space Explorer
//
//  Created by Marcos Morais on 29/09/2017.
//  Copyright © 2017 Marcos Morais. All rights reserved.
//

import SpriteKit


//MARK: - Physics Methods
/**
 Métodos de configuração da física da cena.
 */
extension GameScene: SKPhysicsContactDelegate {
    
    /**
     Método de configuração da física da cena.
     */
    func setupScenePhysics() {
        self.physicsWorld.contactDelegate = self
        self.physicsWorld.gravity = CGVector(dx: 0, dy: 0)
    }
    
    // MARK: SKPhysicsContactDelegate Methods
    
    /**
     Método que é chamado sempre que algum corpo físico entra em contato.
     - parameter : contact (contato contendo dois corpos físicos [a e b])
     */
    func didBegin(_ contact: SKPhysicsContact) {
        
        switch contact.bodyA.node {
        case is Ship:
            (contact.bodyA.node as! Ship).didBeginContact(contact: contact)
            
        case is Bullet:
            (contact.bodyA.node as! Bullet).didBeginContact(contact: contact)
            
        case is Planet:
            (contact.bodyA.node as! Planet).didBeginContact(contact: contact)
            
//        case is Meteor:
        //            (contact.bodyA.node as! Meteor).didBeginContact(contact: contact)
        default:
            print("Not recognized.")
        }
        
        switch contact.bodyB.node {
        case is Ship:
            (contact.bodyB.node as! Ship).didBeginContact(contact: contact)
            
        case is Bullet:
            (contact.bodyB.node as! Bullet).didBeginContact(contact: contact)
            
        case is Planet:
            (contact.bodyB.node as! Planet).didBeginContact(contact: contact)
            
//        case is Meteor:
//            (contact.bodyB.node as! Meteor).didBeginContact(contact: contact)
        default:
            print("Not recognized.")
        }
        
    }
    
    /**
     Método que é chamado sempre que algum corpo físico sai do contato.
     - parameter : contact (contato contendo dois corpos físicos [a e b])
     */
    func didEnd(_ contact: SKPhysicsContact) {
        
    }
    
}
