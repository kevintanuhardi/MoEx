//
//  UIView+Ext.swift
//  MoEx
//
//  Created by Ahmad Zaky on 16/06/21.
//

import Foundation
import UIKit
import AVFoundation

extension UIView {
    
    var previewLayer: AVCaptureVideoPreviewLayer {
        return layer as! AVCaptureVideoPreviewLayer
    }
    
    func showPoints(_ points: [CGPoint], color: UIColor){
        
    }
}
