//
//  GroceryListViewController.swift
//  mcChesneyK_GroceryList_v3.0
//
//  Created by Kristina McChesney on 3/15/20.
//  Copyright © 2020 Kristina McChesney. All rights reserved.
//

import UIKit

class ChosenRecipesViewController: UIViewController {

   
    
    @IBOutlet weak var finalRecipeList: UITextView!
    var chosenRecipes: [Recipe]?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let list = chosenRecipes {
            getFinalList(list)
            print("loaded")
        }
        
    }
    
    func getFinalList(_ list: [Recipe]) {
        
        print("get final")
        guard let list = chosenRecipes else { return }
        print("list exists")

        for r in list {
            if r.portions != 0 {
                print(r.name)
            }
        }
    }
        
        
//        // details segue
//               guard let detailsViewController = segue.destination as? DetailsViewController else { return }
//               guard let cell = sender as? UITableViewCell else { return }
//               guard let indexPath = self.tableView.indexPath(for: cell) else { return }
//               detailsViewController.recipe = recipes[indexPath.row]
//        for r in chosenRecipes {
//            if r.portions
//        }
//    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
