//
//  UIImageView+Ext.swift
//  MoEx
//
//  Created by Ahmad Zaky on 10/06/21.
//

import Foundation
import UIKit

extension UIButton {
    
    func makeCornerRadius(cornerRadius: CGFloat){
        self.layer.cornerRadius = cornerRadius
        self.layer.borderWidth = 1
        self.layer.borderColor = #colorLiteral(red: 0.2039215686, green: 0.4235294118, blue: 0.4980392157, alpha: 1)
    }
    
}
