//
//  AbilitiesCell.swift
//  pokemonsMVVM
//
//  Created by Ivan Pavic on 22.6.22..
//

import UIKit
import SnapKit

class AbilitiesCell: UITableViewCell {
    
    var abilitiesCollectionView: AbilitiesCollectionView!
    var abilityLabel: UILabel!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Unable to initialize AbilitiesCell")
    }
    
    func setupViews() {
        abilitiesCollectionView = AbilitiesCollectionView()
        abilitiesCollectionView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(abilitiesCollectionView)
        
        abilityLabel = UILabel()
        abilityLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(abilityLabel)
        
        abilityLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.5)
        }
        
        abilitiesCollectionView.snp.makeConstraints { make in
            make.top.equalTo(abilityLabel.snp.bottom)
            make.height.equalToSuperview().multipliedBy(0.7)
            make.trailing.leading.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
    func configure() {
        self.abilityLabel.font = AbilitiesCellConstants.font
        self.abilityLabel.textAlignment = .center
        self.abilitiesCollectionView.setup(parent: self)
    }
}
