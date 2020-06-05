//
//  WineList.swift
//  WineTime
//
//  Created by Vanessa Bergen on 2020-05-25.
//  Copyright © 2020 Vanessa Bergen. All rights reserved.
//

import Combine
import SwiftUI

class WineList: ObservableObject, Codable {
    
    @Published var allWines: [GroupedWines] {
        didSet {
            print("made a change, saving")
            saveToDocuments()
        }
    }
    
    enum CodingKeys: CodingKey {
        case allWines
    }
    
    static let saveKey = "SavedData"
    
    init() {
        
        print("loading data")
        let filename = FileManager.documentsDirectoryURL
            .appendingPathComponent(Self.saveKey)
        do {
            let data = try Data(contentsOf: filename)
            self.allWines = try JSONDecoder().decode([GroupedWines].self, from: data)
        } catch {
            print("Unable to load saved data.")
            // if it's unable to load saved data, or there is no saved data, default to an empty array with the wine type section headers
            // this way we won't get any errors when we try to add to the sections
            self.allWines = [
                GroupedWines(wineType: .red, wines: []),
                GroupedWines(wineType: .white, wines: []),
                GroupedWines(wineType: .rose, wines: []),
                GroupedWines(wineType: .specialty, wines: [])
            ]
        }
        
    }
    
    // create a custom initializer that will be given some sort of container, and use that to read values for all our properties
    // Decoder contains all the data
    // this data should have a container where the keys match whatever cases we have in our CodingKeys enum. This is a throwing call, because it’s possible those keys don’t exist.
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        // readomg the values from the container
        allWines = try container.decode([GroupedWines].self, forKey: .allWines)
    }
    
    func encode(to encoder: Encoder) throws {
        // make a container using the coding keys enum
        // write our values to the attached key
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(allWines, forKey: .allWines)
    }
    
    func changePrice(_ wine: Wine) {
        objectWillChange.send()
    }
    
    // get the index of the array where the wineType matched
    // so return 0 for red, 1 for white, 2 for rose, 3 for specialty
    func getIndex(for wineType: Wine.WineType) -> Int {
        allWines.firstIndex { $0.wineType == wineType }!
    }
    
    private func saveToDocuments() {
       do {
        let filename = FileManager.documentsDirectoryURL
            .appendingPathComponent(Self.saveKey)
        let data = try JSONEncoder().encode(allWines)
            try data.write(to: filename, options: [.atomicWrite, .completeFileProtection])
        } catch {
            print("Unable to save data.")
        }
    }
    
    func add(wine: Wine, for index: Int) {
        objectWillChange.send()
        allWines[index].wines.append(wine)
        saveToDocuments()
    }
}
