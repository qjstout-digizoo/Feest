//
//  Loader.swift
//  Feest
//
//  Created by Qj Stout-Spykers on 30/7/2023.
//

import Foundation
import SwiftUI

func loader() -> some View {
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
}
