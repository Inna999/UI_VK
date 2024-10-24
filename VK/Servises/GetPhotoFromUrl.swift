//
//  getPhotoFromUrl.swift
//  VK
//
//  Created by Inna on 22.10.2024.
//

import Foundation
import UIKit

class GetPhotoFromUrl: Operation {
    
    var outputImage: UIImage? = nil
    var url: String
    
    init(url: String) {
        self.url = url
        super.init()
    }
    
    override func main() {
        if let photoURL:URL = URL(string: url),
           let photoData = try? Data(contentsOf: photoURL) {
                outputImage = UIImage(data: photoData)
        }
    }
}
