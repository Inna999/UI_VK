//
//  MyGroupesInteractor.swift
//  VK
//
//  Created by Inna on 11.10.2024.
//

import Foundation
import RealmSwift

protocol MyGroupesInteractorProtocol: AnyObject {
    func addGroupe(_ name: String, _ avatar: String)
    func getGroupes(_ groupes: inout Results<Groupe>?)
}

class MyGroupesInteractor: MyGroupesInteractorProtocol {
    weak var presenter: MyGroupesPresenterProtocol?
    
    func addGroupe(_ name: String, _ avatar: String) {
        let newGroupe = Groupe()
        newGroupe.name = name
        newGroupe.photo = avatar
        do {
            let realm = try Realm()
            realm.beginWrite()
            realm.add(newGroupe, update: .all)
            try realm.commitWrite()
        } catch {
            print(error)
        }
    }
    
    func getGroupes(_ groupes: inout Results<Groupe>?) {
        guard let realm = try? Realm() else { return }
        groupes = realm.objects(Groupe.self)
    }
    
}
