//
//  MyFriendsInteractor.swift
//  VK
//
//  Created by Inna on 11.10.2024.
//

import Foundation
import RealmSwift


protocol MyFriendsInteractorProtocol: AnyObject {
    func loadFriends()
    func getFriendsFromRealm() -> Results<User>?
    func getFriends(_ friends: inout Results<User>?)
}

class MyFriendsInteractor: MyFriendsInteractorProtocol {
    weak var presenter: MyFriendsPresenterProtocol?

    /// загрузка списка друзей из VK
    func loadFriends() {
        let info = VkApiServise()
        //запрос списка друзей
        info.getInfoFromVK(params: ["fields" : ["first_name", "last_name", "photo_100"], "count": 10]) {
            [weak self] in
            let friends = self?.getFriendsFromRealm()
            self?.presenter?.friendsDidLoaded(friends: friends!)
        }
    }
    
    /// получение записей из БД
    func getFriendsFromRealm() -> Results<User>? {
        do {
            let realm = try Realm()
            let friends = realm.objects(User.self).filter("id == %@", "89132145")
            return friends
        } catch {
            print(error)
            return nil
        }
    }
    
    func getFriends(_ friends: inout Results<User>?) {
        guard let realm = try? Realm() else { return }
        friends = realm.objects(User.self)
    }
}
