//
//  RecipeStore.swift
//  Feest
//
//  Created by Qj Stout-Spykers on 20/7/2023.
//

import Stitch
import Foundation

class RecipeStore: RecipeStoring {
    @Stitch(\.apiService) private var apiService

    @Published var recipes: [Recipe] = []

    @MainActor
    func fetchRecipes() async {
        guard let recipes = try? await apiService.fetchRecipes() else { return }
        self.recipes = recipes
    }
}
