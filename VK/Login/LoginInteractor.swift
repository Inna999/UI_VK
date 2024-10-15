//
//  LoginInteractor.swift
//  VK
//
//  Created by Inna on 11.10.2024.
//

import Foundation

protocol LoginInteractorProtocol: AnyObject {
    func checkPassword(login: String, password: String) -> Bool
}

class LoginInteractor: LoginInteractorProtocol {
    weak var presenter: LoginPresenterProtocol?
    
    /// прверка логина/пароля
    func checkPassword(login: String, password: String) -> Bool {
        if login == "1" && password == "1" {
            return true
        } else {
            return false
        }
    }
}
