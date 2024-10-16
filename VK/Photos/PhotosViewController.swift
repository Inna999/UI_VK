//
//  FriendAvatarController.swift
//  VK
//
//  Created by Inna on 08.10.2024.
//

import UIKit
import RealmSwift

protocol PhotosViewProtocol: AnyObject {
    var idFriend: String { get }
    var photos: [Photo] { get }
}

class PhotosViewController: UICollectionViewController {
    var presenter: PhotosPresenterProtocol?
    let module = PhotosModule()
    var idFriend: String = ""
    var photos: [Photo] = [Photo]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        module.build(with: self)
        presenter?.viewDidLoaded()
    }

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as! PhotoCell
        
        if !photos.isEmpty {
                    cell.photo.image = getPhotoFromUrl(photos[indexPath.row].photo)
        }
        return cell
    }
    
    func getPhotoFromUrl(_ url: String) -> UIImage? {
        if let photoURL:URL = URL(string: url), let photoData = try? Data(contentsOf: photoURL) {
            return UIImage(data: photoData)
        }
        return nil
    }
}

extension PhotosViewController: PhotosViewProtocol {
}
