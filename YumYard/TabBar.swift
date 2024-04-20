//
//  TabBar.swift
//  YumYard
//
//  Created by Daiana Besterekova on 20/04/2024.
//

import SwiftUI

struct TabBar: View {
    var body: some View {
        TabView {
            
            NavigationView {
                RecipeView()
            }
                .tabItem {
                    Image(systemName: "carrot.fill")
                    Text("Recipes")
                }
         
            NavigationView {
                FavoritesView()
            }
                .tabItem {
                    Image(systemName: "heart.circle.fill")
                    Text("Favorites")
                }
            
            NavigationView {
                PlansView()
            }
                .tabItem {
                    Image(systemName: "menucard.fill")
                    Text("Plans")
                }
         
            NavigationView {
                AccountView()
            }
                .tabItem {
                    Image(systemName: "person.crop.circle")
                    Text("My Account")
                }
        }
        .accentColor(.green)
    }
}

#Preview {
    TabBar()
}
