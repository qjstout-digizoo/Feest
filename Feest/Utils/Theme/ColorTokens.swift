//
//  ColorTokens.swift
//  Feest
//
//  Created by Qj Stout-Spykers on 27/7/2023.
//

import Foundation
import SwiftUI

internal struct ColorTokens {
    static let jet = Color(0x2b2b2b)
    static let sunset = Color(0xfec786)
    static let seasalt = Color(0xf6f6f6)
    static let ashGrey = Color(0xbbc2ba)
}

extension Color {
    init(_ hex: UInt, alpha: Double = 1) {
        self.init(
            red: Double((hex >> 16) & 0xff) / 255,
            green: Double((hex >> 08) & 0xff) / 255,
            blue: Double((hex >> 00) & 0xff) / 255,
            opacity: alpha
        )
    }
}
