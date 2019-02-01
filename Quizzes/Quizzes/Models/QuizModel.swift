//
//  QuizModel.swift
//  Quizzes
//
//  Created by Jason on 2/1/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import Foundation

struct QuizModel: Codable {
    let id: String
    let quizTitle: String
    let facts: [String]
}
