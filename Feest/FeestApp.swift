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
            RootView(view: RecipeListView())
        }
    }
}

func RootView(view: some View) -> some View {
    BackgroundColor {
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
            view
        }
    }
    .frame(
        maxWidth: .infinity,
        maxHeight: .infinity
    )
}
