//
//  PokemonDetailController.swift
//  pokemonsMVVM
//
//  Created by Ivan Pavic on 22.6.22..
//

import UIKit

class PokemonDetailController: UITableViewController {

    private var pokemonDetailsViewModel: PokemonDetailsViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        callPokemonDetailsVMForUIUpdate()

    }
    
    func callPokemonDetailsVMForUIUpdate() {
        self.pokemonDetailsViewModel = PokemonDetailsViewModel()
        self.pokemonDetailsViewModel.bindPokemonDetailToController = {
            
        }
    }
}
