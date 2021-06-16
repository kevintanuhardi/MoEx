//
//  HowToTableViewCell.swift
//  MoEx
//
//  Created by Randy Efan Jayaputra on 09/06/21.
//

import UIKit

class HowToTableViewCell: UITableViewCell {
    @IBOutlet weak var howToLabel: UILabel!
    
    var how: HowTo? {
        didSet{
            guard let how = how else { return }
            howToLabel.text = how.description
        }
    }
    
    var benefits: Benefit? {
        didSet {
            guard let benefit = benefits else { return }
            howToLabel.text = benefit.description
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
