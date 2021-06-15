//
//  FinishExerciseViewController.swift
//  MoEx
//
//  Created by Ahmad Zaky on 08/06/21.
//

import UIKit

class FinishExerciseViewController: UIViewController {
    
    
    @IBOutlet weak var finishButton: UIButton!
    @IBOutlet weak var moduleName: UILabel!
    @IBOutlet weak var totalWorkout: UILabel!
    @IBOutlet weak var workoutTime: UILabel!
    @IBOutlet weak var circleLogoContainer: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        initComponent()
        // Do any additional setup after loading the view.
    }
    
    func initComponent() {
        finishButton.makeCornerRadius(cornerRadius: 8)
        circleLogoContainer.layer.cornerRadius = circleLogoContainer.frame.height/2
    }
    
    @IBAction func onFinishButtonClicked(sender: UIButton) {
        self.navigationController?.pushViewController(BreakExerciseViewController(), animated: true)
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
