//
//  DetailExerciseViewController.swift
//  MoEx
//
//  Created by Randy Efan Jayaputra on 09/06/21.
//

import UIKit

class DetailExerciseViewController: UIViewController {
    @IBOutlet weak var exerciseImageView: UIImageView!
    @IBOutlet weak var titleExerciseLabel: UILabel!
    @IBOutlet weak var captionExerciseLabel: UILabel!
    @IBOutlet weak var howToTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func setupView() {
        howToTableView.delegate = self
        howToTableView.dataSource = self
        howToTableView.register(UINib(nibName: "HowToTableViewCell", bundle: nil), forCellReuseIdentifier: "HowToCell")
        howToTableView.tableFooterView = UIView()
        howToTableView.separatorColor = UIColor.clear
        
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    @IBAction func startExercisePressed(_ sender: Any) {
        let viewController = DoingExerciseViewController()
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
}

extension DetailExerciseViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Handle With Data
        4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "HowToCell") as? HowToTableViewCell {
            cell.selectionStyle = .none
            return cell
        }
        fatalError("Cant detect cell")
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "How To"
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let myLabel = UILabel()
        myLabel.frame = CGRect(x: 8, y: 20, width: 320, height: 20)
        myLabel.font = UIFont(name: "Avenir-Heavy", size: 17)
        myLabel.text = self.tableView(tableView, titleForHeaderInSection: section)
        
        let headerView = UIView()
        headerView.addSubview(myLabel)
        
        return headerView
    }
}
