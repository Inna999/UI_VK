//
//  SetImageToRow.swift
//  VK
//
//  Created by Inna on 24.10.2024.
//

import Foundation
import UIKit

class SetImageToRow: Operation {
    private let indexPath: IndexPath
    private weak var tableView: UITableView?
    private var cell: LentaNewsCell?
    
    init(cell: LentaNewsCell, indexPath: IndexPath, tableVeiw: UITableView) {
        self.indexPath = indexPath
        self.tableView = tableVeiw
        self.cell = cell
    }
    
    override func main() {
        guard let tableView = tableView,
              let cell = cell,
              let getCacheImage = dependencies[0] as? GetCacheImage,
              let image = getCacheImage.outputImage else { return }
        
        if let newIndexPath = tableView.indexPath(for: cell), newIndexPath == indexPath {
            cell.imageNews.image = image
        } else if tableView.indexPath(for: cell) == nil {
            cell.imageNews.image = image
        }
    }
}
