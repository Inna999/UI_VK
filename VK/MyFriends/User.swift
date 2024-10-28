//
//  User.swift
//  VK
//
//  Created by Inna on 10.10.2024.
//

import Foundation
import RealmSwift
import SwiftyJSON

class User: Object {
    @objc dynamic var id = ""
    @objc dynamic var firstName = ""
    @objc dynamic var lastName = ""
    @objc dynamic var photo = ""

    convenience init(json: JSON) {//, id: String) {
        self.init()
        
        //self.id = id
        id = String(json["id"].intValue)
        firstName = json["first_name"].stringValue
        lastName = json["last_name"].stringValue
        photo = json["photo_100"].stringValue
    }
}
