//
//  ContentView.swift
//  WineTime
//
//  Created by Vanessa Bergen on 2020-05-23.
//  Copyright © 2020 Vanessa Bergen. All rights reserved.
//

import SwiftUI
// TODO:

// filter and sort


struct ContentView: View {
    @EnvironmentObject var wineList: WineList
    
    @State private var showingAddSheet = false
    
    var body: some View {
        NavigationView {
            List {
                // using the index here so that we can pass in the binding
                ForEach(wineList.allWines) { index in
                    SectionView(wineType: self.$wineList.allWines[index])
                }
            }
            .listStyle(GroupedListStyle())
            .navigationBarTitle("Wines")
            .navigationBarItems(
                leading: EditButton(),
                trailing: Button(action: {
                    self.showingAddSheet = true
                }){
                    Image(systemName: "plus")
                        .imageScale(.large)
                        .padding()
                })
            .sheet(isPresented: $showingAddSheet) {
                NavigationView {
                    // make an empty Wine when adding a new wine
                    NewWineView(isPresented: self.$showingAddSheet)
                        // injecting the environment object
                        .environmentObject(self.wineList)
                        .navigationBarItems(leading: Button(action: {
                            self.showingAddSheet = false
                        }) {
                            Text("Cancel")
                        })
                }
            }
        }
    }
}

extension Image {
    // modifiying the flag image
    func FlagImage() -> some View {
        self
            .renderingMode(.original)
            .resizable()
            .clipShape(Capsule())
            .shadow(color: .black, radius: 2)
    
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(WineList())
    }
}
