//
//  SearchCollectionViewCell.swift
//  Quizzes
//
//  Created by Jason on 2/1/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class SearchCollectionViewCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .yellow
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    lazy var quizText: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = NSTextAlignment.center
        return label
    }()
    
    lazy var optionButtons: UIButton = {
        let button = UIButton()
   
        button.setImage(UIImage(named: "add-icon-filled"), for: .normal)
        return button
    }()
    
    private func commonInit(){
        quizLabelConstrant()
        optionButtonsConstrant()
    }
    
    func quizLabelConstrant(){
        addSubview(quizText)
        quizText.translatesAutoresizingMaskIntoConstraints = false
        quizText.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        quizText.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        quizText.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        quizText.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.8).isActive = true
        
    }
    
    func optionButtonsConstrant(){
        addSubview(optionButtons)
        optionButtons.translatesAutoresizingMaskIntoConstraints = false
        optionButtons.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
        optionButtons.rightAnchor.constraint(equalTo: rightAnchor, constant: 0).isActive = true
        optionButtons.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.1).isActive = true
        optionButtons.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.1).isActive = true
    }
}
