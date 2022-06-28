//
//  User.swift
//  pokemonsMVVM
//
//  Created by Ivan Pavic on 24.6.22..
//

import Foundation

struct LoginData: Codable {
    var data: UserData
    var success: Bool
}

struct UserData: Codable {
    var email: String
    var token: String
}
