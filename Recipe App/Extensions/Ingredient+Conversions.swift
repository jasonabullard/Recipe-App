//
//  Ingredient+Conversions.swift
//  Recipe App
//
//  Created by Jason Bullard on 1/15/22.
//

import Foundation

extension Ingredient {
    
    func getPortionSize(recipeServings: Int, targetServings: Int) -> String {
        
        var portion = ""
        var numerator = self.num ?? 1
        var denominator = self.denom ?? 1
        var wholePortions = 0
        
        if self.num != nil {
            
            // Get a single size by multiplying denominator by the recipe servings
            denominator *= recipeServings
            
            // Get portion size by multiplying numerator by single serving size
            numerator *= targetServings
            
            // Reduce fraction by greatest common divisor
            let divisor = Rational.greatestCommonDivisor(numerator, denominator)
            numerator /= divisor
            denominator /= divisor
            
            // Get the whole portion if numerator > denominator
            if (numerator >= denominator) {
                
                // Calculate whole portions
                wholePortions = numerator / denominator
                
                // Calculate remainder
                numerator = numerator % denominator
                
                portion += String(wholePortions)
            }
            
            // Express remainder as a fraction
            if numerator > 0 {
                
                // Assign remainder as fraction to the portion string
                portion += wholePortions > 0 ? " " : ""
                portion += "\(numerator)/\(denominator)"
            }
        }
        
        if var unit = self.unit {
            
            // calculate appropriate suffix
            if wholePortions > 1 {
                
                if unit.suffix(2) == "ch" {
                    unit += "es"
                } else if unit.suffix(1) == "f" {
                    unit = String(unit.dropLast()) + "ves"
                } else {
                    unit += "s"
                }
                
            }
            
            portion += self.num == nil && self.denom == nil ? "" : " "
            
            return portion + unit
        }
        
        
        return portion
        
    }
    
}
