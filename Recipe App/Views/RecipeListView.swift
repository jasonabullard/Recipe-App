//
//  ContentView.swift
//  Recipe App
//
//  Created by Jason Bullard on 1/8/22.
//

import SwiftUI

struct RecipeListView: View {
    
    @EnvironmentObject private var model: RecipeModel
    
    var body: some View {
        
        NavigationView {
            
            List(model.recipes) { r in
                
                NavigationLink {
                    RecipeDetailView(recipe: r)
                } label: {
                    HStack (spacing: 20.0) {
                        
                        Image(r.image)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 50, height: 50, alignment: .center)
                            .clipped()
                            .cornerRadius(5)
                        
                        Text(r.name)
                        
                    }
                }
                
            }
            .navigationTitle("All Recipes")
        }
        .navigationViewStyle(.stack)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListView()
    }
}
