//
//  Photo.swift
//  VK
//
//  Created by Inna on 10.10.2024.
//

import Foundation
import SwiftyJSON
import RealmSwift


class Photo: Object {
    @objc dynamic var photo = ""
    @objc dynamic var id = ""

    convenience init(json: JSON) {//}, id: String) {
        self.init()
        id = String(json["user_id"].intValue)
       // self.id = id
        photo = json["orig_photo"]["url"].stringValue
    }
}
