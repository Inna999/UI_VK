//
//  MyFriendsModule.swift
//  VK
//
//  Created by Inna on 11.10.2024.
//

import Foundation

protocol MyFriendsModuleProtocol {
    func build(with viewController: MyFriendsViewController)
}

class MyFriendsModule {
    func build(with viewController: MyFriendsViewController)  {
        let interactor = MyFriendsInteractor()
        let router = MyFriendsRouter()
        let presenter = MyFriendsPresenter(interactor: interactor, router: router)

        viewController.presenter = presenter
        presenter.view = viewController
        interactor.presenter = presenter
        router.viewController = viewController
    }
}
