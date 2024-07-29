//
//  RemoteImage.swift
//  Surprise-me-SwiftUI
//
//  Created by Bruno Madeira on 24/07/2024.
//

import SwiftUI
import Kingfisher

class RemoteImage {
    
    var image: Image?
    
    func downloadImage(url: String, completion: @escaping(Image?) -> Void) {
        let image = KF.ImageResource(downloadURL: URL(string: url)!)
        
        KingfisherManager.shared.retrieveImage(with: image) { result in
            switch result {
            case .success(let value):
                completion(Image(uiImage: value.image))
            case .failure(let error):
                print("Error detected: \(error)")
                completion(nil)
            }
        }
    }
}
