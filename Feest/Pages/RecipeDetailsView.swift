//
//  RecipeDetailsView.swift
//  Feest
//
//  Created by Qj Stout-Spykers on 30/7/2023.
//

import Stitch
import SwiftUI
import Foundation

struct RecipeDetailsView: View {
    public var recipe: Recipe

    var body: some View {
        BackgroundColor {
            VStack {
                recipeThumbnail(imageUrl: recipe.thumb)
                headerBodyElement(header: "Name", body: recipe.name)
                headerBodyElement(header: "Headline", body: recipe.headline)
                headerBodyElement(header: "Calories", body: recipe.calories)
                headerBodyElement(header: "Proteins", body: recipe.proteins)
                headerBodyElement(header: "Description", body: recipe.description)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        }
    }

    func recipeThumbnail(imageUrl: String) -> some View {
        AsyncImage(url: getImageUrl(urlString: recipe.thumb)) { image in
            image.resizable()
        } placeholder: {
            loader()
        }
        .border(Color.headings)
        .padding()
        .border(Color.headings)
        .padding()
    }

    func getImageUrl(urlString: String) -> URL {
        URL(string: urlString)!
    }

    func headerBodyElement(header: String, body: String) -> some View {
        HStack(alignment: .top) {
            VStack {
                Text(header.appending(":"))
                    .bold()
                    .foregroundColor(.headings)
            }
            .frame(width: 120, alignment: .trailing)
            Text(body)
                .foregroundColor(.text)
                .frame(maxWidth: .infinity, alignment: .topLeading)
        }
        .frame(maxWidth: .infinity)
    }
}

struct RecipeDetailsView_Previews: PreviewProvider {
    static let recipe = Recipe(calories: "516 kcal", carbos: "47 g", description: "There's nothing like the simple things in life - the smell of freshly cut grass, sitting outside on a nice sunny day, spending time with friends and family. Well here is a recipe that delivers simple culinary pleasures - some nice fresh fish with a crispy crust, crunchy potato wedges and some delightfully sweet sugar snap peas flavoured with cooling mint. Slip into something comfortable and relax into a delicious dinner!", difficulty: 0, fats: "8 g", headline: "with Sweet Potato Wedges and Minted Snap Peas", id: "533143aaff604d567f8b4571", image: "https://img.hellofresh.com/f_auto,q_auto/hellofresh_s3/image/533143aaff604d567f8b4571.jpg", name: "Crispy Fish Goujons", proteins: "43 g", thumb: "https://img.hellofresh.com/f_auto,q_auto,w_300/hellofresh_s3/image/533143aaff604d567f8b4571.jpg", time: "PT35M")
    

    static var previews: some View {
        RootView(view: RecipeDetailsView(recipe: recipe))
    }
}
