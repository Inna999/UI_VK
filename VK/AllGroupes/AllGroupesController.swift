//
//  AllGroupesController.swift
//  VK
//
//  Created by  Admin on 07.10.2024.
//

import UIKit

protocol AllGroupesViewProtocol: AnyObject {
    
}

class AllGroupesViewController: UITableViewController {
    var presenter: AllGroupesPresenter?
    let module = AllGroupesModule()
    
    @IBOutlet weak var searchBar: UISearchBar!
    var groupes: [Groupe]?
    var searchedGroupes: [Groupe]?
    var searching = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        module.build(with: self)
        presenter?.viewDidLoaded()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if searching {
            return searchedGroupes?.count ?? 0
        }
        return groupes?.count ?? 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GroupCell", for: indexPath) as! AllGroupesCell
        if searching {
            cell.groupName.text = searchedGroupes?[indexPath.row].name
            cell.followersCount.text = String(Int.random(in: 0...1_000_000))
            cell.groupAvatar.image = UIImage(named: searchedGroupes?[indexPath.row].photo ?? "")
        } else {
            cell.groupName.text = groupes?[indexPath.row].name
            cell.followersCount.text = String(Int.random(in: 0...1_000_000))
            cell.groupAvatar.image = UIImage(named: groupes?[indexPath.row].photo ?? "")
        }
        return cell
        
    }
}

extension AllGroupesViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchedGroupes = groupes?.filter { $0.name.lowercased().prefix(searchText.count) == searchText.lowercased() }
        searching = true
        tableView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searching = false
        searchBar.text = ""
        tableView.reloadData()
    }
}

extension AllGroupesViewController: AllGroupesViewProtocol {
    
}
