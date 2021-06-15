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

    var moduleModel: ModuleModel?
    var workoutIndex: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initComponent()
        // Do any additional setup after loading the view.
    }

    
    func initComponent() {
        guard let currentWorkout = workoutIndex else {
            return
        }
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        finishButton.makeCornerRadius(cornerRadius: 8)
        circleLogoContainer.layer.cornerRadius = circleLogoContainer.frame.height/2
        moduleName.text = moduleModel?.title
        totalWorkout.text = "\(moduleModel?.exercise.count ?? 0)"
        workoutTime.text = "\(moduleModel!.time):00"
    }
    
    
    
    @IBAction func onFinishButtonClicked(sender: UIButton) {
        self.navigationController?.pushViewController(ModuleExerciseViewController(), animated: true)
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
