//
//  EditWineView.swift
//  WineTime
//
//  Created by Vanessa Bergen on 2020-05-26.
//  Copyright © 2020 Vanessa Bergen. All rights reserved.
//

import SwiftUI


struct EditWineView: View {
    @Binding var wine: Wine
    
    var body: some View {
        
        Form {
            Section {
                WineImageView(wine: $wine)
                    .padding(.bottom)
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
            }
            
            WineDetailsView(wine: $wine)
        }
        .modifyKeyboardAdaptive()
        .navigationBarTitle("Wine Details", displayMode: .inline)
        
    }
}

struct EditWineView_Previews: PreviewProvider {
    static var previews: some View {
        EditWineView(wine: .constant(Wine.example))
    }
}
