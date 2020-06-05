//
//  WineDetailsView.swift
//  WineTime
//
//  Created by Vanessa Bergen on 2020-05-25.
//  Copyright © 2020 Vanessa Bergen. All rights reserved.
//

import SwiftUI
import Combine

struct WineDetailsView: View {
    //@EnvironmentObject var wineList: WineList
    @Binding var wine: Wine
    
    @State private var category: Wine.WineType = .red
    
    @Environment(\.presentationMode) var presentationMode
    
    
    var body: some View {
        Group {
            
            Section {
                TextField("Wine Name", text: $wine.name)
                TextField("Wine/Grape Type", text: $wine.grape)
                  
            }
            Section {
                Picker(selection: $wine.country, label: Text("Country")) {
                    ForEach(0..<Wine.countries.count, id: \.self) { index in
                        HStack {
                            Image(Wine.countries[index])
                                .FlagImage()
                                .frame(width: 25, height: 25)
                            Text(Wine.countries[index])
                        }
                    }
                    
                }
                PriceView(price: $wine.price)
            }
            Section {
                
                TextField("Comments", text: $wine.comments)
                
            }
        
            
        }
    }
}

struct WineDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        WineDetailsView(wine: .constant(Wine.example))
    }
}
