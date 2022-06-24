//
//  PokemonDetailViewModel.swift
//  pokemonsMVVM
//
//  Created by Ivan Pavic on 22.6.22..
//

import UIKit

class PokemonDetailsViewModel: NSObject {
    
    var selectedPokemonURL: String? {
        didSet {
            self.fetchPokemonDetails()
        }
    }
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
        guard let selectedPokemonURL = selectedPokemonURL else {
            return
        }
        DataService.shared.getPokemonDetail(pokemonUrl: selectedPokemonURL) { details in
            self.pokemonDetails = details
        }
    }

}
