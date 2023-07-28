//
//  API.swift
//  Feest
//
//  Created by Qj Stout-Spykers on 20/7/2023.
//

import Stitch
import Foundation

struct ApiService {
    enum RecipeError: Error {
        case invalidData
        case invalidResponse
        case invalidUrl
        case notFound
    }

    public func fetchRecipes() async throws -> [Recipe] {
        guard let url = URL(string: "https://hf-android-app.s3-eu-west-1.amazonaws.com/android-test/recipes.json") else {
            throw RecipeError.invalidUrl
        }

        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw RecipeError.invalidResponse
        }
        
        do {
           return try JSONDecoder().decode([Recipe].self, from: data)
        } catch {
            throw RecipeError.invalidData
        }
    }
}

extension DependencyMap {
    private struct ApiServiceKey: DependencyKey {
        static var dependency: ApiService = ApiService()
    }

    var apiService: ApiService {
        get { resolve(key: ApiServiceKey.self) }
        set { register(key: ApiServiceKey.self, dependency: newValue) }
    }
}
