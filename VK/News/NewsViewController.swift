//
//  LentaViewController.swift
//  VK
//
//  Created by Inna on 17.10.2024.
//

import UIKit
protocol LentaViewProtocol: AnyObject {
    var presenter: LentaPresenterProtocol? { get }
    var news: [News] { get set }
}

class LentaViewController: UITableViewController {
    var presenter: LentaPresenterProtocol?
    var module = LentaModule()
    var news = [News]()

    override func viewDidLoad() {
        super.viewDidLoad()
        module.build(with: self)
        presenter?.viewDidLoaded()
       

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return news.count ?? 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsCell", for: indexPath) as! LentaNewsCell
      //  guard let news = presenter?.news else { return cell }
        cell.title.text = news[indexPath.row].title
        cell.author.text = news[indexPath.row].author
    //    cell.date.text = news[indexPath.row].date
        // загрузка фото по url
        if let photoURL:URL = URL(string: news[indexPath.row].imageArt), let photoData = try? Data(contentsOf: photoURL) {
            cell.imageNews.image = UIImage(data: photoData)
        }
        cell.article.text = news[indexPath.row].article
        cell.article.numberOfLines = 0
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension LentaViewController: LentaViewProtocol {
    
}
