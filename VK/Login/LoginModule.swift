//
//  LoginModule.swift
//  VK
//
//  Created by Inna on 11.10.2024.
//

import UIKit
protocol LoginModuleProtocol {
    func build(with viewController: LoginViewController)
}
class LoginModule: LoginModuleProtocol {
    func build(with viewController: LoginViewController) {
        let interactor = LoginInteractor()
        let router = LoginRouter()
        let presenter = LoginPresenter(interactor: interactor, router: router)
       
//        let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "Main") as! LoginViewController
        
        viewController.presenter = presenter
        presenter.view = viewController
        interactor.presenter = presenter
        router.viewController = viewController

    }
}
