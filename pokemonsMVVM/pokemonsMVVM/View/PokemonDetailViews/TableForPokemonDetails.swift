//
//  TableForPokemonDetails.swift
//  pokemonsMVVM
//
//  Created by Ivan Pavic on 23.6.22..
//

import UIKit

class TableForPokemonDetails: UITableView {
    
    func setup(delegate: PokemonDetailsController) {
        self.delegate = delegate
        self.register(AvatarCell.self, forCellReuseIdentifier: AvatarCellConstants.cellId)
        self.register(InfoCell.self, forCellReuseIdentifier: InfoCellConstants.cellId)
        self.register(AbilitiesCell.self, forCellReuseIdentifier: AbilitiesCellConstants.tableViewCellId)
    }

}
