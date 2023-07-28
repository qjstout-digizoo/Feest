//
//  RecipeStoring.swift
//  Feest
//
//  Created by Qj Stout-Spykers on 26/7/2023.
//

import Stitch
import Combine

protocol RecipeStoring: ObservableObject, AnyObservableObject {
    var recipes: [Recipe] { get set }
    func fetchRecipes() async
}

extension DependencyMap {
    private struct RecipeStoreKey: DependencyKey {
        static var dependency: any RecipeStoring = RecipeStore()
    }

    var store: any RecipeStoring {
        get { resolve(key: RecipeStoreKey.self) }
        set { register(key: RecipeStoreKey.self, dependency: newValue) }
    }
}
