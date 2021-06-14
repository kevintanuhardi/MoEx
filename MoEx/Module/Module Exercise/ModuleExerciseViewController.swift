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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
