//
//  FeestApp.swift
//  Feest
//
//  Created by Qj Stout-Spykers on 20/7/2023.
//

import Stitch
import SwiftUI

@main
struct FeestApp: App {
    var body: some Scene {
        WindowGroup {
            RootView(view: RecipeView())
        }
    }
}

func RootView(view: some View) -> some View {
    BackgroundColor {
        view
    }
    .frame(
        maxWidth: .infinity,
        maxHeight: .infinity
    )
}
