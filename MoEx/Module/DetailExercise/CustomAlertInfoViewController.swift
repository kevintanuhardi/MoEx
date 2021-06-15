//
//  CustomAlertInfoViewController.swift
//  MoEx
//
//  Created by JACKY on 10/06/21.
//

import UIKit

class CustomAlertInfoViewController: UIViewController {
    
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelDesc: UILabel!
    @IBOutlet weak var viewText: UIView!
    @IBOutlet weak var viewBlurUi: UIView!
    
    var tempTitle:String = ""
    var tempDesc:String = ""
    
    @IBAction func btnDismiss(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
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
        
        self.viewText.layer.cornerRadius = 10
        labelTitle.text = tempTitle
        labelDesc.text = tempDesc
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
