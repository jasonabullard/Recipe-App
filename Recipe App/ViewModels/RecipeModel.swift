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
        
        // Get local data
        self.recipes = DataService.getLocalData(forResource: "recipes", ofType: "json")
        
    }
    
}
