//
//  NewWineView.swift
//  WineTime
//
//  Created by Vanessa Bergen on 2020-05-26.
//  Copyright © 2020 Vanessa Bergen. All rights reserved.
//

import SwiftUI
import Combine

struct NewWineView: View {
    @EnvironmentObject var wineList: WineList
    @Binding var isPresented: Bool
    
    @State private var newWine = Wine()
    @State private var category: Wine.WineType = .red
    
    var body: some View {
        VStack {
            
            Form {
                Section {
                    WineImageView(wine: $newWine)
                        .padding(.bottom)
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
                }
                
                Picker("Category", selection: $category) {
                   ForEach(Wine.WineType.allCases, id: \.self) { category in
                       Text(category.rawValue.capitalized)
                       .tag(category)
                   }
               }
               .pickerStyle(SegmentedPickerStyle())
                WineDetailsView(wine: $newWine)
                Button(action: {
                    let wineIndex = self.wineList.getIndex(for: self.category)
                    
                    self.wineList.add(wine: self.newWine, for: wineIndex)
                    // dismissing this view by setting the isPresented binding to false
                    self.isPresented = false
                    
                }){
                     Text("Save Wine")
                }
                .disabled(newWine.name.isEmpty)
            }
            .modifyKeyboardAdaptive()
            
        }
        .navigationBarTitle("Add New Wine", displayMode: .inline)
        
    }
}

struct NewWineView_Previews: PreviewProvider {
    static var previews: some View {
        NewWineView(isPresented: .constant(true)).environmentObject(WineList())
    }
}
