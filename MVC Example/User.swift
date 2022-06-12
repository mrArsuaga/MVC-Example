//
//  User.swift
//  MVC Example
//
//  Created by Jose Arsuaga on 11/06/22.
//

import Foundation

struct User {
    let firstName, lastName, email: String
    let age: Int
    let location: Location
}

struct Location {
    let lat: Double
    let lng: Double
}
