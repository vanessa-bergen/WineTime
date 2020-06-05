//
//  Wine.Type.swift
//  WineTime
//
//  Created by Vanessa Bergen on 2020-05-25.
//  Copyright © 2020 Vanessa Bergen. All rights reserved.
//

import Foundation

extension Wine {
    // nest the wine type within Wine
    // make the raw value a string
    // case iterable lets you iterate through each type
    enum WineType: String, CaseIterable, Codable {
        case red, white, rose, specialty
    }
}
