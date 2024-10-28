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
    
    let controller: LentaViewController
    var data: Data?
    
    init(controller: LentaViewController) {
        self.controller = controller
    }
    
    func loadNews(){
        let url = "https://newsapi.org/v2/everything"
        let params = [
            "q": "apple",
            "from": "2024-10-21",
            "to": "2024-10-20",
            "sortBy": "popularity",
            "apiKey": "73b673ceb6044b66b87f1a870f2d615b"
        ]
       
        let request = AF.request(url, method: .get, parameters: params)
        
        let dispatchGroup = DispatchGroup()
        DispatchQueue.global().async(group: dispatchGroup) {
            request.responseData(queue: DispatchQueue.global()) { [weak self] response in
                self?.data = response.value
            }
        }
        RunLoop.current.run(until: Date() + 1)
        dispatchGroup.notify(queue: DispatchQueue.global()) {
            let parseData = NewsParseData()
            let dispatchGroup = DispatchGroup()
            DispatchQueue.global().async(group: dispatchGroup) {
                parseData.parse(self.data)
            }
            dispatchGroup.notify(queue: DispatchQueue.main) {
                self.controller.news = parseData.outputData as! [News]
                self.controller.tableView.reloadData()
            }
        }
    }
}


