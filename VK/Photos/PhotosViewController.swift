//
//  FriendAvatarController.swift
//  VK
//
//  Created by Inna on 08.10.2024.
//

import UIKit
import RealmSwift

protocol PhotosViewProtocol: AnyObject {
    var photos: Results<Photo>? { get }
    var token: NotificationToken? { get }
    
    func getPhotoFromUrl(_ url: String) -> UIImage?
}

class PhotosViewController: UICollectionViewController {
    
    var presenter: PhotosPresenterProtocol?
    let module = PhotosModule()
    var idFriend: String = ""
    var photos: Results<Photo>?
    var token: NotificationToken?
  //  var photos: [Photo] = [Photo]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        module.build(with: self, idFriend: idFriend)
        //presenter?.viewDidLoaded()
        pairTableAndRealm()
    }

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos?.count ?? 0
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as! PhotoCell
        
        guard let photos = photos?[indexPath.row] else { return cell }
        if !photos.photo.isEmpty {
            cell.photo.image = getPhotoFromUrl(photos.photo)
        }
        return cell
    }
}

extension PhotosViewController: PhotosViewProtocol {
    // связь данных в таблице и БД
    func pairTableAndRealm() {
        presenter?.getPhotos(&photos)
        token = photos?.observe { [weak self] (changes: RealmCollectionChange) in
            guard let collectionView = self?.collectionView else { return }
            switch changes {
            case .initial:
                collectionView.reloadData()
                break
            case .update(_, let deletions, let insertions, let modifications):
                collectionView.reloadData()
//                collectionView.beginUpdates()
//                collectionView.insertRows(at: insertions.map({ IndexPath(row: $0, section: 0)}), with: .automatic)
//                collectionView.deleteRows(at: deletions.map({ IndexPath(row: $0, section: 0)}), with: .automatic)
//                collectionView.reloadRows(at: modifications.map({ IndexPath(row: $0, section: 0)}), with: .automatic)
//                collectionView.endUpdates()
                break
            case .error(let error):
                fatalError("\(error)")
                break
            }
        }
        
    }
    func getPhotoFromUrl(_ url: String) -> UIImage? {
        if let photoURL:URL = URL(string: url), let photoData = try? Data(contentsOf: photoURL) {
            return UIImage(data: photoData)
        }
        return nil
    }
}
