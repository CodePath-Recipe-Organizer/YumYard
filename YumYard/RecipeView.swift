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
                .background(Color(.systemGray6))
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
    }
}
struct RecipeView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeView()
    }
}
