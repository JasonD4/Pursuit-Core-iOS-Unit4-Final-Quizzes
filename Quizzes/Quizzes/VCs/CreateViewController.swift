//
//  CreateViewController.swift
//  Quizzes
//
//  Created by Jason on 2/1/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class CreateViewController: UIViewController, Userprofile{
    var userName = ""

    func user(name: String) {
        userName = name
    }
    var facts = [String]()
    

    var uiSetUp = CreateSetUpView()
    var submit = UIButton()
    
    var cancel = UIButton()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(uiSetUp)
        test()
        let leftBarButton = UIBarButtonItem(customView: cancel)
        self.navigationItem.leftBarButtonItem = leftBarButton
        let rightBarButton = UIBarButtonItem(customView: submit)
        self.navigationItem.rightBarButtonItem = rightBarButton

        uiSetUp.factOne.delegate = self
        uiSetUp.factTwo.delegate = self
        uiSetUp.factTitle.delegate = self
    }
    
    func test(){
        title = "Create Post"
        cancel.setTitle("Cancel", for: .normal)
        cancel.setTitleColor(.black, for: .normal)
        cancel.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        cancel.addTarget(self, action: #selector(testing), for: .touchUpInside)

        submit.setTitle("Submit", for: .normal)
        submit.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        submit.setTitleColor(.black, for: .normal)
        submit.addTarget(self, action: #selector(testing), for: .touchUpInside)

    }
    
    @objc func testing(){
        //this works
        if uiSetUp.factOne.text! != "" && uiSetUp.factTwo.text != "" && uiSetUp.factTitle.text != ""{
            let alert = UIAlertController(title: "Save?", message: "", preferredStyle: .actionSheet)
            alert.addAction(UIAlertAction.init(title: "cancel", style: .cancel, handler: nil))
            alert.addAction(UIAlertAction.init(title: "Save", style: .default){(save) in        self.facts.append(self.uiSetUp.factOne.text!)
                self.facts.append(self.uiSetUp.factTwo.text!)
                let saveing = SaveModel.init(id: UUID.init().uuidString, userId: self.userName, quizTitle: self.uiSetUp.factTitle.text!, facts: self.facts)
                SavingManager.appening(type: saveing)
                self.facts.removeAll()
                self.uiSetUp.factTitle.text?.removeAll()
                self.uiSetUp.factOne.text?.removeAll()
                self.uiSetUp.factTwo.text?.removeAll()
            })
            self.present(alert, animated: true)
            
            
        }
        else{
            let alertTwo = UIAlertController(title: "You forgot something", message: "", preferredStyle: .actionSheet)
            alertTwo.addAction(UIAlertAction.init(title: "ok", style: .cancel, handler: nil))
            self.present(alertTwo, animated: true)

        }
    }


}
extension CreateViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if uiSetUp.factOne.text! != "" && uiSetUp.factTwo.text != "" && uiSetUp.factTitle.text != "" {
           
        }

        
        
        resignFirstResponder()
        return true
    }
}
