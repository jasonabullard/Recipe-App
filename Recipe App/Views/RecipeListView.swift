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
            
            VStack(alignment: .leading) {
                Text("All Recipes")
                    .fontWeight(.bold)
                    .padding(.top, 40)
                    .font(.largeTitle)
                
                ScrollView {
                    LazyVStack(alignment: .leading) {
                        ForEach(model.recipes) { r in
                            
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
                                    
                                    VStack(alignment: .leading) {
                                        Text(r.name)
                                            .foregroundColor(.black)
                                        
                                        Text(r.description)
                                            .foregroundColor(.secondary)
                                            .lineLimit(1)
                                    }
                                    
                                }
                            }
                            
                        }
                    }
                }
            }
            .padding()
            .navigationBarHidden(true)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListView()
            .environmentObject(RecipeModel())
    }
}
