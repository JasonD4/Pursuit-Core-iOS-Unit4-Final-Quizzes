//
//  ProfileViewSetup.swift
//  Quizzes
//
//  Created by Jason on 2/1/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class ProfileViewSetup: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        self.backgroundColor = .blue
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
        
    }
    
    
    lazy var profileLabel: UILabel = {
        let label = UILabel()
        label.text = "Edit Photo"
        
        
        
        return label
    }()
    
    lazy var photoButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "placeholder-image"), for: .normal)
        button.clipsToBounds = true
        
        return button
    }()
    
    lazy var profileButton: UIButton = {
        let button = UIButton()
        button.setTitle("@username", for: .normal)
        return button
      
    }()
    
    func commonInit(){
        profileLabelConstraint()
        photoButtonConstraint()
       profileButtonConstraint()
    }
    
    func profileLabelConstraint(){
        addSubview(profileLabel)
        profileLabel.translatesAutoresizingMaskIntoConstraints = false
        profileLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 100).isActive = true
        profileLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: 10).isActive = true
        profileLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 10).isActive = true
        
    }
    
    func photoButtonConstraint(){
        addSubview(photoButton)
        photoButton.translatesAutoresizingMaskIntoConstraints = false
        photoButton.topAnchor.constraint(equalTo: profileLabel.bottomAnchor, constant: 15).isActive = true
        photoButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        photoButton.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.4).isActive = true
    }
    func profileButtonConstraint(){
        addSubview(profileButton)
        profileButton.translatesAutoresizingMaskIntoConstraints = false
        profileButton.topAnchor.constraint(equalTo: photoButton.bottomAnchor, constant: 80).isActive = true
        profileButton.rightAnchor.constraint(equalTo: rightAnchor, constant: 10).isActive = true
        profileButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 10).isActive = true
        
   }

}
