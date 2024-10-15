//
//  AllGroupesInteractor.swift
//  VK
//
//  Created by Inna on 11.10.2024.
//

import Foundation

protocol AllGroupesInteractorProtocol: AnyObject {
    func getGroupes() -> [Groupe]
}

class AllGroupesInteractor: AllGroupesInteractorProtocol {
    weak var presenter: AllGroupesPresenterProtocol?
    
    func getGroupes() -> [Groupe] {
        var groupes = [Groupe]()
        groupes.append(Groupe(name: "Kjljlj", photo: "1.png"))
        groupes.append(Groupe(name: ":,kmcoko;", photo: "2.png"))
        groupes.append(Groupe(name: "Iojlcn,n,", photo: "3.png"))
        return groupes
    }
}
