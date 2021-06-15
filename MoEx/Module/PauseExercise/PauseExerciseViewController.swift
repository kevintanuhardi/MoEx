//
//  PauseExerciseViewController.swift
//  MoEx
//
//  Created by Ahmad Zaky on 08/06/21.
//

import UIKit

class PauseExerciseViewController: UIViewController {
    
    @IBOutlet weak var quitButton: UIButton!
    @IBOutlet weak var resumeButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        initComponent()
        // Do any additional setup after loading the view.
    }
    
    func initComponent() {
        quitButton.makeCornerRadius(cornerRadius: 8)
        resumeButton.makeCornerRadius(cornerRadius: 8)
    }
    
    @IBAction func onQuitButtonClicked(sender: UIButton){
        self.navigationController?.pushViewController(ModuleExerciseViewController(), animated: true)
    }
    @IBAction func onResumeButtonClicked(sender: UIButton){
        self.navigationController?.pushViewController(DoingExerciseViewController(), animated: true)
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
