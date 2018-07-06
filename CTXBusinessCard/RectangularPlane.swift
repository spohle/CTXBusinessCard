//
//  RectangularPlane.swift
//  CTXBusinessCard
//
//  Created by Sven Pohle on 7/6/18.
//  Copyright © 2018 Sven Pohle. All rights reserved.
//

import Foundation
import simd
import SceneKit

struct RectangularPlane {
    var center: matrix_float4x4
    
    var width: CGFloat
    var height: CGFloat
    var length: CGFloat { return 0.005 }
    
    init(center: matrix_float4x4, size: CGSize) {
        self.center = center
        self.width = size.width
        self.height = size.height
    }
}
