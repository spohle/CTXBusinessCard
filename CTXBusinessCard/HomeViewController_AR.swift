//
//  HomeViewController_AR.swift
//  CTXBusinessCard
//
//  Created by Sven Pohle on 7/2/18.
//  Copyright © 2018 Sven Pohle. All rights reserved.
//

import Foundation
import ARKit

extension HomeViewController: ARSCNViewDelegate {
    func setupARSCene() {
        uiARView.delegate = self
        uiARView.scene = SCNScene()
        uiARView.showsStatistics = false
        uiARView.antialiasingMode = .multisampling4X
        uiARView.contentScaleFactor = 1.0
        uiARView.preferredFramesPerSecond = 60
        DispatchQueue.main.async {
            self.screenCenter = CGPoint(x: uiARView.bounds.midX, y: uiARView.bounds.midY)
        }
        
        if let camera = uiARView.pointOfView?.camera {
            camera.wantsHDR = true
            camera.wantsExposureAdaptation = true
            camera.exposureOffset = -1
            camera.minimumExposure = -1
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        arConfig.planeDetection = .horizontal
        uiARView.session.run(arConfig)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
    
    func renderer(_ renderer: SCNSceneRenderer, didAdd node: SCNNode, for anchor: ARAnchor) {
        if isPlaneAdded {
            return
        }
        
        guard let planeAnchor = anchor as? ARPlaneAnchor else { return }
        
        DispatchQueue.main.async {
            uiAddButton.isHidden = false
        }
        
        let geo = SCNPlane(width: CGFloat(planeAnchor.extent.x), height: CGFloat(planeAnchor.extent.z))
        geo.materials.first?.diffuse.contents = UIImage(named: "grid.jpg")
        geo.materials.first?.transparency = 0.5
        let planeNode = SCNNode(geometry: geo)
        planeNode.position = SCNVector3Make(planeAnchor.center.x, 0, planeAnchor.center.z)
        planeNode.eulerAngles = SCNVector3Make(-Float.pi/2, 0, 0)
        node.addChildNode(planeNode)
    }
}
