//
//  FileManager-Extension.swift
//  WineTime
//
//  Created by Vanessa Bergen on 2020-05-26.
//  Copyright © 2020 Vanessa Bergen. All rights reserved.
//

import Foundation

public extension FileManager {
    static var documentsDirectoryURL: URL {
        // find all possible documents directories for this user
        // just send back the first one, which ought to be the only one
        // don't need to put FileManager.default since its an extension, need to use the backticks because default is a key word in swift
        `default`.urls(for: .documentDirectory, in: .userDomainMask)[0]

    }
}
