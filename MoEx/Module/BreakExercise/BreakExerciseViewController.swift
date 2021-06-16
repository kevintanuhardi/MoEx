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
    @IBOutlet weak var timerAndCurrentWorkout: UILabel!
    @IBOutlet weak var nextExerciseImage: UIImageView!
    var timer: Timer!
    var breakTime = 15
    var moduleModel: ModuleModel?
    var exerciseIndex: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initComponent()
        setTimer()
        // Do any additional setup after loading the view.
    }
    
    func initComponent() {
        guard let exerciseIndex = exerciseIndex, let moduleModel = moduleModel else {
            return
        }
        
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        skipButton.makeCornerRadius(cornerRadius: 8)
        nextView.layer.borderWidth = 1
        nextView.layer.borderColor = #colorLiteral(red: 0.862745098, green: 0.862745098, blue: 0.862745098, alpha: 1)
        nextView.layer.cornerRadius = 4
        if moduleModel.exercise[exerciseIndex].title == "Planks"{
            timerAndCurrentWorkout.text = "\(moduleModel.exercise[exerciseIndex].reps) seconds • \(exerciseIndex+1) of \(moduleModel.exercise.count)"
        } else {
            timerAndCurrentWorkout.text = "\(moduleModel.exercise[exerciseIndex].reps) reps • \(exerciseIndex+1) of \(moduleModel.exercise.count)"
        }
        nextExerciseLabel.text = moduleModel.exercise[exerciseIndex].title
        nextExerciseImage.image = moduleModel.thumb
    }


    @IBAction func onSkipButtonClicked(sender: UIButton) {
        guard let moduleModel = moduleModel, let exerciseIndex = exerciseIndex else { return }
        timer.invalidate()
        breakTime = 15
        let vc = DetailExerciseViewController()
        vc.exercise = moduleModel.exercise[exerciseIndex]
        vc.module = moduleModel
        vc.index = exerciseIndex
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func setTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateBreakTime), userInfo: nil, repeats: true)
        
    }
    
    @objc func updateBreakTime(){
        if breakTime > 0 {
            breakTime -= 1
            if breakTime >= 10 {
                self.timerLabel.text = "00:\(self.breakTime)"
            } else {
                self.timerLabel.text = "00:0\(self.breakTime)"
            }
        } else {
            timer.invalidate()
            breakTime = 15
            self.timerLabel.text = "00:\(self.breakTime)"
            self.navigationController?.pushViewController(PauseExerciseViewController(), animated: true)
        }
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
