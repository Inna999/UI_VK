//
//  PhotosPresenter.swift
//  VK
//
//  Created by Inna on 10.10.2024.
//

import Foundation
import RealmSwift

protocol PhotosPresenterProtocol: AnyObject {
    func viewDidLoaded()
    func photosDidLoaded(photos: Results<Photo>)
    func getPhotos(_ photos: inout Results<Photo>?)
}

class PhotosPresenter {
    weak var view: PhotosViewController?
    var router: PhotosRouterProtocol
    var interactor: PhotosInteractorProtocol
    
    init(interactor: PhotosInteractorProtocol, router: PhotosRouterProtocol) {
        self.interactor = interactor
        self.router = router
    }
}

extension PhotosPresenter: PhotosPresenterProtocol {
    
    func viewDidLoaded() {
        guard let idFriend = view?.idFriend, idFriend != "" else { return }
        interactor.loadPhotos(idFriend: String(idFriend))
    }
    
    func photosDidLoaded(photos: Results<Photo>) {
        view?.collectionView.reloadData()
    }
    
    func getPhotos(_ photos: inout Results<Photo>?) {
        interactor.getPhotos(&photos)
    }
}