//
//  BackgroundWrapper.swift
//  Feest
//
//  Created by Qj Stout-Spykers on 28/7/2023.
//

import SwiftUI

public struct BackgroundColor<Content: View>: View {
    let content: Content

    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }

    public var body: some View {
        ZStack {
            Color.background
                .ignoresSafeArea()
            content
        }
    }
}
