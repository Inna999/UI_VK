//
//  MyGroupesRouter.swift
//  VK
//
//  Created by Inna on 11.10.2024.
//

import Foundation

protocol MyGroupesRouterProtocol: AnyObject {
}

class MyGroupesRouter: MyGroupesRouterProtocol {
    weak var viewController: MyGroupesViewProtocol?
}
