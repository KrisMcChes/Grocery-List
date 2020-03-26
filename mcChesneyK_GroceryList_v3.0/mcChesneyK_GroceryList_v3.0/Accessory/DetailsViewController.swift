//
//  DetailsViewController.swift
//  mcChesneyK_GroceryList_v3.0
//
//  Created by Kristina McChesney on 3/15/20.
//  Copyright © 2020 Kristina McChesney. All rights reserved.
//
//  All recipes and photos are from hellofresh.com
//

import UIKit

// detailed description of the recipe
class DetailsViewController: UIViewController {
    
    @IBOutlet weak var recipeName: UILabel!
    @IBOutlet weak var portionAmount: UILabel!
    @IBOutlet weak var portionIncrementer: UIStepper!
    @IBOutlet weak var ingredientsTV: UITextView!
    @IBOutlet weak var descriptionTV: UITextView!
    var recipe: Recipe?
    var name: String = ""
    var p = 0 // want to keep track of the amount of portions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // amount of portions restricted to 12, but can be changed if needed
        portionIncrementer.minimumValue = 0
        portionIncrementer.maximumValue = 12
        
        // get the recipe object that was passed from the TableView
        if let r = recipe {
            
            // save and display recipe name
            name = r.name
            recipeName.text = name
            
            // display ingredients & description on the screen
            ingredientsTV.text = r.ingredients
            descriptionTV.text = r.description
            
            // update amount of portions, if previously was accessed
            p = r.portions
            portionAmount.text = String(p)
            portionIncrementer.value = Double(p)
        }
    }
    
    // increment or decrement amount of portions for this recipe
    @IBAction func amountOfPortionsChanged(_ sender: UIStepper) {
        
        p = Int(sender.value)
        portionAmount.text = String(p)
        // add chang to the recipe object
        recipe?.setPortions(p)
    }
}
