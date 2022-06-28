//
//  AbilitiesCellExt.swift
//  pokemonsMVVM
//
//  Created by Ivan Pavic on 23.6.22..
//

import Foundation
import UIKit

extension AbilitiesCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return abilities.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Identifiers.collectionViewCell, for: indexPath) as? AbilitiesCVCell else { return UICollectionViewCell() }
        cell.loadSetup(abilities: self.abilities, index: indexPath.row)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/OffsetsAndInsets.divider, height: Dimensions.collectionViewCellHeight)
    }
}
