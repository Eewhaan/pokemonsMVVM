//
//  AbilitiesCVCell.swift
//  pokemonsMVVM
//
//  Created by Ivan Pavic on 23.6.22..
//

import UIKit
import SnapKit

class AbilitiesCVCell: UICollectionViewCell {
    var nameLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    required init?(coder: NSCoder) {
        fatalError("Unable to initialize AbilitiesCVCell")
    }
    
    func setupViews() {
        nameLabel = UILabel()
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(nameLabel)
        
        nameLabel.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(AbilitiesCellConstants.topAndBottomInset)
            make.leading.trailing.equalToSuperview().inset(AbilitiesCellConstants.leadingAndTrailingInset)
        }
    }
    
    func loadSetup(abilities: [Ability], index: Int) {
        nameLabel.layer.backgroundColor = AbilitiesCellConstants.cvCellBackgroundColor
        nameLabel.layer.cornerRadius = AbilitiesCellConstants.cvCellCornerRadius
        nameLabel.textAlignment = .center
        nameLabel.textColor = AbilitiesCellConstants.cvCellTextColor
        nameLabel.font = AbilitiesCellConstants.font
        nameLabel.text = abilities[index].ability.name.capitalized
    }
}
