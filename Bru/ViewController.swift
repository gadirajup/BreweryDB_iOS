//
//  ViewController.swift
//  Bru
//
//  Created by Prudhvi Gadiraju on 3/3/19.
//  Copyright © 2019 Prudhvi Gadiraju. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    var breweries = [Breweries]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = "https://sandbox-api.brewerydb.com/v2//locations/?key=fcb99660800a3922dcb166a04d13a2ca&region=california"
        
        let decoder = JSONDecoder()
        decoder.fetch(BrewDBJson.self, fromUrl: url) { (brewDBJson) in
            self.breweries = brewDBJson.data
        }
    }
}
