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
    var abilities = [Ability]()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Unable to initialize AbilitiesCell")
    }
    
    func setupViews() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        abilitiesCollectionView = AbilitiesCollectionView(frame: CGRect(origin: CGPoint(x: 0, y: 0), size: self.contentView.frame.size), collectionViewLayout: layout)
        abilitiesCollectionView.translatesAutoresizingMaskIntoConstraints = false
        abilitiesCollectionView.setup(parent: self)
        self.addSubview(abilitiesCollectionView)
        
        abilityLabel = UILabel()
        abilityLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(abilityLabel)
        
        abilityLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(OffsetsAndInsets.abilityLabelMultiplier)
        }
        
        abilitiesCollectionView.snp.makeConstraints { make in
            make.top.equalTo(abilityLabel.snp.bottom)
            make.height.equalToSuperview().multipliedBy(OffsetsAndInsets.collectionViewMultiplier)
            make.trailing.leading.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
    func loadSetup(abilities: [Ability]) {
        self.abilityLabel.font = UIFont(name: Fonts.basicFont, size: Dimensions.basicFontSize)
        self.abilityLabel.textAlignment = .center
        self.abilityLabel.text = TitlesAndStrings.abilities
        self.abilitiesCollectionView.setup(parent: self)
        self.abilities = abilities
    }
}
