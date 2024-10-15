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
        completion: @escaping() -> Void
    ) {
        let url = "https://api.vk.ru/method/" + method
        var parameters: Parameters = [
            "user_id": id,
            "v": "5.199",
            "access_token": "72d7484072d7484072d74840ae71f76080772d772d7484015d27328335bf436975da5b1",
        ]
        //добавляем дополнительные параметры, если они были переданы
        params.forEach { key, value in parameters[key] = value }
       
        AF.request(url, method: .get, parameters: parameters).responseData {
            respons in
                guard let data = respons.value else { return }
                do {
                    let json = try JSON(data: data)
                    switch method {
                        case "users.getFollowers":
                        let users = json["response"]["items"].flatMap { User(json: $0.1) }
                            self.saveDataToRealm(users, id)
                            completion()
                        case "photos.get":
                        let photos = json["response"]["items"].flatMap { Photo(json: $0.1) }
                            self.saveDataToRealm(photos, id)
                            completion()
                        default:
                            debugPrint("Неверный метод")
                        }
                } catch {
                    debugPrint(respons.error as Any)
                }
        }
//        if method == "photos.get" {
//            AF.request(url, method: .get, parameters: parameters).responseJSON {
//                response in
//                print(response.value  ?? 0)
//            }
//            
//        }
    }
    
    // запись в realm
    func saveDataToRealm<T: Object>(_ data: [T], _ id: String) {
        Realm.Configuration.defaultConfiguration = Realm.Configuration(deleteRealmIfMigrationNeeded: true)
        do {
            let realm = try Realm()
            // старые данные для удаления
            let oldData = realm.objects(T.self).filter("id == %@", id)
            realm.beginWrite()
            realm.delete(oldData)
            realm.add(data)
            try realm.commitWrite()
        } catch {
            print(error)
        }
    }
}
