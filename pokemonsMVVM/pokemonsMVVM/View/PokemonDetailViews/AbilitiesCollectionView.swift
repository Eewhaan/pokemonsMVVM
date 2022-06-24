//
//  AbilitiesCollectionView.swift
//  pokemonsMVVM
//
//  Created by Ivan Pavic on 23.6.22..
//

import UIKit

class AbilitiesCollectionView: UICollectionView {
        
    func setup(parent: AbilitiesCell) {
        self.delegate = parent
        self.dataSource = parent
        self.register(AbilitiesCVCell.self, forCellWithReuseIdentifier: AbilitiesCellConstants.collectionViewCellId)
    }
}
