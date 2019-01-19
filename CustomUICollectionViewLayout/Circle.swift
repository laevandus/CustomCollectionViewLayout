//
//  Circle.swift
//  CustomUICollectionViewLayout
//
//  Created by Toomas Vahter on 19/01/2019.
//  Copyright © 2019 Augmented Code. All rights reserved.
//

import CoreGraphics

struct Circle {
    let center: CGPoint
    let radius: CGFloat
}

extension Circle {
    static let zero = Circle(center: .zero, radius: 0)
    
    var diameter: CGFloat {
        return radius * 2.0
    }
    
    var isEmpty: Bool {
        return radius == 0.0
    }
}

