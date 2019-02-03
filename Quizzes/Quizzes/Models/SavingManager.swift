//
//  SavingManager.swift
//  Quizzes
//
//  Created by Jason on 2/2/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import Foundation

final class SavingManager{
    private init(){}
    private static let saving = "Saved.plist"
    private static var save = [SaveModel]()
    
    static func removing(index:Int){
        save.remove(at: index)
        saveTheEntry()
    }
    static func appening(type : SaveModel){
        save.append(type)
        saveTheEntry()
    }
    
    static func saveTheEntry(){
        
        let pathToSaveTo = DataPersistenceManager.filepathToDocumentsDiretory(filename: saving)
        do{
            let favoriteQuiz = try PropertyListEncoder().encode(save)
            try favoriteQuiz.write(to: pathToSaveTo, options: Data.WritingOptions.atomic)
        }catch{
            print("error in the static function saveTheEntry: \(error)")
        }
    }
    
    static func loadTheEntry() -> [SaveModel]{
        
        let path = DataPersistenceManager.filepathToDocumentsDiretory(filename: saving).path
        if FileManager.default.fileExists(atPath: path){
            if let data = FileManager.default.contents(atPath: path){
                do{
                    save = try PropertyListDecoder().decode([SaveModel].self, from: data)
                }catch{
                    print(error)
                }
            }else{
                print("LoadtheEntry func data area is nil")
            }
        }
        else{
            print("\(saving) does not exsist")
        }
        return save
    }
}
