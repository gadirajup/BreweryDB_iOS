//
//  BreweryCell.swift
//  Bru
//
//  Created by Prudhvi Gadiraju on 3/3/19.
//  Copyright © 2019 Prudhvi Gadiraju. All rights reserved.
//

import Foundation
import UIKit

class BreweryCell: UITableViewCell {
    
    @IBOutlet weak var breweryImageView: UIImageView!
    
    func setupCell(brewery: Brewery) {
        breweryImageView.load(urlString: brewery.images.icon)
    }
}

extension UIImageView {
    func load(urlString: String) {
        guard let url = URL(string: urlString) else {
            print("NOT A URL")
            return
        }
        DispatchQueue.global().async { [weak self] in
            do {
                let imageData = try Data(contentsOf: url)
                if let image = UIImage(data: imageData) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}
