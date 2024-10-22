//
//  PhotosInteractor.swift
//  VK
//
//  Created by Inna on 10.10.2024.
//

import Foundation
import RealmSwift


protocol PhotosInteractorProtocol: AnyObject {
    func loadPhotos(idFriend: String)
}

class PhotosInteractor: PhotosInteractorProtocol {
    weak var presenter: PhotosPresenterProtocol?
    // загрузка фото из VK
    func loadPhotos(idFriend: String) {
        let info = VkApiServise()
        info.getInfoFromVK(for: idFriend, method: "photos.get", params: ["album_id" : -7, "count": 10])
        { [weak self] photos in
                self?.presenter?.photosDidLoaded(photos: photos as! [Photo])
        }
    }

    // получение фото из БД
//    func getPhotos(_ photos: inout Results<Photo>?, _ idFriend: String) {
//        guard let realm = try? Realm() else { return }
//        photos = realm.objects(Photo.self)
//    }
    
}

