//
//  MyFriendsController.swift
//  VK
//
//  Created by  Admin on 07.10.2024.
//

import UIKit
import RealmSwift

protocol MyFriendsViewProtocol: AnyObject {
    var friends: Results<User>? { get }
    var token: NotificationToken? { get }
    func pairTableAndRealm()
}

class MyFriendsViewController: UITableViewController {
    var presenter: MyFriendsPresenterProtocol?
    let module = MyFriendsModule()
    var token: NotificationToken?
    var friends: Results<User>?

    override func viewDidLoad() {
        super.viewDidLoad()
        module.build(with: self)
        presenter?.viewDidLoaded()
        pairTableAndRealm()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return friends?.count ?? 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyFriend", for: indexPath) as! MyFriendsCell
    
        guard let friend = friends?[indexPath.row] else { return cell }
        cell.friendName.text = friend.firstName + " " + friend.lastName
        //загрузка аватара из url
        cell.friendAvatar.image = getPhotoFromUrl(friend.photo)
        return cell
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showAvatar" {
            let photosViewController = segue.destination as! PhotosViewController
            if let indexPath = tableView.indexPathForSelectedRow {
                photosViewController.idFriend = friends?[indexPath.row].id ?? ""
            }
        }
    }
    // получение фото по url
    func getPhotoFromUrl(_ url: String) -> UIImage? {
        if let photoURL:URL = URL(string: url), let photoData = try? Data(contentsOf: photoURL) {
            return UIImage(data: photoData)
        }
        return nil
    }
}

extension MyFriendsViewController: MyFriendsViewProtocol {
    // связь данных в таблице и БД
    func pairTableAndRealm() {
        presenter?.getFriends(&friends)
        token = friends?.observe { [weak self] (changes: RealmCollectionChange) in
            guard let tableView = self?.tableView else { return }
            switch changes {
            case .initial:
                tableView.reloadData()
                break
            case .update(_, let deletions, let insertions, let modifications):
                tableView.beginUpdates()
                tableView.insertRows(at: insertions.map({ IndexPath(row: $0, section: 0)}), with: .automatic)
                tableView.deleteRows(at: deletions.map({ IndexPath(row: $0, section: 0)}), with: .automatic)
                tableView.reloadRows(at: modifications.map({ IndexPath(row: $0, section: 0)}), with: .automatic)
                tableView.endUpdates()
                break
            case .error(let error):
                fatalError("\(error)")
                break
            }
        }
        
    }
    
}
