//
//  LentaPresenter.swift
//  VK
//
//  Created by Inna on 17.10.2024.
//

import Foundation

protocol LentaPresenterProtocol: AnyObject {
  //  var news: [News] { get }
    var view: LentaViewController? { get }
    func viewDidLoaded()
    func newsDidLoaded(news: [News])
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
     //   view?.tableView.reloadData()
    }
    
    func newsDidLoaded(news: [News]) {
 //       self.news = news
   //     view?.tableView.reloadData()
    }
}
