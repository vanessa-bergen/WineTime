//
//  RowView.swift
//  WineTime
//
//  Created by Vanessa Bergen on 2020-05-25.
//  Copyright © 2020 Vanessa Bergen. All rights reserved.
//

import SwiftUI

struct RowView: View {
    @Binding var wine: Wine
    
    var body: some View {
        NavigationLink(destination: EditWineView(wine: self.$wine)) {
            HStack {
                VStack(alignment: .leading) {
                    Text(wine.name)
                        .font(.headline)
                    Text(wine.grape)
                        .font(.subheadline)
                }
                .padding(.leading, 5)
                
                Spacer()
                
                Text(wine.countryName)
                    .font(.subheadline)
                    .padding(.trailing, 5)
                        
                
            }
        }
    }
}

struct RowView_Previews: PreviewProvider {
    static var previews: some View {
        RowView(wine: .constant(Wine.example))
    }
}
