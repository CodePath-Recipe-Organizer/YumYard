//
//  Recipe API.swift
//  YumYard
//
//  Created by Daiana Besterekova on 21/04/2024.
//

import Foundation

class apiCall: ObservableObject {
    @Published var foods = [Recipe]()

    func getRecipe(completion: @escaping ([Recipe]) -> ()) {
        let query = "italian wedding soup".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        let url = URL(string: "https://api.api-ninjas.com/v1/recipe?query=" + (query ?? ""))!
        var request = URLRequest(url: url)
        request.setValue("c4DZ5e6Uq3RvCrR89OLnww==536rNPsLQWvwsPwG", forHTTPHeaderField: "X-Api-Key")
        let task = URLSession.shared.dataTask(with: request) {(data, response, error) in
            guard let data = data else { return }
            do {
                let decoder = JSONDecoder()
                let decodedData = try decoder.decode([Recipe].self, from: data)
                DispatchQueue.main.async {
                    completion(decodedData)
                }
            } catch {
                print("Error decoding JSON: \(error)")
            }
        }
        task.resume()
    }
}
