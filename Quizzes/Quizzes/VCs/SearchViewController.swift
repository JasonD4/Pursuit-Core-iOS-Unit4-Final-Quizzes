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
        update()
          uiSearchSetUP.collectionOfQuizQuestions.register(SearchCollectionViewCell.self, forCellWithReuseIdentifier: "SearchCell")
        uiSearchSetUP.collectionOfQuizQuestions.dataSource = self
      
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
    
    @objc func alertAction(index: UIButton){
        let alert = UIAlertController(title: "Save?", message: "", preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction.init(title: "cancel", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction.init(title: "Save", style: .default){(save) in
            let saveing = SaveModel.init(id: self.questions[index.tag].id, userId: self.userName, quizTitle: self.questions[index.tag].quizTitle, facts: self.questions[index.tag].facts)
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
        
        cell.optionButtons.tag = indexPath.row

        cell.quizText.text = questions[indexPath.row].quizTitle
        cell.optionButtons.addTarget(self, action: #selector(alertAction), for: .touchUpInside)
        print(cell.optionButtons.tag)
        
        
        
        
        return cell
        
        
    }
    
    
}

