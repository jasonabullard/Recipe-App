//
//  RecipeFeaturedView.swift
//  Recipe App
//
//  Created by Jason Bullard on 1/13/22.
//

import SwiftUI

struct RecipeFeaturedView: View {
    
    @EnvironmentObject private var model: RecipeModel
    
    var body: some View {
        
        VStack (alignment: .leading, spacing: 0) {
            
            Text("Featured Recipes")
                .fontWeight(.bold)
                .padding(.leading)
                .padding(.top, 40)
                .font(.largeTitle)
            
            GeometryReader { geo in
                TabView {
                    // iterate through filtered recipes that are featured
                    ForEach(model.recipes.filter({ r in
                        r.featured == true
                    })) { recipe in
                        
                        
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
                        .frame(width: geo.size.width - 40, height: geo.size.height - 100)
                        .cornerRadius(15)
                        .shadow(color: .black, radius: 10, x: -5, y: 5)
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            }
        
            VStack (alignment: .leading, spacing: 10) {
                
                Text("Preparation Time:")
                    .font(.headline)
                
                Text("1 hour")
                
                Text("Highlights")
                    .font(.headline)
                
                Text("Health, Hearty")
                
            }
            .padding([.leading, .bottom])
        }
        
    }
}

struct RecipeFeaturedView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeFeaturedView()
            .environmentObject(RecipeModel())
    }
}
