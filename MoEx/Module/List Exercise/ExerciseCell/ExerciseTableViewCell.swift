//
//  ExerciseCellTableViewCell.swift
//  MoEx
//
//  Created by Kevin Tanuhardi on 11/06/21.
//

import UIKit

class ExerciseTableViewCell: UITableViewCell {

    @IBOutlet weak var thumbImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var repsLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    var exercise: Exercise? {
        didSet {
            setupView()
        }
    }
    
    func setupView() {
        thumbImage.image = exercise?.thumb
        titleLabel.text = exercise?.title
        if let reps = exercise?.reps {
            repsLabel.text = "\(reps) reps"
        }
    }
    
}
