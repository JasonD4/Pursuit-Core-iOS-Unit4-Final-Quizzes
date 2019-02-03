//
//  TabBar.swift
//  Quizzes
//
//  Created by Jason on 2/1/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class TabBar: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let firstVC = QuizzesViewController()
        let secondVC = SearchViewController()
        let thirdVC = CreateViewController()
        let fourthVC = ProfileViewController()
        
        let nav = QuizesNavController.init(rootViewController: firstVC)
        let navTwo = CreateNavControllerViewController.init(rootViewController: thirdVC)
        self.viewControllers = [nav,secondVC,navTwo,fourthVC]
        firstVC.tabBarItem = UITabBarItem(title: "Quizzes", image: UIImage(named: "quiz-icon"), tag: 0)
        secondVC.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 1)
        thirdVC.tabBarItem = UITabBarItem(title: "Create", image: UIImage(named: "create-icon"), tag: 2)
        fourthVC.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(named: "profile-unfilled"), tag: 3)

    }
    



}
