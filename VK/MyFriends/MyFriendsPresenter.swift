//
//  MyFriendsPresenter.swift
//  VK
//
//  Created by Inna on 11.10.2024.
//

import Foundation
import RealmSwift

protocol MyFriendsPresenterProtocol: AnyObject {
    func viewDidLoaded()
    func friendsDidLoaded(friends: Results<User>)
    func getFriends(_ friends: inout Results<User>?)
}

class MyFriendsPresenter {
    weak var view: MyFriendsViewController?
    var router: MyFriendsRouterProtocol
    var interactor: MyFriendsInteractorProtocol
   
    init(interactor: MyFriendsInteractorProtocol, router: MyFriendsRouterProtocol) {
        self.interactor = interactor
        self.router = router
    }
}

extension MyFriendsPresenter: MyFriendsPresenterProtocol {
   
    func viewDidLoaded() {
        interactor.loadFriends()
    }
    
    func friendsDidLoaded(friends: Results<User>) {
        view?.tableView?.reloadData()
    }
    
    func getFriends(_ friends: inout Results<User>?) {
        interactor.getFriends(&friends)
    }
}
