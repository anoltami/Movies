//
//  SearchViewController.swift
//  Movies
//
//  Created by Julien on 18/01/2016.
//  Copyright © 2016 EPSI. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {

    @IBOutlet weak var SearchTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Recherche"
        // Do any additional setup after loading the view.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
            if let destinationVC = segue.destinationViewController as? MoviesViewController{
                destinationVC.searchText = SearchTextField.text
            }
    }


}
