//
//  PokemonsViewModel.swift
//  pokemonsMVVM
//
//  Created by Ivan Pavic on 22.6.22..
//

import UIKit


class PokemonsViewModel: NSObject {
    
    private var pokemonDetailsViewModel: PokemonDetailsViewModel!
    private (set) var pokemonsData = [Pokemon]() {
        didSet {
            self.bindPokemonsVMToController()
        }
    }
    private var offset = 0
    var bindPokemonsVMToController: (()->()) = {}
    
    override init() {
        super.init()
        fetchData()
    }
    
    func fetchData(completed: ((Bool)->Void)? = nil) {
        DataService.shared.getPokemons(perPage: PokemonsViewModelConstants.numberOfPokemonsPerPage, offset: offset) { result in
            switch result {
            case .success(let pokemons):
                self.pokemonsData.append(contentsOf: pokemons)
                self.offset += PokemonsViewModelConstants.offsetIncreaseAmount
                completed?(true)
            case .failure(let error):
                print(error.localizedDescription)
                completed?(false)
            }
        }
    }
    

}
