//
//  MyGrouoe.swift
//  VK
//
//  Created by Inna on 11.10.2024.
//

import Foundation

protocol MyGroupesModuleProtocol {
    func build(with viewController: MyGroupesViewController)
}

class MyGroupesModule {
    func build(with viewController: MyGroupesViewController)  {
        let interactor = MyGroupesInteractor()
        let router = MyGroupesRouter()
        let presenter = MyGroupesPresenter(interactor: interactor, router: router)
        
        viewController.presenter = presenter
        presenter.view = viewController
        interactor.presenter = presenter
        router.viewController = viewController
    }
}
