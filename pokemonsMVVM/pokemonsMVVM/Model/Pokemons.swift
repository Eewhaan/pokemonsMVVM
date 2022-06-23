//
//  Pokemons.swift
//  pokemonsMVVM
//
//  Created by Ivan Pavic on 22.6.22..
//

import Foundation


struct Pokemons: Codable {
    var results: [Pokemon]
}

struct Pokemon: Codable {
    let name: String
    let url: String
}
