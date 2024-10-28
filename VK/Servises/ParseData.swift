//
//  ParseData.swift
//  VK
//
//  Created by Inna on 22.10.2024.
//

import Foundation
import SwiftyJSON
import RealmSwift

enum KindData {
    case User
    case News
}

class ParseData: Operation {
    
    var kindData: KindData
    var outputData: [Any] = []
    
    init(kindData: KindData) {
        self.kindData = kindData
    }
    
    override func main() {
        guard let getDataOperation = dependencies.first as? GetDataOperation,
              let data = getDataOperation.data else { return }
        do {
            let json = try JSON(data: data)
           
            switch kindData {
            case .User:
                let user: [User] = json["response"]["items"].compactMap {
                    User(json: $0.1)
                }
                self.saveDataToRealm(user)
                outputData = user
            case .News:
                let news = json["articles"].compactMap {
                    News(json: $0.1)
                }
                outputData = news
            }
        } catch {
            debugPrint(error.localizedDescription)
        }
    }
    
    // запись в БД
    func saveDataToRealm<T: Object>(_ data: [T]) {
    //    Realm.Configuration.defaultConfiguration = Realm.Configuration(deleteRealmIfMigrationNeeded: true)
        do {
            let realm = try Realm()
            realm.beginWrite()
            realm.add(data)
            try realm.commitWrite()
        } catch {
            print(error)
        }
    }
    
    
}
