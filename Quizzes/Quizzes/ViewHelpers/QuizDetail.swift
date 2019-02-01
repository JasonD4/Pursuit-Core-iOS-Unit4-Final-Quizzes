//
//  QuizDetail.swift
//  Quizzes
//
//  Created by Jason on 2/1/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class QuizDetail: UIView {

    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    lazy var collectionOfFacts: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: 400, height: 400)
        let collection = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collection.backgroundColor = .red
        
        return collection
    }()

    
    func commonInit(){
        collectionOfFactsConstaints()
    }
    
    func collectionOfFactsConstaints(){
        addSubview(collectionOfFacts)
        collectionOfFacts.translatesAutoresizingMaskIntoConstraints = false
        collectionOfFacts.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        collectionOfFacts.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true
        collectionOfFacts.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        collectionOfFacts.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
    }
  

}
