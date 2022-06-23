//
//  PokemonDetailViewModel.swift
//  pokemonsMVVM
//
//  Created by Ivan Pavic on 22.6.22..
//

import UIKit

class PokemonDetailsViewModel: NSObject {
    
    var selectedPokemon: Pokemon?
    private (set) var pokemonDetails: PokemonDetails! {
        didSet {
            self.bindPokemonDetailToController()
        }
    }
    
    var bindPokemonDetailToController: (()->()) = {}
    
    override init() {
        super.init()
        fetchPokemonDetails()
    }
    
    func fetchPokemonDetails() {
        guard let selectedPokemon = selectedPokemon else { return }
        DataService.shared.getPokemonDetail(pokemonUrl: selectedPokemon.url) { details in
            self.pokemonDetails = details
        }
    }

}
