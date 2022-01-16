//
//  RecipeDetailView.swift
//  Recipe App
//
//  Created by Jason Bullard on 1/9/22.
//

import SwiftUI

struct RecipeDetailView: View {
    
    var recipe: Recipe
    
    @State private var selectedServingSize = 2
    
    var body: some View {
        
        ScrollView {
            
            VStack (alignment: .leading) {
                
                // MARK: Recipe Image
                Image(recipe.image)
                    .resizable()
                    .scaledToFill()
                
                // MARK: Recipe Title
                Text(recipe.name)
                    .font(.title2)
                    .bold()
                    .padding()
                
                // MARK: Recipe Serving Size
                VStack (alignment: .leading) {
                    
                    Text("Select serving size:")
                    
                    Picker("", selection: $selectedServingSize) {
                        
                        Text("2").tag(2)
                        Text("4").tag(4)
                        Text("6").tag(6)
                        Text("8").tag(8)
                        
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .frame(width: 160)
                    
                }
                .padding()
                
                
                Divider()
                
                // MARK: Ingredients
                VStack (alignment: .leading) {
                    
                    Text("Ingredients")
                        .font(.title)
                        .padding(.bottom, 8)
                    
                    ForEach (recipe.ingredients) { i in
                        Text("- \(i.getPortionSize(recipeServings: recipe.servings, targetServings: selectedServingSize)) \(i.name.lowercased())")
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
            .onAppear {
                selectedServingSize = recipe.servings
            }
        }
        
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        
        // create a dummy recipe and pass into detail view preview
        let model = RecipeModel()
        
        RecipeDetailView(recipe: model.recipes[0])
    }
}
