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
            make.leading.equalToSuperview().inset(8)
            make.centerX.equalToSuperview()
        }
        
        detailLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).inset(4)
            make.bottom.leading.equalToSuperview().inset(8)
            make.width.lessThanOrEqualToSuperview()
        }
    }
    
    func loadSetup() {
        self.nameLabel.font = UIFont(name: PokemonsCellConstants.font, size: PokemonsCellConstants.nameFontSize)
        self.detailLabel.font = UIFont(name: PokemonsCellConstants.font, size: PokemonsCellConstants.nameFontSize)
        self.detailLabel.textColor = PokemonsCellConstants.detailTextColor
        self.detailLabel.layer.backgroundColor = PokemonsCellConstants.detailBackgroundColor
        self.detailLabel.layer.cornerRadius = PokemonsCellConstants.detailCornerRadius
    }
}
