//
//  RecipeView.swift
//  YumYard
//
//  Created by Daiana Besterekova on 20/04/2024.
//

import SwiftUI
struct RecipeView: View {
    @State var foods = [Recipe]()

    var body: some View {
            List(foods) { food in
                VStack(alignment: .leading) {
                    Text(food.title)
                        .font(.title)
                        .fontWeight(.bold)
                    Text("\(food.ingredients)")
                        .font(.subheadline)
                        .fontWeight(.bold)
                    Text("\(food.servings)")
                        .font(.body)
                }
            }
            .onAppear() {
                apiCall().getRecipe { (foods) in
                    self.foods = foods
                }
            }
    }
}

struct RecipeView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeView()
    }
}
