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

    let arConfig = ARWorldTrackingConfiguration()
    var screenCenter: CGPoint?
    var isPlaneAdded: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUserInterface()
        setupARSCene()
    }
}
