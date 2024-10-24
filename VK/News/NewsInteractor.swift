//
//  LentaInteractor.swift
//  VK
//
//  Created by Inna on 17.10.2024.
//

import Foundation
import UIKit

protocol LentaInteractorProtocol: AnyObject {
    func loadNews()
}

class LentaInteractor: LentaInteractorProtocol {
    
    weak var presenter: LentaPresenterProtocol?
    
    func loadNews() {
        let news = NewsServise(controller: presenter!.view!)
        news.loadNews()
    }
    
}
