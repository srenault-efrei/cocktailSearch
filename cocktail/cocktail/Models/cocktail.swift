//
//  cocktail.swift
//  cocktail
//
//  Created by Steven RENAULT on 01/04/2021.
//  Copyright © 2021 Steven RENAULT. All rights reserved.
//

import Foundation

struct Cocktails: Decodable {
    let drinks: [Cocktail]
}

struct Cocktail: Decodable {
    let strDrink: String
    let strInstructions: String
    let strDrinkThumb: String
    let strIngredient1: String?
    let strIngredient2: String?
    let strIngredient3: String?
    let strIngredient4: String?
    let strIngredient5: String?
    let strIngredient6: String?
    let strIngredient7: String?
    let strIngredient8: String?
    let strIngredient9: String?
    let strIngredient10: String?
    let strIngredient11: String?
    let strIngredient12: String?
    let strIngredient13: String?
    let strIngredient14: String?
    let strIngredient15: String?
    
    var ingredients: String {
        return " \(strIngredient1 ?? "")\n \(strIngredient2 ?? "")\n \(strIngredient3 ?? "")\n \(strIngredient4 ?? "")\n \(strIngredient5 ?? "")\n \(strIngredient6 ?? "")\n \(strIngredient7 ?? "")\n \(strIngredient8 ?? "")\n \(strIngredient9 ?? "")\n \(strIngredient11 ?? "")\n \(strIngredient12 ?? "")\n \(strIngredient13 ?? "")\n \(strIngredient14 ?? "")\n \(strIngredient15 ?? "")\n"
    }
}
