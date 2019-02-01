//
//  QuizAPI.swift
//  Quizzes
//
//  Created by Jason on 2/1/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import Foundation

final class QuizAPI{
    private init (){}
    
    static func apiDecoding(complete: @escaping(AppError?, [QuizModel]?) -> Void){
        var model = [QuizModel]()
        NetworkHelper.shared.performDataTask(endpointURLString: "http://5c4d4c0d0de08100147c59b5.mockapi.io/api/v1/quizzes", httpMethod: "GET", httpBody: nil) { (error, data) in
            if let error = error{
                complete(error,nil)
            }
            if let data = data{
                do{
                    model = try JSONDecoder().decode([QuizModel].self, from: data)
                    complete(nil, model)
                    
                }
                catch{
                    complete(AppError.jsonDecodingError(error), nil)
                }
            }
        }
    }
}
