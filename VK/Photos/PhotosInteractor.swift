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
    func getPhotosFromRealm(for idFriend: String) -> Results<Photo>?
    func getPhotos(_ photos: inout Results<Photo>?)
}

class PhotosInteractor: PhotosInteractorProtocol {
    weak var presenter: PhotosPresenterProtocol?
    var idFriend: String
    
    init(idFriend: String) {
        self.idFriend = idFriend
    }
    
    func loadPhotos(idFriend: String) {
        let info = VkApiServise()
        info.getInfoFromVK(for: idFriend, method: "photos.get", params: ["album_id" : -7, "count": 10]) {
            [weak self] in
            let photos = self?.getPhotosFromRealm(for: idFriend)
            self?.presenter?.photosDidLoaded(photos: photos!)
        }
    }
    func getPhotosFromRealm(for idFriend: String) -> Results<Photo>? {
        do {
            let realm = try Realm()
            let photos = realm.objects(Photo.self).filter("id == %@", idFriend)
            return photos
        } catch {
            print(error)
            return nil
        }
    }
    
    func getPhotos(_ photos: inout Results<Photo>?) {
        guard let realm = try? Realm() else { return }
        photos = realm.objects(Photo.self)
    }
    
}

