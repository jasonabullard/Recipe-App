//
//  DataService.swift
//  Recipe App
//
//  Created by Jason Bullard on 1/9/22.
//

import Foundation

final class DataService {
    
    static func getLocalData<T: Parseable>(forResource resourceFileName: String, ofType resourceFileExt: String) -> [T] {
        
        // 1. Get the path to the json file within the app bundle
        let path = Bundle.main.path(forResource: resourceFileName, ofType: resourceFileExt)
        
        // 2. Use guard to check path for nil
        guard path != nil else {
            return [T]()
        }
        
        // 3. Get url object from the path within the app bundle
        let url = URL(fileURLWithPath: path!)
        
        do {
            // 4. Use a do..catch to create a data object from the url
            let data = try Data(contentsOf: url)
            
            // 5. Create a new JSONDecoder object
            let decoder = JSONDecoder()
            
            do {
                // 6. Use a do..catch to decode the JSON object
                let jsonData = try decoder.decode([T].self, from: data)
                
                // 7. Generate unique id's for the json data
//                for var obj in jsonData {
//                    obj.id = UUID()
//                }
                
                // 8. Return the decoded data
                return jsonData
            }
            catch {
                print("Error decoding json data: \(error)")
            }
        }
        catch {
            print("Error creating data object from url: \(error)")
        }
        
        // Return empty array if unable to load data from json file
        return [T]()
        
    }
    
}
