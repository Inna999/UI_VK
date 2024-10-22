//
//  LentaServise.swift
//  VK
//
//  Created by Inna on 18.10.2024.
//

import Foundation

import UIKit
import Alamofire
import SwiftyJSON


class NewsServise {
    
   // var news = [News]()
    let controller: LentaViewController
    
    init(controller: LentaViewController) {
        self.controller = controller
    }
    
    func loadNews(){//completion: @escaping([News]) -> Void) {
        let url = "https://newsapi.org/v2/everything"
        let params = [
            "q": "apple",
            "from": "2024-10-21",
            "to": "2024-10-20",
            "sortBy": "popularity",
            "apiKey": "73b673ceb6044b66b87f1a870f2d615b"
        ]
        let opq = OperationQueue()
        let request = AF.request(url, method: .get, parameters: params)
        
        let getDataOperation = GetDataOperation(request: request)
        opq.addOperation(getDataOperation)
        
        let parseData = ParseData(kindData: .News)
        parseData.addDependency(getDataOperation)
        opq.addOperation(parseData)
        
        let reloadTableController = ReloadTableController(controller: controller)
        reloadTableController.addDependency(parseData)
        OperationQueue.main.addOperation(reloadTableController)
        
//        AF.request(url, method: .get, parameters: params).responseData { respons in
//            guard let data = respons.value else { return }
//            do {
//                let json = try JSON(data: data)
//                let news = json["articles"].compactMap {
//                    News(json: $0.1)
//                }
//                completion(news)
//            } catch {
//                debugPrint(respons.error as Any)
//            }
//        }
    }
}


