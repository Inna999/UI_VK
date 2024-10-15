//
//  AllGroupesModule.swift
//  VK
//
//  Created by Inna on 11.10.2024.
//

import Foundation

protocol AllGroupesModuleProtocol {
    func build(with viewController: AllGroupesViewController)
}

class AllGroupesModule {
    func build(with viewController: AllGroupesViewController)  {
        let interactor = AllGroupesInteractor()
        let router = AllGroupesRouter()
        let presenter = AllGroupesPresenter(interactor: interactor, router: router)
        
        viewController.presenter = presenter
        presenter.view = viewController
        interactor.presenter = presenter
        router.viewController = viewController
    }
}
