//
//  MyGroupesPresenter.swift
//  VK
//
//  Created by Inna on 11.10.2024.
//

import Foundation
import RealmSwift

protocol MyGroupesPresenterProtocol: AnyObject {
    
    func addGroupe(_ name: String, _ avatar: String)
}

class MyGroupesPresenter {
    weak var view: MyGroupesViewController?
    var router: MyGroupesRouterProtocol
    var interactor: MyGroupesInteractorProtocol
      
    init(interactor: MyGroupesInteractorProtocol, router: MyGroupesRouterProtocol) {
        self.interactor = interactor
        self.router = router
    }
}

extension MyGroupesPresenter: MyGroupesPresenterProtocol {
    
   
    
    func addGroupe(_ name: String, _ avatar: String) {
        interactor.addGroupe(name, avatar)
    }
    
    func getGroupes(_ groupes: inout Results<Groupe>?) {
        interactor.getGroupes(&groupes)
    }
}
    
