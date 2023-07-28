//
//  RecipeView.swift
//  Feest
//
//  Created by Qj Stout-Spykers on 20/7/2023.
//

import Stitch
import SwiftUI

struct RecipeView: View {
    @StitchObservable(\.store) var store

    var body: some View {
        VStack {
            Text("Feest")
                .frame(
                    maxWidth: .infinity,
                    alignment: .leading
                )
                .padding(.leading)
                .font(.title)
                .italic()
                .foregroundColor(.accent)
            Divider()
                .padding()
                .frame(width: 320.0, height: 1.0)
                .background(Color.headings)
            
            if store.recipes.count == 0 {
                BackgroundColor {
                    VStack {
                        ProgressView {
                            Text("Loading...")
                                .foregroundColor(.text)
                                .italic()
                        }
                        .padding(.top)
                        .progressViewStyle(CircularProgressViewStyle(tint: Color.headings))
                        Spacer()
                    }
                }
                .task {
                    await store.fetchRecipes()
                }
            } else {
                NavigationStack {
                    List {
                        ForEach(store.recipes, id: \.id) { recipe in
                            NavigationLink(value: recipe) {
                                item(for: recipe)
                            }
                            .navigationDestination(for: Recipe.self) { recipe in
    //                                        itemDetails(for: recipe)
                                Text(recipe.name)
                            }
                        }
                        .listRowBackground(Color.background)
                        .accentColor(Color.red)
                    }
                    .listStyle(.plain)
                    .padding(.leading)
                    .background(Color.background)
                    .scrollContentBackground(.hidden)
                }
            }
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
            .frame(width: 260.0)
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

    func itemDetails(for recipe: Recipe) -> some View {
        Text("This is some text")
    }
}

struct RecipeView_Previews: PreviewProvider {
    static var previews: some View {
        RootView(view: RecipeView())
    }
}
