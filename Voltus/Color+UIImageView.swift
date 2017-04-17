//
//  Color+UIImageView.swift
//  Voltus
//
//  Created by vw-mac-01 on 12/04/17.
//  Copyright © 2017 vw-mac-01. All rights reserved.
//

import UIKit

extension UIView {
    

   func applyGradient(isTopBottom: Bool, colorArray: [UIColor]) {
        if let sublayers = layer.sublayers {
            let maskLayer = CAGradientLayer()
            self.layer.mask = maskLayer
            let _ = sublayers.filter({ $0 is CAGradientLayer }).map({ $0.removeFromSuperlayer() })

        }
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = colorArray.map({ $0.cgColor })
        
        if isTopBottom {
            gradientLayer.locations = [0.0, 1.0]
        } else {
        
            gradientLayer.startPoint = CGPoint(x: 0.0, y: 1.0)
            gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
            
        }
        
        backgroundColor = .clear
        gradientLayer.frame = ( CGRect(x: 0, y: 0, width: 500, height: 700))
        layer.insertSublayer(gradientLayer, at: 0)

    }
    
    
}
