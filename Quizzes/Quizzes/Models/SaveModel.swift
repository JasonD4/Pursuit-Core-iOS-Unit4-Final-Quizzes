//
//  SaveModel.swift
//  Quizzes
//
//  Created by Jason on 2/2/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import Foundation

struct SaveModel: Codable {
    let id: String
    let userId: String
    let quizTitle: String
    let facts: [String]
}
