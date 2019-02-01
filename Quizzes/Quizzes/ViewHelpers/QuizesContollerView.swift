//
//  QuizesContollerView.swift
//  Quizzes
//
//  Created by Jason on 2/1/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class QuizesContollerView: UIView {


    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
        func commonInit(){
        ccollectionOfQuizesConstaints()
    }
    
    lazy var collectionOfQuizes: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: 200, height: 200)
        let collection = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collection.backgroundColor = .red
        
        return collection
    }()
    
    
  
    
    func ccollectionOfQuizesConstaints(){
        addSubview(collectionOfQuizes)
        
        collectionOfQuizes.translatesAutoresizingMaskIntoConstraints = false
        collectionOfQuizes.topAnchor.constraint(equalTo: topAnchor).isActive = true
        collectionOfQuizes.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        collectionOfQuizes.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        collectionOfQuizes.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
    }

}
