//
//  SearchViewController.swift
//  Quizzes
//
//  Created by Jason on 2/1/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, Userprofile {
    var userName = ""
    func user(name: String) {
         userName = name
    }
    

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
    
    @objc func alertAction(){
        let alert = UIAlertController(title: "Save?", message: "", preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction.init(title: "cancel", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction.init(title: "Save", style: .destructive){(save) in
            
            let cell = SearchCollectionViewCell()
            
            let saveing = SaveModel.init(id: self.questions[cell.optionButtons.tag].id, userId: self.userName, quizTitle: self.questions[cell.optionButtons.tag].quizTitle, facts: self.questions[cell.optionButtons.tag].facts)
            SavingManager.appening(type: saveing)
            
            
        })
        self.present(alert, animated: true)
        
        
    }
    
 
}



extension SearchViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       return questions.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = uiSearchSetUP.collectionOfQuizQuestions.dequeueReusableCell(withReuseIdentifier: "SearchCell", for: indexPath) as? SearchCollectionViewCell else{return UICollectionViewCell() }
        
        cell.quizText.text = questions[indexPath.row].quizTitle
        cell.optionButtons.tag = indexPath.row
        cell.optionButtons.addTarget(self, action: #selector(alertAction), for: .touchUpInside)
        
        
        
        return cell
        
        
    }
    
    
}
