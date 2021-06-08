//
//  DetailExercise.swift
//  MoEx
//
//  Created by JACKY on 08/06/21.
//

import UIKit
import WebKit
class DetailExercise: UIViewController, WKNavigationDelegate {
    @IBOutlet weak var thumb: WKWebView!
    @IBOutlet weak var btnOpenInstruction: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        // Do any additional setup after loading the view.
    }
    
    func setupView() {
        btnOpenInstruction.setTitle("See Instructions", for: .normal)
        btnOpenInstruction.backgroundColor = #colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1)
        btnOpenInstruction.layer.cornerRadius = 10
        btnOpenInstruction.translatesAutoresizingMaskIntoConstraints = false
        btnOpenInstruction.widthAnchor.constraint(equalToConstant: 380).isActive = true
        btnOpenInstruction.heightAnchor.constraint(equalToConstant: 60).isActive = true
        btnOpenInstruction.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        btnOpenInstruction.bottomAnchor.constraint(equalTo: self.view.layoutMarginsGuide.bottomAnchor, constant: -10).isActive = true
        
        let url = URL(string: "https://www.youtube.com/embed/9bZkp7q19f0")!
        thumb.load(URLRequest(url: url))
        thumb.allowsBackForwardNavigationGestures = true
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
