//
//  RecipeBuild.swift
//  YumYard
//
//  Created by Daiana Besterekova on 21/04/2024.
//

import Foundation
import SwiftUI

struct Recipe: Codable, Identifiable {
    var id = UUID() // Adding a unique identifier
    var title: String
    var ingredients: String // Change the data type to String
    var servings: String
    var instructions: String
    var isLiked: Bool = false
    
    // Custom initializer to conform to Decodable
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.title = try container.decode(String.self, forKey: .title)
        self.ingredients = try container.decode(String.self, forKey: .ingredients)
        self.servings = try container.decode(String.self, forKey: .servings)
        self.instructions = try container.decode(String.self, forKey: .instructions)
    }

    // Define CodingKeys if the property names don't match the JSON keys
    enum CodingKeys: String, CodingKey {
        case title
        case ingredients
        case servings
        case instructions
    }
}
