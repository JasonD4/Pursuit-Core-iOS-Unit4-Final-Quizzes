//
//  ProfileViewController.swift
//  Quizzes
//
//  Created by Jason on 2/1/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

protocol Userprofile {
    func user(name: String)
}

class ProfileViewController: UIViewController {
    var user: Userprofile!
    var profileSetUp = ProfileViewSetup()
    var texts = "kjnln"

    override func viewDidLoad() {
        super.viewDidLoad()
view.addSubview(profileSetUp)
        profileSetUp.profileButton.addTarget(self, action: #selector(profile), for: .touchUpInside)
        profileSetUp.photoButton.layer.cornerRadius = profileSetUp.photoButton.bounds.width/2.0

        // Do any additional setup after loading the view.
    }
    
    @objc func profile(){
            let alert = UIAlertController(title: "Enter User Name", message: "", preferredStyle: .alert)
        alert.addTextField(configurationHandler: { (text: UITextField) in
           text.allowsEditingTextAttributes = true
            print(text.text)
            })
//            alert.addAction(UIAlertAction.init(title: "cancel", style: .cancel, handler: nil))
            alert.addAction(UIAlertAction.init(title: "Save", style: .default){(saver) in

//                UserDefaults.standard.set(UUID(), forKey: texts)
//                self.user.user(name: texts)
                print(self.texts)
            })
            self.present(alert, animated: true)
//
        
    }

}
