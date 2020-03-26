//
//  GroceryListTableViewController.swift
//  mcChesneyK_GroceryList_v3.0
//
//  Created by Kristina McChesney on 3/16/20.
//  Copyright © 2020 Kristina McChesney. All rights reserved.
//
//  All recipes and photos are from hellofresh.com
//

import UIKit

// grocery list table view cell
class GroceryReusableCell: UITableViewCell {
    @IBOutlet weak var itemName: UILabel!
    @IBOutlet weak var itemAmount: UILabel!
    @IBOutlet weak var checkBox: UIImageView!
}

class GroceryListTableViewController: UITableViewController {
    
    // list of recipe objects that user chose
    var list: [Recipe] = []
    // holds final list of ingredients -> Name:Amount
    var fullIngredientDictionary: Dictionary<String,Float> = [:]
    // to hold keys of the dictionary
    var ingredientsNames: [String] = []
    // use images to make checked box
    var uncheckedBox = UIImage(named: "unchecked-checkbox")
    var checkedBox = UIImage(named: "checked-checkbox")
    
    // goes through each recipe and populates ingredients dictionary
    func countIngredients() {
        for r in list {
            let p = r.portions
            let i = r.ingredients
            // separate ingredients from each other using \n as a separator
            let line = i.components(separatedBy: CharacterSet.newlines)
            // if collection is not empty
            if line != [] {
                // split line into amount and description
                for fullString in line {
                    let splittedString = fullString.split(separator: " ", maxSplits: 1).map(String.init)
                    // first part of the array is amount
                    let intString: String = splittedString[0]
                    // check if there are special characters & convert them to decimal
                    let decimal = checkDecimal(intString)
                    // calculate amount of portions
                    let amount = decimal * Float(p)
                    // second part of the substring is name of ingredient
                    let descriptionString = splittedString[1]
                    addToGroceryList(amount,descriptionString)
                }
            }
        }
    }
    
    // checks if there are special characters
    func checkDecimal (_ char: String) -> Float {
        // check if string has a special decimal character
        let charset = CharacterSet(charactersIn: "½¼¾")
        let decimal: Float
        if char.rangeOfCharacter(from: charset) != nil {
            decimal = convertToDecimal(char)
            return decimal
        }
        else {
            decimal = Float(char)!
            return decimal
        }
    }
    
    // converts special characters to floats
    func convertToDecimal (_ char: String) -> Float {
        if char == "½" {return 0.5}
        else if char == "¼" {return 0.25}
        else if char == "¾" {return 0.75}
        else {return 0}
    }
    
    // if dictionary has this ingredient -> add to existing amount, otherwise create a new one
    func addToGroceryList(_ amount: Float, _ descriptionString: String) {
        // check if the ingredient already exists, then add to the amount
        if fullIngredientDictionary[descriptionString] != nil {
            fullIngredientDictionary[descriptionString]! += amount
        }
        // otherwise add a new ingredient to the dictionary
        else {
            fullIngredientDictionary[descriptionString] = amount
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // want to have checkboxes -> need to allowed multiple selection
        self.tableView.allowsMultipleSelection = true;
        // populate ingredients collection
        countIngredients()
        // get an array of items
        for (key, _) in fullIngredientDictionary {
            ingredientsNames += [key]
        }
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // need only one collection to display
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // amount of rows of the table
        return ingredientsNames.count
    }
    
    // construct grocery item table cell
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "groceryCell", for: indexPath) as! GroceryReusableCell
        
        cell.checkBox.tag = indexPath.row
        let item = ingredientsNames[indexPath.row]
        cell.itemName.text = item
        if let value = fullIngredientDictionary[item] {
            cell.itemAmount.text = String(value)
        }
        // set image to unchecked box
        cell.checkBox.image = uncheckedBox
        
        return cell
    }
    
    // change image of the check box depending on selected or deselected row
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = self.tableView.cellForRow(at: indexPath) as! GroceryReusableCell
            cell.checkBox.image = checkedBox
    }
    
    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let cell = self.tableView.cellForRow(at: indexPath) as! GroceryReusableCell
            cell.checkBox.image = uncheckedBox
    }
}
