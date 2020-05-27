//
//  ViewController.swift
//  MultiGesture
//
//  Created by Matiny L on 5/26/20.
//  Copyright © 2020 Matiny L. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageMonster: UIImageView!
    
    @IBOutlet var tapGesture: UITapGestureRecognizer!
    
    @IBOutlet var panGesture: UIPanGestureRecognizer!
    
    @IBOutlet var rotateGesture: UIRotationGestureRecognizer!
    
    @IBOutlet var pinchGesture: UIPinchGestureRecognizer!
    
    let monsterArray = [ #imageLiteral(resourceName: "griffin"),#imageLiteral(resourceName: "werewolf"),#imageLiteral(resourceName: "grave"),#imageLiteral(resourceName: "forktail"),#imageLiteral(resourceName: "leshen"),#imageLiteral(resourceName: "succubus") ]

    override func viewDidLoad() {
        super.viewDidLoad()
        /* Set random image */
        imageMonster.image = monsterArray.randomElement()
        
        /* Set gesture to double tap */
        tapGesture.numberOfTapsRequired = 2
        tapGesture.numberOfTouchesRequired = 1
    }
    
    
    @IBAction func tapMonster(_ sender: UITapGestureRecognizer) {
        
        imageMonster.image = monsterArray.randomElement()
        
    }
    
    
    @IBAction func panMonster(_ sender: UIPanGestureRecognizer) {
        let translation = panGesture.translation(in: view)
        guard let panView = panGesture.view else {
            return
        }
        
        panView.center.x += translation.x
        panView.center.y += translation.y
        
        panGesture.setTranslation(.zero, in: view)
        
    }
    
    
    @IBAction func rotateMonster(_ sender: UIRotationGestureRecognizer) {
        guard let rotateView = rotateGesture.view else {
            return
        }
        rotateView.transform = rotateView.transform.rotated(by: rotateGesture.rotation)
        rotateGesture.rotation = .zero
    }
    
    @IBAction func pinchMonster(_ sender: UIPinchGestureRecognizer) {
         guard let pinchView = pinchGesture.view else {
             return
         }
        pinchView.transform = pinchView.transform.scaledBy(x: pinchGesture.scale, y: pinchGesture.scale)
        pinchGesture.scale = 1
    }
}

