//
//  ModuleExerciseViewController.swift
//  Project mc2 group 14
//
//  Created by Randy Efan Jayaputra on 07/06/21.
//

import UIKit

class ModuleExerciseViewController: UIViewController {

    @IBOutlet weak var moduleCardCollectionView: UICollectionView!
    
    var moduleList = [ModuleModel]()
    
    
    func seedData() {
        
        let exerciseList1 = [
            Exercise(title: "Push-Ups", thumb: #imageLiteral(resourceName: "push-up-illustration"), benefits: nil, equipment: nil, reps: 10, illustrations: nil, howTo: nil)
        ]
       
       let module1 = ModuleModel(title: "Initialization Exercise 1", thumb: #imageLiteral(resourceName: "row"), module_desc: "Initiation is a total body workout that recruits every major muscle group you have. It starts off feeling light and easy but the load on the muscles soon begins to pile up and you do need to dig deep in order to continue delivering great form. ", exercise: exerciseList1, time: 4, calories: 60)
        
        let module2 = ModuleModel(title: "not Initialization Exercise", thumb: #imageLiteral(resourceName: "squat"), module_desc: "Initiation is a total body workout that recruits every major muscle group you have. It starts off feeling light and easy but the load on the muscles soon begins to pile up and you do need to dig deep in order to continue delivering great form. ", exercise: nil, time: 4, calories: 60)
       
        moduleList.append(module1)
        moduleList.append(module2)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        seedData()
        let nib = UINib(nibName: "ModuleCardCell", bundle: nil)
        moduleCardCollectionView.register(nib, forCellWithReuseIdentifier: "moduleCardIdentifier")
        moduleCardCollectionView.dataSource = self;
        moduleCardCollectionView.delegate = self;
        
        moduleCardCollectionView.layer.cornerRadius = 10
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    private func navigateToListExercise(module: ModuleModel) {
        let listExerciseVC = ListExerciseViewController()
        
        listExerciseVC.currentModule = module;
        self.navigationController?.pushViewController(listExerciseVC, animated: true)
    }

}


extension ModuleExerciseViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return moduleList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = moduleCardCollectionView.dequeueReusableCell(withReuseIdentifier: "moduleCardIdentifier", for: indexPath) as! ModuleCardCell
        
        cell.delegate = self;
        cell.module = moduleList[indexPath.row]
        
        return cell;
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let currentModule = moduleList[indexPath.row]
        navigateToListExercise(module: currentModule)
    }
}

extension ModuleExerciseViewController: ModuleCardDelegate {
    func listButtonDidTap(module: ModuleModel) {
        navigateToListExercise(module: module)
    }
}

