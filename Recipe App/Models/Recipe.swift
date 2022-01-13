//
//  Recipe.swift
//  Recipe App
//
//  Created by Jason Bullard on 1/8/22.
//

import Foundation

final class Recipe: Parseable {
    
    var id: UUID?
    var name: String
    var featured: Bool
    var image: String
    var description: String
    var prepTime: String
    var cookTime: String
    var totalTime: String
    var servings: Int
    var ingredients: [String]
    var directions: [String]
}
