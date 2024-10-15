//
//  Groupe.swift
//  VK
//
//  Created by Inna on 15.10.2024.
//

import Foundation
import RealmSwift

class Groupe: Object {
    @objc dynamic var name: String = ""
    @objc dynamic var photo: String = ""
    
    convenience init(name: String, photo: String) {
        self.init()
        self.name = name
        self.photo = photo
    }
    
    override static func primaryKey() -> String? {
        return "name"
    }
}
