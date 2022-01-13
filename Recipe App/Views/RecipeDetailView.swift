//
//  RecipeDetailView.swift
//  Recipe App
//
//  Created by Jason Bullard on 1/9/22.
//

import SwiftUI

struct RecipeDetailView: View {
    
    var recipe: Recipe
    
    var body: some View {
        
        ScrollView {
            
            VStack (alignment: .leading) {
                // MARK: Recipe Image
                Image(recipe.image)
                    .resizable()
                    .scaledToFill()
                
                // MARK: Ingredients
                VStack (alignment: .leading) {
                    
                    Text("Ingredients")
                        .font(.title)
                        .padding(.bottom, 8)
                    
                    ForEach (recipe.ingredients) { i in
                        Text("- " + i.name)
                    }
                }
                .padding([.horizontal, .top])
                
                Divider()
                
                // MARK: Directions
                VStack (alignment: .leading) {
                    
                    Text("Directions")
                        .font(.title)
                        .padding(.bottom, 8)
                    
                    ForEach (0..<recipe.directions.count, id: \.self) { index in
                        Text("\(String(index+1)). " + recipe.directions[index])
                            .padding(.bottom, 1)
                    }
                }
                .padding([.horizontal, .top])
            }
        }
        .navigationTitle(recipe.name)
        
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        
        // create a dummy recipe and pass into detail view preview
        let model = RecipeModel()
        
        RecipeDetailView(recipe: model.recipes[0])
    }
}
