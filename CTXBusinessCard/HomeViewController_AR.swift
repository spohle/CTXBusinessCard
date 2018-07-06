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
        uiARView.session.delegate = self
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
    
    func resetTracking() {
        let refImages = ARReferenceImage.referenceImages(inGroupNamed: "AR Resources", bundle: Bundle.main)
        
        let config = ARWorldTrackingConfiguration()
        config.detectionImages = refImages
        session?.run(config, options: [.resetTracking, .removeExistingAnchors])
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // Start the AR experience
        resetTracking()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        uiARView.session.pause()
    }
    
    func renderer(_ renderer: SCNSceneRenderer, updateAtTime time: TimeInterval) {
    }
    
    func renderer(_ renderer: SCNSceneRenderer, didAdd node: SCNNode, for anchor: ARAnchor) {
        guard let imageAnchor = anchor as? ARImageAnchor else { return }
        
        let refImage = imageAnchor.referenceImage
        
        DispatchQueue.main.async {
            let plane = SCNPlane(width: refImage.physicalSize.width, height: refImage.physicalSize.height)
            plane.materials.first?.diffuse.contents = UIColor.red
            let planeNode = SCNNode(geometry: plane)
            planeNode.opacity = 0.25
            planeNode.eulerAngles.x = -.pi/2
            planeNode.runAction(self.imageHighlightAction)
            node.addChildNode(planeNode)
        }
    }
    
    func renderer(_ renderer: SCNSceneRenderer, didUpdate node: SCNNode, for anchor: ARAnchor) {
    }
    
    var imageHighlightAction: SCNAction {
        return .sequence([
            .wait(duration: 0.25),
            .fadeOpacity(to: 0.85, duration: 0.25),
            .fadeOpacity(to: 0.15, duration: 0.25),
            .fadeOpacity(to: 0.85, duration: 0.25)
        ])
    }
}

extension HomeViewController: ARSessionDelegate {
    
}
