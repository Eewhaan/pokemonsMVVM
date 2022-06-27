//
//  PokemonsTableView.swift
//  pokemonsMVVM
//
//  Created by Ivan Pavic on 22.6.22..
//

import UIKit
import SnapKit

class PokemonsTableView: UITableView {
    
    func setupTable(delegate: PokemonsViewController) {
        self.delegate = delegate
        self.register(PokemonsCell.self, forCellReuseIdentifier: Identifiers.pokemonCell)
    }

}
