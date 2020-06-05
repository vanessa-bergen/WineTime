//
//  SectionView.swift
//  WineTime
//
//  Created by Vanessa Bergen on 2020-05-25.
//  Copyright © 2020 Vanessa Bergen. All rights reserved.
//

import SwiftUI

struct SectionView: View {
    @Binding var wineType: WineList.GroupedWines
    
    var body: some View {
        Group{
            // here we want to only show the section if there are wines in that category
            // needs to be embedded in a group so that it can return an empty group if the section should be hidden
            if !wineType.wines.isEmpty {
                Section(header:
                    HStack {
                        Image(wineType.imageName)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 24.0, height: 24.0, alignment: .top)
                        Text("\(wineType.wineType.rawValue.capitalized) Wine")
                            .font(.headline)
                            .foregroundColor(.black)
                            
                    }
                ){
                    ForEach(wineType.wines) { index in
                        RowView(wine: self.$wineType.wines[index])
                    }
                    .onDelete(perform: removeRows)
                }
                
            }
        }
    }
    // remove the wines from the sections
    func removeRows(at offsets: IndexSet) {
        self.wineType.wines.remove(atOffsets: offsets)
    }
}


