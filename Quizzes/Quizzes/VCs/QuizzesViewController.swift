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
        
    var test = [1,2,3]{
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
            quizLayout.collectionOfQuizes.delegate = self
            quizLayout.collectionOfQuizes.dataSource = self
            quizLayout.collectionOfQuizes.register(QuizQuestions.self, forCellWithReuseIdentifier: "QuizCells")
            // Do any additional setup after loading the view, typically from a nib.
        }
        
        
    }


    extension QuizzesViewController: UICollectionViewDataSource{
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return 4
            
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            guard let cell = quizLayout.collectionOfQuizes.dequeueReusableCell(withReuseIdentifier: "QuizCells", for: indexPath) as? QuizQuestions else{return UICollectionViewCell() }
            
            cell.quizText.text = "hi"
            
            
            
            return cell
        }
        

}
extension QuizzesViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = QuizDetailViewController()
        vc.test = indexPath.row
        
        self.navigationController?.pushViewController(vc, animated: true)

        
    }
}
