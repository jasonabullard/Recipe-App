//
//  RecipeModel.swift
//  Recipe App
//
//  Created by Jason Bullard on 1/9/22.
//

import Foundation

final class RecipeModel: ObservableObject {
    
    @Published var recipes = [Recipe]()
    
    init() {
        
        // get local data
        let localData: [Recipe] = DataService.getLocalData(forResource: "recipes", ofType: "json")
        
        // generate unique id's for each recipe
        for r in localData {
            r.id = UUID()
            
            // generate unique id's for each ingredient in the recipe
            for i in r.ingredients {
                i.id = UUID()
            }
        }
        
        // Update recipes to local data retrieved from json file
        self.recipes = localData
        
    }
}
