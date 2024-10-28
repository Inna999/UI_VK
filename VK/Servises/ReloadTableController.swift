//
//  ReloadTableController.swift
//  VK
//
//  Created by Inna on 22.10.2024.
//

import Foundation

class ReloadTableController: Operation {
    var controller: LentaViewController
    
    init(controller: LentaViewController) {
        self.controller = controller
    }
    
    override func main() {
        guard let parseData = dependencies.first as? ParseData else { return }
        controller.news = parseData.outputData as! [News]
        controller.tableView.reloadData()
    }
}
