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
        DataService.shared.getData(perPage: nil, offset: nil, urlString: selectedPokemonURL) { (result:Result<PokemonDetails, APIError>) in
            switch result {
            case .success(let details):
                self.pokemonDetails = details
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }

}
