//
//  BreakExerciseViewController.swift
//  MoEx
//
//  Created by Ahmad Zaky on 08/06/21.
//

import UIKit

class BreakExerciseViewController: UIViewController {

    @IBOutlet weak var skipButton: UIButton!
    @IBOutlet weak var nextView: UIView!
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var nextExerciseLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initComponent()
        // Do any additional setup after loading the view.
    }
    
    func initComponent() {
        skipButton.makeCornerRadius(cornerRadius: 8)
        nextView.layer.borderWidth = 1
        nextView.layer.borderColor = #colorLiteral(red: 0.862745098, green: 0.862745098, blue: 0.862745098, alpha: 1)
        nextView.layer.cornerRadius = 4
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
