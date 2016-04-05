//
//  Phrase.swift
//  EMILYlingo
//
//  Created by ali.anish91 on 4/4/16.
//  Copyright © 2016 EMILYlingo. All rights reserved.
//

import UIKit

class Phrase {
    var phraseName : String = ""
    var language : String = ""
    var time : String = ""
    var flag : UIImage?
    var gender : UIImage?
    
    init?(phraseName: String, language: String, time: String, flag: UIImage?, gender: UIImage?){
        self.phraseName = phraseName
        self.language = language
        self.time = time
        self.flag = flag
        self.gender = gender
        
        if phraseName.isEmpty || language.isEmpty {
            return nil
        }
    }
}
