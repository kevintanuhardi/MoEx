//
//  DetailExercise.swift
//  MoEx
//
//  Created by JACKY on 08/06/21.
//

import UIKit
import WebKit

class DetailExercise: UIViewController, WKNavigationDelegate, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var thumb: WKWebView!
    @IBOutlet var tableView: UITableView!
    @IBOutlet weak var btnOpenInstruction: UIButton!
    
    //private weak var blurView: UIView?
    let benefitData = ["Burning a", "Burning b", "Burning c"]
    
    @IBAction func onClick(_ sender: Any) {
        let myAlert = CustomAlertInfoViewController()
           myAlert.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
           myAlert.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
        
        
//        let blurEffect = UIBlurEffect(style: .dark)
//        let blurEffectView = UIVisualEffectView(effect: blurEffect)
//        //always fill the view
//        blurEffectView.frame = self.view.bounds
//        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//        blurEffectView.tag = 100
//        self.view.addSubview(blurEffectView)
//        blurView = blurEffectView
        
        
        self.navigationController?.present(myAlert, animated: true, completion: nil)
    }
    
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        // Do any additional setup after loading the view.
        let nib = UINib(nibName: "BenefitTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "benefitTableIndentifier")
        
        tableView.delegate = self
        tableView.dataSource = self
        view.backgroundColor = #colorLiteral(red: 0.9607843137, green: 0.9607843137, blue: 0.9607843137, alpha: 1)
    }
    
    func setupView() {
        btnOpenInstruction.setTitle("See Instructions", for: .normal)
        btnOpenInstruction.backgroundColor = #colorLiteral(red: 0, green: 0.4393936992, blue: 0.5154479146, alpha: 1)
        btnOpenInstruction.layer.cornerRadius = 10
        btnOpenInstruction.translatesAutoresizingMaskIntoConstraints = false
        
        self.tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        //btnOpenInstruction.widthAnchor.constraint(equalToConstant: 380).isActive = true
        //btnOpenInstruction.heightAnchor.constraint(equalToConstant: 60).isActive = true
        //btnOpenInstruction.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        //btnOpenInstruction.bottomAnchor.constraint(equalTo: self.view.layoutMarginsGuide.bottomAnchor, constant: -10).isActive = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        let url = URL(string: "https://www.youtube.com/embed/MO10KOoQx5E")!
        thumb.load(URLRequest(url: url))
        thumb.allowsBackForwardNavigationGestures = true
    }
    
  
//    func clearBlur() {
//        print("clear blur here")
//        blurView?.isHidden = true
//        blurView?.removeFromSuperview()
//        self.view.viewWithTag(100)?.removeFromSuperview()
//    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return benefitData.count
    }
    
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return "Benefits"
//    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.size.width, height: 60))
        headerView.backgroundColor =  .white
        let label = UILabel(frame: CGRect(x: 12, y: 0, width: tableView.bounds.size.width, height: 30))
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        label.text = "Benefits"
        label.font = UIFont(name:"HelveticaNeue-Bold", size: 18.0)
        label.font = UIFont.boldSystemFont(ofSize: 16.0)
        headerView.addSubview(label)
        return headerView
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "benefitTableIndentifier", for: indexPath) as! BenefitTableViewCell
        
                let data = benefitData[indexPath.row]
                cell.descLabel.text = data
               
                return cell
    }
    

}
