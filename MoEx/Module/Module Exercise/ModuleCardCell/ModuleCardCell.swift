//
//  ModuleCardCell.swift
//  MoEx
//
//  Created by Kevin Tanuhardi on 09/06/21.
//

import UIKit
import Foundation

protocol ModuleCardDelegate: AnyObject {
    func listButtonDidTap(module: ModuleModel)
}

class ModuleCardCell: UICollectionViewCell {

    @IBOutlet weak var thumbImage: UIImageView!
    
    @IBOutlet weak var exerciseTitleLabel: UILabel!
    @IBOutlet weak var exerciseInfoLabel: UILabel!
    
    weak var delegate: ModuleCardDelegate?
    
    override class func awakeFromNib() {
        super.awakeFromNib()
        

    }
    
    var module: ModuleModel? {
        didSet {
            setupView()
        }
    }
    
    func shadowDecorate() {
            let radius: CGFloat = 10
            contentView.layer.cornerRadius = radius
            contentView.layer.borderWidth = 1
            contentView.layer.borderColor = UIColor.clear.cgColor
            contentView.layer.masksToBounds = true
        
            layer.shadowColor = UIColor.black.cgColor
            layer.shadowOffset = .zero
            layer.shadowRadius = 5.0
            layer.shadowOpacity = 0.8
            layer.masksToBounds = false
            layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: radius).cgPath
            layer.cornerRadius = radius
        }
    
    func setupView() {

        shadowDecorate()
        
        thumbImage.image = module?.thumb
        exerciseTitleLabel.text = module?.title
        
        if let exerciseCount = module?.exercise?.count, let duration = module?.time {
            exerciseInfoLabel.text = "\(String(format: "%02d", exerciseCount)) Exercise • \(String(format: "%02d", duration)) Minutes "
        }
    }

    @IBAction func listExerciseButtonTouched(_ sender: Any) {
        delegate?.listButtonDidTap(module: module!)
    }
    
}
