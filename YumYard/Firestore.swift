//
//  Firestore.swift
//  YumYard
//
//  Created by Daiana Besterekova on 22/04/2024.
//

import Firebase

// Function to initialize Firestore
func initializeFirestore() {
    // Find the path to the GoogleService-Info (2).plist file
    guard let filePath = Bundle.main.path(forResource: "GoogleService-Info (2)", ofType: "plist") else {
        print("GoogleService-Info (2).plist not found.")
        return
    }

    let fileURL = URL(fileURLWithPath: filePath)
    // Load FirebaseOptions from the GoogleService-Info (2).plist file
    guard let fileopts = FirebaseOptions(contentsOfFile: fileURL.path) else {
        print("Failed to load FirebaseOptions from GoogleService-Info (2).plist.")
        return
    }

    // Configure Firebase with the options from the GoogleService-Info (2).plist file
    FirebaseApp.configure(options: fileopts)
}

// Function to send recipe data to Firestore
func sendRecipeToFirestore(recipe: Recipe) {
    let db = Firestore.firestore()
    
    // Convert recipe to a dictionary
    let recipeData: [String: Any] = [
        "title": recipe.title,
        "ingredients": recipe.ingredients,
        "servings": recipe.servings,
        "isLiked": recipe.isLiked
    ]
    
    // Add the recipe data to the "recipes" collection in Firestore
    db.collection("recipes").addDocument(data: recipeData) { error in
        if let error = error {
            print("Error adding document: \(error)")
        } else {
            print("Recipe added to Firestore")
            print(recipeData)
        }
    }
}

