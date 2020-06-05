//
//  WineList.TypeGroups.swift
//  WineTime
//
//  Created by Vanessa Bergen on 2020-05-25.
//  Copyright © 2020 Vanessa Bergen. All rights reserved.
//

import Foundation

extension WineList {
    struct GroupedWines: Codable {
        var wineType: Wine.WineType
        // computed property to get the image name of the icon
        var imageName: String { wineType.rawValue + "Wine" }
        var wines: [Wine]
    }
}

extension WineList.GroupedWines: Identifiable {
    // making the unique id the wineType
    // computed property to get the wineType
    var id: Wine.WineType { wineType }
}
