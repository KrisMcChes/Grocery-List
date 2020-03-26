//
//  ChosenRecipesViewController.swift
//  mcChesneyK_GroceryList_v3.0
//
//  Created by Kristina McChesney on 3/16/20.
//  Copyright © 2020 Kristina McChesney. All rights reserved.
//
//  All recipes and photos are from hellofresh.com
//

import UIKit

// displaying the list of recipes that user chose
class ChosenRecipesViewController: UIViewController {
    
    @IBOutlet weak var finalRecipeList: UITextView!
    // to keep track of the recipes that user chose
    var chosenRecipes: [Recipe] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // update information
    override func viewWillAppear(_ animated: Bool) {
        getFinalList()
        displayList()
    }
    
    // go through the list of recipes and get ones where amont of portions was altered
    func getFinalList() {
        for r in recipes {
            if r.portions != 0 {
                chosenRecipes += [r]
                print(r.name)
            }
        }
    }
    
    // display recipes on the screen
    func displayList() {
        var finalList:String = ""
        
        for r in chosenRecipes {
            finalList += "- "
            finalList += r.name
            finalList += " - "
            finalList += String(r.portions)
            finalList += " portions\n"
        }
        finalRecipeList.text = finalList
    }
    
     // MARK: - Navigation
     
     // prepare for next segue
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // if next view is Grosery List -> send updated list of recipes
        guard let groceryListTableViewController = segue.destination as? GroceryListTableViewController else {return}
        groceryListTableViewController.list = chosenRecipes
     }
}
