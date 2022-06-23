//
//  PokemonDetails.swift
//  pokemonsMVVM
//
//  Created by Ivan Pavic on 22.6.22..
//

import Foundation

struct PokemonDetails: Codable {
    let abilities: [Ability]
    let base_experience: Int
    let name: String
    let sprites: Sprite
}

struct Ability: Codable {
    let ability: AbilityDetail
}
struct AbilityDetail: Codable {
    let name: String
}

struct Sprite: Codable {
    let front_default: String
}

