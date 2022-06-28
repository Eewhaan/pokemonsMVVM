//
//  InfoCell.swift
//  pokemonsMVVM
//
//  Created by Ivan Pavic on 22.6.22..
//

import UIKit
import SnapKit

class InfoCell: UITableViewCell {
    
    var detailLabel: UILabel!
    var titleLabel: UILabel!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    required init?(coder: NSCoder) {
        fatalError("Unable to initialize InfoCell")
    }
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    private func setupViews() {
        detailLabel = UILabel()
        detailLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(detailLabel)
        
        titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(titleLabel)
        
        titleLabel.snp.makeConstraints{ make in
            make.top.bottom.equalToSuperview()
            make.leading.equalToSuperview().inset(OffsetsAndInsets.infoCellLeadingAndTrailing)
            make.width.equalToSuperview().multipliedBy(OffsetsAndInsets.infoCellTitleLabelMultiplier)
        }
        detailLabel.snp.makeConstraints { make in
            make.centerY.equalTo(titleLabel.snp.centerY)
            make.trailing.equalToSuperview().inset(OffsetsAndInsets.infoCellLeadingAndTrailing)
            make.width.equalToSuperview().multipliedBy(OffsetsAndInsets.infoCellDetailLabelMultiplier)
        }
    }
    
    func loadSetup(details: PokemonDetails, index: Int) {
        self.titleLabel.font = UIFont(name: Fonts.basicFont, size: Dimensions.basicFontSize)
        self.titleLabel.textAlignment = .left
        self.detailLabel.font = UIFont(name: Fonts.boldFont, size: Dimensions.detailFontSize)
        self.detailLabel.textAlignment = .center
        
        switch index {
        case 1:
            self.titleLabel.text = TitlesAndStrings.nameLabel
            self.detailLabel.text = details.name.capitalized
        case 2:
            self.titleLabel.text = TitlesAndStrings.baseXpLabel
            self.detailLabel.text = String(describing: details.base_experience)
        default:
            break
        }
    }
}
