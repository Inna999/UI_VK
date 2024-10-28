//
//  NewsParseData.swift
//  VK
//
//  Created by Inna on 28.10.2024.
//

import Foundation
import SwiftyJSON

class NewsParseData {
    
    var outputData: [Any] = []
    
    func parse(_ data: Data?) {
        guard let data else { return }
        do {
            let json = try JSON(data: data)
            let news = json["articles"].compactMap {
                News(json: $0.1)
            }
            outputData = news
        } catch {
            debugPrint(error.localizedDescription)
        }
    }
}
