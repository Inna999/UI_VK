//
//  VkApi.swift
//  VK
//
//  Created by Inna on 08.10.2024.
//

import Foundation
import UIKit
import Alamofire
import RealmSwift
import SwiftyJSON

class VkApiServise {
    //получение запроса
    func getInfoFromVK(
        for id: String = "89132145",
        method: String = "users.getFollowers",
        params: [String: Any] = [:],
        completion: @escaping([Any]) -> Void
    ) {
        let url = "https://api.vk.ru/method/" + method
        var parameters: Parameters = [
            "user_id": id,
            "v": "5.199",
            "access_token": "72d7484072d7484072d74840ae71f76080772d772d7484015d27328335bf436975da5b1",
        ]
        //добавляем дополнительные параметры, если они были переданы
        params.forEach { key, value in parameters[key] = value }
        let opq = OperationQueue()
        
        let request = AF.request(url, method: .get, parameters: parameters)
        
        let getDataOperation = GetDataOperation(request: request)
        opq.addOperation(getDataOperation)
        
        let parseData = ParseData(kindData: .User)
        parseData.addDependency(getDataOperation)
        opq.addOperation(parseData)

        RunLoop.current.run(until: Date() + 1)
    }
    
    // запись в БД
//    func saveDataToRealm<T: Object>(_ data: [T]) {
//        Realm.Configuration.defaultConfiguration = Realm.Configuration(deleteRealmIfMigrationNeeded: true)
//        do {
//            let realm = try Realm()
//            realm.beginWrite()
//            realm.add(data)
//            try realm.commitWrite()
//        } catch {
//            print(error)
//        }
//    }
}
