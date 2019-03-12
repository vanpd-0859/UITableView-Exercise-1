//
//  Contact.swift
//  UITableView-01
//
//  Created by Phan Dinh Van on 3/12/19.
//  Copyright © 2019 Phan Dinh Van. All rights reserved.
//

import Foundation
import UIKit

class Contact {
    var name: String!
    var avatar: UIImage?
    var phone: String!
    init(name: String, phone: String, avatar: UIImage?) {
        self.name = name
        self.phone = phone
        self.avatar = avatar
    }
}
