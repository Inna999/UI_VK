//
//  Lenta.swift
//  VK
//
//  Created by Inna on 21.10.2024.
//

import Foundation
import SwiftyJSON

class News {
    var title: String = ""
    var author: String = ""
   // var date: String = ""
    var imageArt: String = ""
    var article: String = ""
    
    init(json: JSON) {
        title = json["title"].stringValue
        author = json["author"].stringValue
      //  date = json["publishedAt"].stringValue
        imageArt = json["urlToImage"].stringValue
        article = json["content"].stringValue
    }
}
