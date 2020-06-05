//
//  ImageSaver.swift
//  WineTime
//
//  Created by Vanessa Bergen on 2020-05-28.
//  Copyright © 2020 Vanessa Bergen. All rights reserved.
//

import Foundation
import SwiftUI

class ImageSaver: NSObject {
    
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    func saveToDocuments(image: UIImage, imageName: String) {
        if let data = image.pngData() {
            let filename = getDocumentsDirectory().appendingPathComponent(imageName)
            try? data.write(to: filename)
        }
    }
    
    func getPNGFromDocumentDirectory(name: String) -> UIImage? {
        return UIImage(
            contentsOfFile:
            getDocumentsDirectory()
                
                // image name
                .appendingPathComponent(name)
                .appendingPathExtension("png")
                .path
        )
    }
}
