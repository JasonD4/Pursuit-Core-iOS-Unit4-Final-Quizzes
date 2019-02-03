//
//  CreateViewController.swift
//  Quizzes
//
//  Created by Jason on 2/1/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class CreateViewController: UIViewController {

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
        print(2)
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
