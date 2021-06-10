//
//  CustomAlertInfoViewController.swift
//  MoEx
//
//  Created by JACKY on 10/06/21.
//

import UIKit

class CustomAlertInfoViewController: UIViewController {
    
    @IBOutlet weak var viewBlurUi: UIView!
    @IBAction func btnDismiss(_ sender: Any) {
            print("dismiss custom alert")
//            let mainViewController = self.presentingViewController as? DetailExercise
//        mainViewController?.clearBlur()
        self.dismiss(animated: true, completion: {
//            let DetailExerciseController = DetailExercise();
//            DetailExerciseController.viewWillAppear(true)
        })
        
    }
    var callBack: ((_ text: String)-> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .clear
        
        let blurEffect = UIBlurEffect(style: .dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        //always fill the view
        blurEffectView.frame = self.viewBlurUi.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.viewBlurUi.insertSubview(blurEffectView, at: 0)
        self.viewBlurUi.backgroundColor = .clear
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
