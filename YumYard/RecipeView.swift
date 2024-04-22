//
//  RecipeView.swift
//  YumYard
//
//  Created by Daiana Besterekova on 20/04/2024.
//

import SwiftUI

struct SearchBar: View {
    @Binding var searchText: String

    var body: some View {
        HStack {
            TextField("Search", text: $searchText)
                .padding(7)
                .padding(.horizontal, 25)
                .cornerRadius(8)
                .padding(.horizontal, 10)
                .overlay(
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 15)
                    }
                )
        }
    }
}

struct RecipeView: View {
    @State var foods = [Recipe]()
    @State private var searchText = ""
    // Define your default recipes here
    @State private var defaultText = "Chicken Soup"
    
    var body: some View {
        VStack{
            SearchBar(searchText: $searchText)

            List(foods.indices, id: \.self) { index in
                let food = foods[index]
                VStack(alignment: .leading) {
                    Text(food.title)
                        .font(.title)
                        .fontWeight(.bold)
                    Text(food.ingredients)
                    HStack {
                        Text("\(food.servings)")
                        Spacer()
                        Button {
                            toggleLikedState(for: index) // Toggle liked state for the specific item
                            if foods[index].isLiked {
                                sendRecipeToFirestore(recipe: foods[index]) // Send recipe to Firestore if liked
                            }
                        } label: {
                            Image(systemName: food.isLiked ? "heart.fill" : "heart")
                                .foregroundColor(food.isLiked ? .pink : .pink) // Change color based on liked state
                        }
                    }
                }
                .padding()
                .frame(height: 200)
            }
        }
        .onAppear() {
            apiCall().getRecipe(query: defaultText) { (foods) in
                self.foods = foods
            }
        }
        .onChange(of: searchText) {
            oldText, newText in
            apiCall().getRecipe(query: newText) { (foods) in
                self.foods = foods
            }
        }
    }
    
    private func toggleLikedState(for index: Int) {
        foods[index].isLiked.toggle() // Toggle liked state for the specific item
    }
}

struct RecipeView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeView()
    }
}
