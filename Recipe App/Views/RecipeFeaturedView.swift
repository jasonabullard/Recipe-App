//
//  RecipeFeaturedView.swift
//  Recipe App
//
//  Created by Jason Bullard on 1/13/22.
//

import SwiftUI

struct RecipeFeaturedView: View {
    
    @EnvironmentObject private var model: RecipeModel
    
    @State private var showFeaturedRecipeSheet = false
    @State private var selectedRecipeIndex = 0
    
    var body: some View {
        
        VStack (alignment: .leading, spacing: 0) {
            
            Text("Featured Recipes")
                .fontWeight(.bold)
                .padding(.leading)
                .padding(.top, 40)
                .font(.largeTitle)
            
            GeometryReader { geo in
                TabView (selection: $selectedRecipeIndex) {
                    // iterate through filtered recipes that are featured
                    ForEach(0..<model.recipes.count) { index in
                        
                        if (model.recipes[index].featured == true) {
                            let recipe = model.recipes[index]
                            
                            Button {
                                showFeaturedRecipeSheet.toggle()
                            } label: {
                                ZStack {
                                    Rectangle()
                                        .foregroundColor(.white)
                                    
                                    VStack(spacing: 0) {
                                        
                                        Image(recipe.image)
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .clipped()
                                        
                                        Text(recipe.name)
                                            .padding(5)
                                        
                                    }
                                }
                            }
                            .tag(recipe.id)
                            .sheet(isPresented: $showFeaturedRecipeSheet) {
                                RecipeDetailView(recipe: recipe)
                            }
                            .buttonStyle(PlainButtonStyle())
                            .frame(width: geo.size.width - 40, height: geo.size.height - 100)
                            .cornerRadius(15)
                            .shadow(color: .black, radius: 10, x: -5, y: 5)
                        }
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            }
            
            VStack (alignment: .leading, spacing: 10) {
                
                Text("Preparation Time:")
                    .font(.headline)
                
                Text(model.recipes[selectedRecipeIndex].prepTime)
                
                Text("Highlights")
                    .font(.headline)
                
                Text(model.recipes[selectedRecipeIndex].highlights.joined(separator: ", "))
                
            }
            .padding([.leading, .bottom])
        }
        .onAppear {
            getFeaturedRecipeIndex()
        }
        
    }
    
    func getFeaturedRecipeIndex() {
        
        let index = model.recipes.firstIndex { recipe in
            return recipe.featured
        } ?? 0
        
        selectedRecipeIndex = index
    }
}

struct RecipeFeaturedView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeFeaturedView()
            .environmentObject(RecipeModel())
    }
}
