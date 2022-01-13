//
//  Ingredient.swift
//  Recipe App
//
//  Created by Jason Bullard on 1/13/22.
//

import Foundation

final class Ingredient: Parseable {
    
    var id: UUID?
    var name: String
    var num: Int?
    var denom: Int?
    var unit: String?
    
}
