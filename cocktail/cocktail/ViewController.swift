    //
    //  ViewController.swift
    //  cocktail
    //
    //  Created by Steven RENAULT on 01/04/2021.
    //  Copyright © 2021 Steven RENAULT. All rights reserved.
    //
    
    import UIKit
    
    class ViewController: UIViewController, UITableViewDataSource, UISearchBarDelegate {
        
        @IBOutlet weak var tableView: UITableView!
        @IBOutlet weak var searchBar: UISearchBar!

        private var cocktails: Cocktails?
        
        override func viewDidLoad() {
            super.viewDidLoad()
            tableView.dataSource = self
            tableView.tableFooterView = UIView()
        }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return cocktails?.drinks.count ?? 0
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cocktailCell", for: indexPath)
            let cocktail = cocktails?.drinks[indexPath.row]
            cell.textLabel?.text = cocktail?.strDrink ?? "no name"            
            return cell
        }
        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            
            if let text = searchBar.text {
                if(text == ""){
                    self.cocktails = nil
                    self.tableView.reloadData()
                }else{
                    APIManager.shared.getCocktailsByIngredient(ingredient: text, completion: { (cocktails) -> (Void) in
                        if let cocktails = cocktails {
                            self.cocktails = cocktails
                            self.tableView.reloadData()
                            
                        }else{
                            print("could not fetch cocktails")
                        }
                    })
                }
            }
        }
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            guard let cell = sender as? UITableViewCell else{ return }

            if let index = self.tableView.indexPath(for: cell)?.row{
                if let viewController = segue.destination as? DetailsViewController{
                    viewController.cocktail = self.cocktails?.drinks[index]
                }
            }
        }
    }
    
