//
//  CreateSetUpView.swift
//  Quizzes
//
//  Created by Jason on 2/1/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class CreateSetUpView: UIView {

    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        self.backgroundColor = .white
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    lazy var factTitle: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter the topic of your fact"

        
        
        return textField
    }()
    
    lazy var factOne: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter first fact"
        textField.textColor = .white
        textField.backgroundColor = .blue
        
        return textField
    }()
    
    lazy var factTwo: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter second fact"
        textField.textColor = .white
        textField.backgroundColor = .blue

        return textField
    }()
    func commonInit(){
        factTitleConstraint()
        factOneConstraint()
        factTwoConstraint()
    }

    func factTitleConstraint(){
        addSubview(factTitle)
        factTitle.translatesAutoresizingMaskIntoConstraints = false
        factTitle.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 15).isActive = true
        factTitle.rightAnchor.constraint(equalTo: rightAnchor, constant: 10).isActive = true
        factTitle.leftAnchor.constraint(equalTo: leftAnchor, constant: 10).isActive = true
        
    }
    
    func factOneConstraint(){
        addSubview(factOne)
        factOne.translatesAutoresizingMaskIntoConstraints = false
        factOne.topAnchor.constraint(equalTo: factTitle.bottomAnchor, constant: 15).isActive = true
        factOne.rightAnchor.constraint(equalTo: rightAnchor, constant: 10).isActive = true
        factOne.leftAnchor.constraint(equalTo: leftAnchor, constant: 10).isActive = true
        factOne.heightAnchor.constraint(equalToConstant: 250).isActive = true
    }
    func factTwoConstraint(){
        addSubview(factTwo)
        factTwo.translatesAutoresizingMaskIntoConstraints = false
        factTwo.topAnchor.constraint(equalTo: factOne.bottomAnchor, constant: 80).isActive = true
        factTwo.rightAnchor.constraint(equalTo: rightAnchor, constant: 10).isActive = true
        factTwo.leftAnchor.constraint(equalTo: leftAnchor, constant: 10).isActive = true
        factTwo.heightAnchor.constraint(equalToConstant: 250).isActive = true
    }
}
