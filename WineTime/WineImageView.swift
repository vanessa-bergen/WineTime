//
//  WineImageView.swift
//  WineTime
//
//  Created by Vanessa Bergen on 2020-05-28.
//  Copyright © 2020 Vanessa Bergen. All rights reserved.
//

import SwiftUI

struct WineImageView: View {
    @Binding var wine: Wine
    
    @State private var inputImage: UIImage?
    @State private var image: Image?
    @State private var showingImagePicker = false
    @State private var showingOptions = false
    @State private var pickerSource: UIImagePickerController.SourceType = .photoLibrary
    @State private var imageAspectRatio: CGFloat = 1.0
    
    var body: some View {
        
        ZStack(alignment: .bottom) {
            image?
                .resizable()
                .aspectRatio(self.imageAspectRatio, contentMode: .fill)
                .frame(width: 150, height: 150, alignment: .center)
                .clipShape(Circle())
                .background(
                    Circle()
                        .fill(Color.white)
                    .shadow(radius: 10)
                )
                .overlay(
                    Circle()
                        .stroke(Color.black, lineWidth: 2)
                )
                
                                
            Button(action:{
                self.showingOptions = true
            }){
                
               Text("Select Image")
                    .offset(x: 0, y: 20)
                    .frame(width: 150, height: 170, alignment: .bottom)
                    .contentShape(Rectangle())
            }
                }
        .onAppear(perform: loadImage)
        // pass the inputImage property into our image picker, so it will be updated when the image is selected
        .sheet(isPresented: $showingImagePicker, onDismiss: setImage) {
            ImagePicker(inputImage: self.$inputImage, pickerSource: self.pickerSource)
        }
        .actionSheet(isPresented: $showingOptions) {
            ActionSheet(
                title: Text("Choose Option"),
                buttons: [
                    .default(Text("Take Photo")) {
                        self.pickerSource = .camera
                        self.showingImagePicker = true
                    },
                    .default(Text("Choose Photo")) {
                        self.pickerSource = .photoLibrary
                        self.showingImagePicker = true
                    },
                    .cancel()
                ]
            )
        }
    }
    // need to calculate the aspect ratio of the UIImage, otherwise vertical images will be stretched
    func calculateAspectRatio(image: UIImage) {
        let imageW = image.size.width
        let imageH = image.size.height
        self.imageAspectRatio = imageW/imageH
    }
    
    func setImage() {
        guard let inputImage = inputImage else { return }
        // here we are setting the swiftui image that will be shown
        image = Image(uiImage: inputImage)
        // added Privacy - Photo Library Additions Usage Description in Info.plist to ask the user's permissions first
        calculateAspectRatio(image: inputImage)
        wine.wineImage = WineImage(withImage: inputImage)
    }
    
    
    
    func loadImage() {
        guard let img = wine.wineImage.getImage() else {
            self.image = Image("Placeholder")
            return
        }
        calculateAspectRatio(image: img)
        self.image = Image(uiImage: img)
    }
}

struct WineImageView_Previews: PreviewProvider {
    static var previews: some View {
        WineImageView(wine: .constant(Wine.example))
    }
}
