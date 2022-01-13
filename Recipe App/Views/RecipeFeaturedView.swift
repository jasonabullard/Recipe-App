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
        Text("Hello, World!")
    }
}

struct RecipeFeaturedView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeFeaturedView()
    }
}
