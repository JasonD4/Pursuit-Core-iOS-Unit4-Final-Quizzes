//
//  SearchSetUPView.swift
//  Quizzes
//
//  Created by Jason on 2/1/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class SearchSetUPView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func commonInit(){
        backgroundColor = .magenta
        ccollectionOfQuizQuestionsConstaints()
    }
    
    lazy var collectionOfQuizQuestions: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: 400, height: 400)
        let collection = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collection.backgroundColor = .magenta
        
        return collection
    }()
    
    
    
    
    func ccollectionOfQuizQuestionsConstaints(){
        addSubview(collectionOfQuizQuestions)
        
        collectionOfQuizQuestions.translatesAutoresizingMaskIntoConstraints = false
        collectionOfQuizQuestions.topAnchor.constraint(equalTo: topAnchor).isActive = true
        collectionOfQuizQuestions.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        collectionOfQuizQuestions.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        collectionOfQuizQuestions.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
    }

}
