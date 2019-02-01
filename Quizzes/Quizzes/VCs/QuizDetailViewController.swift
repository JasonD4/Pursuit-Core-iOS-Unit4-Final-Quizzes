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
var cell = QuizDetailCollectionViewCell()
var factOne = false
var factTwo = false
    
    var test = 2
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(uiSetUp)
        uiSetUp.collectionOfFacts.register(QuizDetailCollectionViewCell.self, forCellWithReuseIdentifier: "QuizDetailCell")
        uiSetUp.collectionOfFacts.dataSource = self
        uiSetUp.collectionOfFacts.delegate = self
        
    }
    


}

extension QuizDetailViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = uiSetUp.collectionOfFacts.dequeueReusableCell(withReuseIdentifier: "QuizDetailCell", for: indexPath) as? QuizDetailCollectionViewCell else{return UICollectionViewCell() }
        
        
        cell.quizDetailText.text = "hi"
        
        
        
        return cell
    }
    
    
}

extension QuizDetailViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row)
        if factOne  == false {
            UIView.transition(with: uiSetUp.collectionOfFacts.cellForItem(at: indexPath) ?? cell, duration: 1.0, options: [.transitionFlipFromRight], animations: {
                self.cell.quizDetailText.text = "4"
                self.factOne = true
            })
        }
        else{
            UIView.transition(with: uiSetUp.collectionOfFacts.cellForItem(at: indexPath) ?? cell, duration: 1.0, options: [.transitionFlipFromLeft], animations: {
                self.cell.quizDetailText.text = "3"
                self.factOne = false
                
            })
        }
    }
}
