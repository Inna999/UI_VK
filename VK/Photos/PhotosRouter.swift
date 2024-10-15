//
//  PhotosRouter.swift
//  VK
//
//  Created by Inna on 10.10.2024.
//

import Foundation

protocol PhotosRouterProtocol: AnyObject {
}

class PhotosRouter: PhotosRouterProtocol {
    weak var viewController: PhotosViewProtocol?
}
