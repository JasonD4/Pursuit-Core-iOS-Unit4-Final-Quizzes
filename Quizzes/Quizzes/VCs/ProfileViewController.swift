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
    var image = UIImagePickerController()
    var user: Userprofile?
    var profileSetUp = ProfileViewSetup()
    var texts = "kjnln"

    override func viewDidLoad() {
        super.viewDidLoad()
view.addSubview(profileSetUp)
        profileSetUp.profileButton.addTarget(self, action: #selector(profile), for: .touchUpInside)
        profileSetUp.photoButton.addTarget(self, action: #selector(showImageSelect), for: .touchUpInside)
        profileSetUp.photoButton.layer.cornerRadius = profileSetUp.photoButton.bounds.width/2.0
        image.delegate = self
        
    }
    
   @objc func showImageSelect (){
        present(image, animated: true, completion: nil)
    }
    @objc func profile(test: UITextField){
            let alert = UIAlertController(title: "Enter User Name", message: "", preferredStyle: .alert)
        
        
        alert.addTextField { (textField) in
            textField.text = ""
        }
//            alert.addAction(UIAlertAction.init(title: "cancel", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
            let textField = alert!.textFields![0] // Force unwrapping because we know it exists.
            let test = textField.text!
            UserDefaults.standard.set(test, forKey: UserSavedDefaultName.userDefault)
            print(test)
            self.profileSetUp.profileButton.setTitle(textField.text, for: .normal)
        }))
            self.present(alert, animated: true)
//
        
    }

}


extension ProfileViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            profileSetUp.photoButton.setImage(image, for: .normal)
        }
        else{
            print("original Image is nil")
        }
        
        
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
        
    }
}
