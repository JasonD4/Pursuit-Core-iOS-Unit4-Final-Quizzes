//
//  QuizDetailCollectionViewCell.swift
//  Quizzes
//
//  Created by Jason on 2/1/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class QuizDetailCollectionViewCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .blue
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    lazy var quizDetailText: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = NSTextAlignment.center
        
        return label
    }()
    
    private func commonInit(){
        quizLabelConstrant()
    }
    
    func quizLabelConstrant(){
        addSubview(quizDetailText)
        quizDetailText.translatesAutoresizingMaskIntoConstraints = false
        quizDetailText.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        quizDetailText.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        quizDetailText.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        quizDetailText.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor).isActive = true
        
    }
}
