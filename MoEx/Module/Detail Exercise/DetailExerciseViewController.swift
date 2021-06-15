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
    
    var module: ModuleModel?
    var exercise: Exercise?
    var index: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func setupView() {
        guard let exercise = exercise, let index = index, let module = module else { return }
        exerciseImageView.image = exercise.thumb
        titleExerciseLabel.text = exercise.title
        captionExerciseLabel.text = "\(index) of \(module.exercise.count) exercises"
        
        howToTableView.delegate = self
        howToTableView.dataSource = self
        howToTableView.register(UINib(nibName: "HowToTableViewCell", bundle: nil), forCellReuseIdentifier: "HowToCell")
        howToTableView.tableFooterView = UIView()
        howToTableView.separatorColor = UIColor.clear
        
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    func navigateToDoingExercise() {
        guard let module = module, let index = index else { return }
        let viewController = DoingExerciseViewController()
        viewController.module = module
        viewController.exercise = module.exercise[index + 1]
        viewController.index = index + 1
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    @IBAction func startExercisePressed(_ sender: Any) {
        navigateToDoingExercise()
    }
    
}

extension DetailExerciseViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let exercise = exercise else { return 0 }
        return exercise.howTo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "HowToCell") as? HowToTableViewCell {
            guard let exercise = exercise else { return UITableViewCell() }
            cell.how = exercise.howTo[indexPath.row]
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
