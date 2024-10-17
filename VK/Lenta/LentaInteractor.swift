//
//  LentaInteractor.swift
//  VK
//
//  Created by Inna on 17.10.2024.
//

import Foundation

protocol LentaInteractorProtocol: AnyObject {
    
}

class LentaInteractor: LentaInteractorProtocol {
    weak var presenter: LentaPresenterProtocol?
}
