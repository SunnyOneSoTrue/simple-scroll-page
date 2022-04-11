//
//  Structs.swift
//  simple scroll page
//
//  Created by USER on 11.04.22.
//

import Foundation
import SwiftUI

struct User {
    var name: String
    var username: String
    var image: UIImage?
}

struct Post {
    var user: User
    var text: String
    var image: UIImage?
}
