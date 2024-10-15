//
//  AllGroupesPresenter.swift
//  VK
//
//  Created by Inna on 11.10.2024.
//

import Foundation

protocol AllGroupesPresenterProtocol: AnyObject {
    func viewDidLoaded()
}

class AllGroupesPresenter {
    weak var view: AllGroupesViewController?
    var router: AllGroupesRouterProtocol
    var interactor: AllGroupesInteractorProtocol
      
    init(interactor: AllGroupesInteractorProtocol, router: AllGroupesRouterProtocol) {
        self.interactor = interactor
        self.router = router
    }
}

extension AllGroupesPresenter: AllGroupesPresenterProtocol {
    
    func viewDidLoaded() {
        view?.groupes = interactor.getGroupes()
    }
}
    
