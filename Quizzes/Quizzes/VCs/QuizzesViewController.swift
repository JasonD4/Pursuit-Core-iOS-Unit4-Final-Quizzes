//
//  QuizzesViewController.swift
//  Quizzes
//
//  Created by Jason on 2/1/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class QuizzesViewController: UIViewController {
        var quizLayout = QuizesContollerView()
        
    var quizs = [SaveModel](){
        didSet{
            DispatchQueue.main.async{
                self.quizLayout.collectionOfQuizes.reloadData()
                
            }
        }
    }
        
        override func viewDidLoad() {
            super.viewDidLoad()
            view.addSubview(quizLayout)
            view.backgroundColor = .white
            quizs = SavingManager.loadTheEntry()
            quizLayout.collectionOfQuizes.delegate = self
            quizLayout.collectionOfQuizes.dataSource = self
            quizLayout.collectionOfQuizes.register(QuizQuestions.self, forCellWithReuseIdentifier: "QuizCells")
            // Do any additional setup after loading the view, typically from a nib.
        }
    override func viewWillAppear(_ animated: Bool) {
        quizs = SavingManager.loadTheEntry()

    }
    
    @objc func deletor(){
        let alert = UIAlertController(title: "Options", message: "", preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction.init(title: "cancel", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction.init(title: "delete", style: .destructive){(deleter) in
            let cell = QuizQuestions()
            SavingManager.removing(index: cell.optionButtons.tag )
            self.quizs = SavingManager.loadTheEntry()
            self.quizLayout.collectionOfQuizes.reloadData()

        })
        self.present(alert, animated: true)
        
        
        }
        
        
    }


    extension QuizzesViewController: UICollectionViewDataSource{
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return quizs.count
            
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            guard let cell = quizLayout.collectionOfQuizes.dequeueReusableCell(withReuseIdentifier: "QuizCells", for: indexPath) as? QuizQuestions else{return UICollectionViewCell() }
            cell.quizText.text = quizs[indexPath.row].quizTitle
            cell.optionButtons.tag = indexPath.row
            cell.optionButtons.addTarget(self, action: #selector(deletor), for: .touchUpInside)
            
            
            return cell
        }
        

}
extension QuizzesViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = QuizDetailViewController()
        
        vc.quiz = quizs[indexPath.row]
        
        self.navigationController?.pushViewController(vc, animated: true)

        
    }
}
