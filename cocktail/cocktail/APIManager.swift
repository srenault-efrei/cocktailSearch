//
//  APIManager.swift
//  cocktail
//
//  Created by Steven RENAULT on 01/04/2021.
//  Copyright © 2021 Steven RENAULT. All rights reserved.
//

import Foundation

class APIManager {
    
    static var shared = APIManager()
    
    private let baseURL = "https://www.thecocktaildb.com/api/json/v1/1/search.php?s="
    private let session = URLSession(configuration: .default)
    
    
    private func call<Data: Decodable>(_ path: String, completion: @escaping (Data?) -> Void) {
         guard let url = URL(string: "\(baseURL)\(path)") else {
                  completion(nil)
                  return
        }
        let task = session.dataTask(with: url) { (data, response, error) in
                  if let data = data {
                      do {
                          let decoder = JSONDecoder()
                          let cocktails = try decoder.decode(Data.self, from: data)
                          DispatchQueue.main.async { completion(cocktails) }
                      } catch (let error) {
                          print(error)
                          DispatchQueue.main.async { completion(nil) }
                          print("Deserialisation failed")
                      }
                  } else {
                      DispatchQueue.main.async { completion(nil) }
                      print("No data")
                  }
              }

  
              task.resume()
    }
    func getCocktailsByIngredient(ingredient: String, completion: @escaping (Cocktails?) -> (Void)) {
           self.call(ingredient, completion: completion)
       
       }
}


