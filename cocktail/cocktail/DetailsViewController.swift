//
//  DetailsViewController.swift
//  cocktail
//
//  Created by Steven RENAULT on 02/04/2021.
//  Copyright © 2021 Steven RENAULT. All rights reserved.
//

import UIKit


class DetailsViewController: UIViewController {
    
    var cocktail: Cocktail?
    @IBOutlet weak var cocktailImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ingredientsText: UITextView!
    @IBOutlet weak var instructionsText: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let cocktail = self.cocktail {
            if let url = URL(string: cocktail.strDrinkThumb){
                do{
                    let data = try Data(contentsOf: url)
                    self.cocktailImageView.image = UIImage(data: data)
                }catch let err{
                    print("Error:  \(err)")
                }
            }
            self.ingredientsText.text = cocktail.ingredients
            self.nameLabel.text = cocktail.strDrink
            self.instructionsText.text = cocktail.strInstructions
        }
    }
    
}
