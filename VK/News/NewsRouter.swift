//
//  LentaRouter.swift
//  VK
//
//  Created by Inna on 17.10.2024.
//

import Foundation

protocol LentaRouterProtocol: AnyObject {
}

class LentaRouter: LentaRouterProtocol {
    weak var view: LentaViewProtocol?
}
