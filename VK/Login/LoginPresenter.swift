//
//  LoginPresenter.swift
//  VK
//
//  Created by Inna on 11.10.2024.
//

import Foundation

protocol LoginPresenterProtocol: AnyObject {
    func checkPassword(login: String, password: String) -> Bool
    
}

class LoginPresenter {
    weak var view: LoginViewProtocol?
    var router: LoginRouterProtocol
    var interactor: LoginInteractorProtocol
    
    init(interactor: LoginInteractorProtocol, router: LoginRouterProtocol) {
        self.interactor = interactor
        self.router = router
    }
}

extension LoginPresenter: LoginPresenterProtocol {
    func checkPassword(login: String, password: String) -> Bool {
        interactor.checkPassword(login: login, password: password)
    }
}
