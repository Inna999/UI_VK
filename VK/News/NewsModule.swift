//
//  LentaModule.swift
//  VK
//
//  Created by Inna on 17.10.2024.
//

import Foundation

protocol LentaModuleProtocol {
    func build(with view: LentaViewController)
}

class LentaModule: LentaModuleProtocol {
    func build(with view: LentaViewController) {
        let interactor = LentaInteractor()
        let router = LentaRouter()
        let presenter = LentaPresenter(interactor: interactor, router: router)
        
        view.presenter = presenter
        presenter.view = view
        interactor.presenter = presenter
        router.view = view
    }
}
