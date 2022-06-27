//
//  PokemonsCell.swift
//  pokemonsMVVM
//
//  Created by Ivan Pavic on 22.6.22..
//

import UIKit
import SnapKit

class PokemonsCell: UITableViewCell {
    
    var nameLabel: UILabel!
    var detailLabel: UILabel!

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupViews() {
        nameLabel = UILabel()
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(nameLabel)
        
        detailLabel = UILabel()
        detailLabel.translatesAutoresizingMaskIntoConstraints = false
        detailLabel.numberOfLines = 0
        self.addSubview(detailLabel)
        
        nameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview().inset(OffsetsAndInsets.pokemonsLabelBottomAndLeadingInset)
            make.centerX.equalToSuperview()
        }
        
        detailLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).inset(OffsetsAndInsets.pokemonsLabelTopInset)
            make.bottom.leading.equalToSuperview().inset(OffsetsAndInsets.pokemonsLabelBottomAndLeadingInset)
            make.width.lessThanOrEqualToSuperview()
        }
    }
    
    func loadSetup(pokemon: Pokemon) {
        self.nameLabel.font = UIFont(name: Fonts.basicFont, size: Dimensions.basicFontSize)
        self.detailLabel.font = UIFont(name: Fonts.boldFont, size: Dimensions.detailFontSize)
        self.detailLabel.textColor = Colors.detailTextColor
        self.detailLabel.layer.backgroundColor = Colors.detailBackgroundColor
        self.detailLabel.layer.cornerRadius = BorderAndCorners.pokemonsDetailCornerRadius
        
        self.detailLabel.text = pokemon.name.capitalized
        self.nameLabel.text = pokemon.name.capitalized
    }
}
