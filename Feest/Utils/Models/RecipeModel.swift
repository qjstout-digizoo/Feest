//
//  RecipeModel.swift
//  Feest
//
//  Created by Qj Stout-Spykers on 20/7/2023.
//

import Foundation

struct Recipe: Decodable, Hashable {
    let calories: String
    let carbos: String
    let description: String
    let difficulty: Int
    let fats: String
    let headline: String
    let id: String
    let image: String
    let name: String
    let proteins: String
    let thumb: String
    let time: String
}
