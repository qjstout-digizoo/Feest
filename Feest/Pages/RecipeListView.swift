//
//  RecipeView.swift
//  Feest
//
//  Created by Qj Stout-Spykers on 20/7/2023.
//

import Stitch
import SwiftUI

struct RecipeListView: View {
    @StitchObservable(\.store) var store

    var body: some View {
            if store.recipes.count == 0 {
                loader()
                    .task {
                    await store.fetchRecipes()
                }
            } else {
                recipeList()
            }
    }

    func recipeList() -> some View {
        NavigationStack {
            List {
                ForEach(store.recipes, id: \.id) { recipe in
                    NavigationLink(value: recipe) {
                        item(for: recipe)
                    }
                    .navigationDestination(for: Recipe.self) {recipe in
                        RecipeDetailsView(recipe: recipe)
                    }
                }
                .listRowBackground(Color.background)
            }
            .listStyle(.plain)
            .padding(.leading)
            .background(Color.background)
            .scrollContentBackground(.hidden)
        }
    }

    func item(for recipe: Recipe) -> some View {
        HStack {
            VStack(alignment: .leading) {
                Text(recipe.name)
                    .font(.title3)
                    .bold()
                    .foregroundColor(.headings)
                    .frame(
                        maxWidth: .infinity,
                        alignment: .leading
                    )
                Text(recipe.headline)
                    .font(.subheadline)
                    .italic()
                    .foregroundColor(.text)
            }
            .frame(width: 250.0)
            VStack {
                Spacer()
                Text(recipe.calories)
                    .font(.footnote)
                    .foregroundColor(.headings)
                    .padding(.bottom, 8.0)
            }
        }
        .background(Color.background)
        .frame(alignment: .leading)
    }
}

struct RecipeView_Previews: PreviewProvider {
    static var previews: some View {
        RootView(view: RecipeListView())
    }
}
