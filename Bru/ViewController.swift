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
        
        fetchData()
    }
    
    fileprivate func fetchData() {
        let url = "https://sandbox-api.brewerydb.com/v2//locations/?key=fcb99660800a3922dcb166a04d13a2ca&region=california"
        
        let decoder = JSONDecoder()
        decoder.fetch(BrewDBJson.self, fromUrl: url) { (brewDBJson) in
            self.setBreweries(brewDBJson: brewDBJson)
            self.tableView.reloadData()
        }
    }
    
    fileprivate func setBreweries(brewDBJson: BrewDBJson) {
        breweries = brewDBJson.data
    }
}

extension ViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return breweries.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! BreweryCell
        cell.setupCell(brewery: breweries[indexPath.row].brewery)
        
        return cell
    }
}
