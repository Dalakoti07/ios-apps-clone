//
//  ProjectEnv.swift
//  netflix clone
//
//  Created by Saurabh Dalakoti on 06/08/23.
//

import Foundation

protocol APIKeyable{
    var tmdb_api: String {get}
}

class BaseEnv{
    let dict: NSDictionary
    
    init(resourceName: String){
        guard let filePath = Bundle.main.path(forResource: resourceName, ofType: "plist"),
              let plist = NSDictionary(contentsOfFile: filePath) else{
            fatalError("Could not find file \(resourceName) plist")
        }
        self.dict = plist
    }
    
}

class DebugEnv: BaseEnv, APIKeyable{
    init(){
        super.init(resourceName: "env")
    }
    var tmdb_api: String{
        dict.object(forKey: "tmdb_api") as? String ?? ""
    }
}

class ProdEnv: BaseEnv, APIKeyable{
    init(){
        // todo although this file name should be different, but lets just keep it this way
        super.init(resourceName: "env")
    }
    var tmdb_api: String{
        dict.object(forKey: "tmdb_api") as? String ?? ""
    }
}
