//
//  Recipe.swift
//  mcChesneyK_GroceryList_v3.0
//
//  Created by Kristina McChesney on 3/15/20.
//  Copyright © 2020 Kristina McChesney. All rights reserved.
//
//  All recipes and photos are from hellofresh.com
//

import Foundation

// simple class that contains all information about recipe
class Recipe {
    var name: String = ""
    var ingredients: String = ""
    var description: String = ""
    var portions: Int = 0
    
    // initializer
    init(_ name: String, _ ingredients: String, _ description: String) {
        self.name = name
        self.ingredients = ingredients
        self.description = description
    }
    
    // don't know the portion in advance -> want to have a setter
    func setPortions(_ amount: Int) {
        portions = amount
    }
}
