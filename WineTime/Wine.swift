//
//  Wine.swift
//  WineTime
//
//  Created by Vanessa Bergen on 2020-05-23.
//  Copyright © 2020 Vanessa Bergen. All rights reserved.
//

import Foundation
import UIKit

struct Wine: Identifiable, Codable {
    // change to have default values
    let id = UUID()
    var name: String = ""
    var price: Int = 2
    var country: Int = 2
    var grape: String = ""
    var comments: String = ""
    var wineImage: WineImage = WineImage(withImage: UIImage(named: "Placeholder")!)
    
    static let countries = ["Australia", "Argentina", "Canada", "Chile", "Italy", "France", "Germany", "Greece", "New Zealand", "Portugal", "Spain", "South Africa", "USA", "Other"]
    var countryName: String {
        Wine.countries[country]
    }
    
    
    static let example = Wine(name: "Apothic Red", price: 2, country: 2, grape: "Blend", comments: "Very Good", wineImage: WineImage(withImage: UIImage(named: "Other")!))
}


struct WineImage: Codable{
    let imageData: Data?

    init(withImage image: UIImage) {
        // compressionQuality, 0 to 1, 1 being the best quality
        self.imageData = image.jpegData(compressionQuality: 1.0)
    }

    func getImage() -> UIImage? {
        guard let imageData = self.imageData else {
            return nil
        }
        let image = UIImage(data: imageData)

        return image
    }
}
    

