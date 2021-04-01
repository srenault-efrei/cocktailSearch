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
}
