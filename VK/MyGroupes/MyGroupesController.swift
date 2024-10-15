//
//  MyGroupesController.swift
//  VK
//
//  Created by  Admin on 07.10.2024.
//

import UIKit
import RealmSwift

protocol MyGroupesViewProtocol: AnyObject {
    var myGroupes: Results<Groupe>? { get }
    var token: NotificationToken? { get }
}

class MyGroupesViewController: UITableViewController {
    var presenter: MyGroupesPresenter?
    let module = MyGroupesModule()
    var token: NotificationToken? 
    var myGroupes: Results<Groupe>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        module.build(with: self)
        pairTableAndRealm()
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return myGroupes?.count ?? 0
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyGroupCell", for: indexPath) as! MyGroupesCell
        
        guard let group = myGroupes?[indexPath.row] else { return cell }
        cell.groupName.text = group.name
        cell.groupAvatar.image = UIImage(named: group.photo)
        return cell
    }
    
    // добавление группы
    @IBAction func addGroup(segue: UIStoryboardSegue) {
        if segue.identifier == "addGroup" {
            let allGroupesViewController = segue.source as! AllGroupesViewController
            if let indexPath = allGroupesViewController.tableView.indexPathForSelectedRow,
               let group = allGroupesViewController.groupes?[indexPath.row].name,
               let avatar = allGroupesViewController.groupes?[indexPath.row].photo {
                // проверка, что этой группы еще нет в списке
                if !(myGroupes?.contains(Groupe(name: group, photo: avatar)) ?? false) {
              //      !groups.contains(group) {
                   
                    presenter?.addGroupe(group, avatar)
                    //groups.append(group)
                    //avatars.append(avatar)
                 //   tableView.reloadData()
                }
            }
        }
    }
    
    // Удаление группы
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        guard let groupe = myGroupes?[indexPath.row] else { return }
        if editingStyle == .delete {
            do {
                let realm = try Realm()
                realm.beginWrite()
                realm.delete(groupe)
                try realm.commitWrite()
            } catch {
                print(error)
            }
            
        }
    }
}

extension MyGroupesViewController: MyGroupesViewProtocol {
    // связь данных в таблице и БД
    func pairTableAndRealm() {
        presenter?.getGroupes(&myGroupes)
        token = myGroupes?.observe { [weak self] (changes: RealmCollectionChange) in
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
