//
//  SearchViewController.swift
//  Quizzes
//
//  Created by Jason on 2/1/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {

    var uiSearchSetUP = SearchSetUPView()
    
    var questions = [QuizModel](){
        didSet{
            DispatchQueue.main.async {
            self.uiSearchSetUP.collectionOfQuizQuestions.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
view.addSubview(uiSearchSetUP)
        uiSearchSetUP.collectionOfQuizQuestions.dataSource = self
        uiSearchSetUP.collectionOfQuizQuestions.register(SearchCollectionViewCell.self, forCellWithReuseIdentifier: "SearchCell")
        update()
    }
    func update(){
        QuizAPI.apiDecoding { (error, model) in
            if let error = error{
                print(error)
            }
            else if let model = model{
                self.questions = model
            }
        }
    }
    



}

extension SearchViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       return questions.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = uiSearchSetUP.collectionOfQuizQuestions.dequeueReusableCell(withReuseIdentifier: "SearchCell", for: indexPath) as? SearchCollectionViewCell else{return UICollectionViewCell() }
        
        cell.quizText.text = questions[indexPath.row].quizTitle
        
        
        
        return cell
    }
    
    
}
