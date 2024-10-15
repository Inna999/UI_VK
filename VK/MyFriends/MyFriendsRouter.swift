//
//  MyFriendsRouter.swift
//  VK
//
//  Created by Inna on 11.10.2024.
//

import Foundation

protocol MyFriendsRouterProtocol: AnyObject {
}

class MyFriendsRouter: MyFriendsRouterProtocol {
    weak var viewController: MyFriendsViewProtocol?
}
