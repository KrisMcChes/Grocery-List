//
//  CategoriesTableViewController.swift
//  mcChesneyK_GroceryList_v3.0
//
//  Created by Kristina McChesney on 3/15/20.
//  Copyright © 2020 Kristina McChesney. All rights reserved.
//
//  All recipes and photos are from hellofresh.com
//

import UIKit

// class of recipe table view cell
class CategoryReusableCell: UITableViewCell {
    
    @IBOutlet weak var categoryImage: UIImageView!
    @IBOutlet weak var categoryName: UILabel!
    
}

class CategoriesTableViewController: UITableViewController {
    
    // array of images used in cell's image view
    let recipeImages = [UIImage(named: "SalmoneLimone"),
                        UIImage(named: "PoblanoMac&Cheese"),
                        UIImage(named: "BulgogiPorkTenderloin"),
                        UIImage(named: "CoconutTempuraShrimp"),
                        UIImage(named: "PulledPorkBowl"),
                        UIImage(named: "ChickenBreasts"),
                        UIImage(named: "BeefTenderloin"),
                        UIImage(named: "NoodleSoup"),
                        UIImage(named: "GrilledCheese"),
                        UIImage(named: "ChickenTacos"),
                        UIImage(named: "LobsterRavioli&Shrimp"),
                        UIImage(named: "PulledChickenRice")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = UITableView.automaticDimension
    }
    
    // fix the size of the cell view
    func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath
        indexPath: NSIndexPath) -> CGFloat {
        return view.frame.width / CGFloat(200)
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // need to display only one collection
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // number of rows in the collection to display
        return recipes.count
    }
    
    // construct recipe cell here
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "categoryReusableCell", for: indexPath) as! CategoryReusableCell
        // get recipe object at current index
        let recipe = recipes[indexPath.row]
        // get photo at the same index
        let photo = recipeImages[indexPath.row]
        // display name & image of the recipe
        cell.categoryName.text = recipe.name
        cell.categoryImage.image = photo
        
        return cell
    }
    
    // MARK: - Navigation
    
    // preparation before displaying Details View Controller
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination
        guard let detailsViewController = segue.destination as? DetailsViewController else { return }
        guard let cell = sender as? UITableViewCell else { return }
        guard let indexPath = self.tableView.indexPath(for: cell) else { return }
        
        // Pass the selected object to the new view controller
        detailsViewController.recipe = recipes[indexPath.row]
    }
}
