//
//  ARView_Extensions.swift
//  CTXBusinessCard
//
//  Created by Sven Pohle on 7/5/18.
//  Copyright © 2018 Sven Pohle. All rights reserved.
//

import Foundation
import ARKit

extension ARSCNView {
    func enableEnvironmentMapWithIntensity(_ intensity: CGFloat) {
        if scene.lightingEnvironment.contents == nil {
            if let environmentMap = UIImage(named: "Models.scnassets/sharedImages/environment_blur.exr") {
                scene.lightingEnvironment.contents = environmentMap
            }
        }
        scene.lightingEnvironment.intensity = intensity
    }
}
