//
//  QuizDetailViewController.swift
//  Quizzes
//
//  Created by Jason on 2/1/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class QuizDetailViewController: UIViewController {
    var uiSetUp = QuizDetail()
    var cellTest = QuizDetailCollectionViewCell()
    
    
    var factOne = false
        
    var factTwo = false

    var quiz: SaveModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(uiSetUp)
        uiSetUp.collectionOfFacts.register(QuizDetailCollectionViewCell.self, forCellWithReuseIdentifier: "QuizDetailCell")
        uiSetUp.collectionOfFacts.delegate = self
        uiSetUp.collectionOfFacts.dataSource = self


    }
    


}

extension QuizDetailViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (quiz?.facts.count)!
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = uiSetUp.collectionOfFacts.dequeueReusableCell(withReuseIdentifier: "QuizDetailCell", for: indexPath) as? QuizDetailCollectionViewCell else{return UICollectionViewCell() }
        
        cell.quizDetailText.text = quiz?.quizTitle
  
        
        return cell
    }
    
    
}

extension QuizDetailViewController: UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let test = uiSetUp.collectionOfFacts.cellForItem(at: indexPath) as! QuizDetailCollectionViewCell
        
        if indexPath.row == 0{
        if factOne == false {

            UIView.transition(with: uiSetUp.collectionOfFacts.cellForItem(at: indexPath)!, duration: 1.0, options: [.transitionFlipFromRight], animations: {
                test.quizDetailText.text = self.quiz?.facts[indexPath.row]

            })
            self.factOne = true
        }

         else {

            UIView.transition(with: uiSetUp.collectionOfFacts.cellForItem(at: indexPath)!, duration: 1.0, options: [.transitionFlipFromLeft], animations: {
                test.quizDetailText.text = self.quiz?.quizTitle

                })
            self.factOne = false

            }
        }
       if indexPath.row == 1 {
            if factTwo == false {
                
                UIView.transition(with: uiSetUp.collectionOfFacts.cellForItem(at: indexPath)!, duration: 1.0, options: [.transitionFlipFromRight], animations: {
                    test.quizDetailText.text = self.quiz?.facts[indexPath.row]
                    
                })
                self.factTwo = true
            }
                
            else {
                
                UIView.transition(with: uiSetUp.collectionOfFacts.cellForItem(at: indexPath)!, duration: 1.0, options: [.transitionFlipFromLeft], animations: {
                    test.quizDetailText.text = self.quiz?.quizTitle
                    
                })
                self.factTwo = false
                
            }
        }

    }
    
}
