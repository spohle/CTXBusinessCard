//
//  HomeViewController.swift
//  CTXBusinessCard
//
//  Created by Sven Pohle on 7/2/18.
//  Copyright © 2018 Sven Pohle. All rights reserved.
//

import UIKit
import ARKit

class HomeViewController: UIViewController {

    var screenCenter: CGPoint?
    var isPlaneAdded: Bool = false
    
    var session: ARSession?
    
    let updateQueye = DispatchQueue(label: Bundle.main.bundleIdentifier! + ".serialSceneKitQueue")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Prevent the screen from being dimmed after a while as users will likely
        // have long periods of interaction without touching the screen or buttons.
        UIApplication.shared.isIdleTimerDisabled = true
        
        setupUserInterface()
        setupARSCene()
        
        self.session = uiARView.session
    }
}
