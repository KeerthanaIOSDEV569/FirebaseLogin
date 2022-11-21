//
//  LocalManager.swift
//  Carrier
//
//  Created by Siddu Lakshmi Keerthana on 20/11/22.
//

import Foundation

class LocalManager{
    
    /// singletone
    static let shared = LocalManager()
    private init(){
        
    }
    //MARK: - create json from Excel sheet data
    /// for dummy assignment Data i have created local json from given assignment  Excel sheet
    
    func loadJsonFile(completionBlock: @escaping (_ response: [[String:Any]]) -> Void){
        if let path = Bundle.main.path(forResource: "assignment_data", ofType: "json") {
            do {
                  let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                  let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                completionBlock(jsonResult as! [[String:Any]])
              } catch {
                   // handle error
              }
        }
        
    }
    
}
