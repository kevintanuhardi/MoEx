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
    
    @IBOutlet weak var listExerciseButton: UIButton!
    
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
    
    func setupView() {
        listExerciseButton.layer.cornerRadius = 16
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
