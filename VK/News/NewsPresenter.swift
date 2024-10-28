//
//  LentaPresenter.swift
//  VK
//
//  Created by Inna on 17.10.2024.
//

import Foundation
import UIKit

protocol LentaPresenterProtocol: AnyObject {
  //  var news: [News] { get }
    var view: LentaViewController? { get }
    func viewDidLoaded()
    func setPhoto(url: String, newsCell: LentaNewsCell, indexPath: IndexPath)
}

class LentaPresenter {
 //   var news = [News]()
    weak var view: LentaViewController?
    var router: LentaRouterProtocol
    var interactor: LentaInteractorProtocol
    
   
    
    init(interactor: LentaInteractorProtocol, router: LentaRouterProtocol) {
        self.interactor = interactor
        self.router = router
    }
}

extension LentaPresenter: LentaPresenterProtocol {
    func viewDidLoaded() {
        interactor.loadNews()
    }
    
    func setPhoto(url: String, newsCell: LentaNewsCell, indexPath: IndexPath) {
//        getCacheImage.completionBlock = {
//            OperationQueue.main.addOperation {
//                newsCell.imageNews.image = getCacheImage.outputImage
//            }
//        }
//        queue.addOperation(getCacheImage)
    }
}
