//
//  ProfileViewController.swift
//  Quizzes
//
//  Created by Jason on 2/1/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    var profileSetUp = ProfileViewSetup()

    override func viewDidLoad() {
        super.viewDidLoad()
view.addSubview(profileSetUp)

        profileSetUp.photoButton.layer.cornerRadius = profileSetUp.photoButton.bounds.width/2.0

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
