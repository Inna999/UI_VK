//
//  LentaPresenter.swift
//  VK
//
//  Created by Inna on 17.10.2024.
//

import Foundation

protocol LentaPresenterProtocol: AnyObject {
    
}

class LentaPresenter {
    weak var view: LentaViewProtocol?
    var router: LentaRouterProtocol
    var interactor: LentaInteractorProtocol
    
    init(interactor: LentaInteractorProtocol, router: LentaRouterProtocol) {
        self.interactor = interactor
        self.router = router
    }
}

extension LentaPresenter: LentaPresenterProtocol {
    
}
