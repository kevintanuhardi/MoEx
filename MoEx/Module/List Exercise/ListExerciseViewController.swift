//
//  ListExerciseViewController.swift
//  Project mc2 group 14
//
//  Created by Randy Efan Jayaputra on 07/06/21.
//

import UIKit

class ListExerciseViewController: UIViewController {

    @IBOutlet weak var exerciseTableView: UITableView!
    
    @IBOutlet weak var moduleTitleLabel: UILabel!
    @IBOutlet weak var moduleDurationLabel: UILabel!
    @IBOutlet weak var moduleDescLabel: UILabel!
    
    @IBOutlet weak var startButton: UIButton!
    
    var currentModule: ModuleModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
    
    func setupUI () {
        startButton.layer.cornerRadius = 8
        let nib = UINib(nibName: "ExerciseTableViewCell", bundle: nil)
        exerciseTableView.register(nib, forCellReuseIdentifier: "exerciseCellIdentifier")
        exerciseTableView.dataSource = self;
        exerciseTableView.delegate = self;
        
        moduleTitleLabel.text = currentModule?.title
        
        exerciseTableView.tableFooterView = UIView()
        
        if let duration = currentModule?.time, let desc = currentModule?.module_desc {
            moduleDurationLabel.text = "\(duration) Minutes"
            moduleDescLabel.text = desc
        }
    }
    
    func navigateToDetailExercise() {
        guard let module = currentModule else { return }
        let vc = DetailExerciseViewController()
        vc.module = module
        vc.exercise = module.exercise[0]
        vc.index = 0
        self.navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction func startModulePressed(_ sender: Any) {
        navigateToDetailExercise()
    }
    
}

extension ListExerciseViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let exerciseCount = currentModule?.exercise.count {
            return exerciseCount
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = exerciseTableView.dequeueReusableCell(withIdentifier: "exerciseCellIdentifier", for: indexPath) as! ExerciseTableViewCell
        
//        cell.delegate = self;
        if let exerciseList = currentModule?.exercise {
            cell.exercise = exerciseList[indexPath.row]
            return cell;
        } else {
            return cell
        }
    }
    
    
}
