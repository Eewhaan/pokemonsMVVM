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
            make.top.bottom.equalToSuperview().inset(OffsetsAndInsets.abilitiesTopAndBottom)
            make.leading.trailing.equalToSuperview().inset(OffsetsAndInsets.abilitiesLeadingAndTrailing)
        }
    }
    
    func loadSetup(abilities: [Ability], index: Int) {
        nameLabel.layer.backgroundColor = Colors.detailBackgroundColor
        nameLabel.layer.cornerRadius = BorderAndCorners.abilitiesCVCornerRadius
        nameLabel.textAlignment = .center
        nameLabel.textColor = Colors.detailTextColor
        nameLabel.font = UIFont(name: Fonts.boldFont, size: Dimensions.basicFontSize)
        nameLabel.text = abilities[index].ability.name.capitalized
    }
}
