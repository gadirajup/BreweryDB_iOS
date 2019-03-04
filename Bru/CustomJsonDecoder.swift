//
//  CustomJsonDecoder.swift
//  Bru
//
//  Created by Prudhvi Gadiraju on 3/3/19.
//  Copyright © 2019 Prudhvi Gadiraju. All rights reserved.
//

import Foundation

extension JSONDecoder {
    func fetch<T: Decodable>(_ type: T.Type, fromUrl url: String, completion: @escaping (T) -> Void) {
        let url = URL(string: url)!
        
        DispatchQueue.global().async {
            do {
                let urlContents = try Data(contentsOf: url)
                let decodedJSON = try JSONDecoder().decode(type.self, from: urlContents)
                DispatchQueue.main.async {
                    completion(decodedJSON)
                }
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}
