//
//  AvatarCell.swift
//  pokemonsMVVM
//
//  Created by Ivan Pavic on 22.6.22..
//

import UIKit
import SnapKit

class AvatarCell: UITableViewCell {
    
    var avatarImageView: UIImageView!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        avatarImageView = UIImageView()
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        avatarImageView.contentMode = UIView.ContentMode.scaleAspectFit
        self.addSubview(avatarImageView)
        
        avatarImageView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(OffsetsAndInsets.avatarCellTopAndBottom)
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().inset(OffsetsAndInsets.avatarCellLeading)
        }
    }
    
    func loadSetup(details: PokemonDetails) {
        avatarImageView.layer.cornerRadius = BorderAndCorners.avatarCellCornerRadius
        avatarImageView.clipsToBounds = true
        avatarImageView.layer.backgroundColor = Colors.avatarCellBackground
        avatarImageView.layer.borderColor = Colors.detailBorderColor
        avatarImageView.layer.borderWidth = BorderAndCorners.avatarCellBorder
        
        if let url = URL(string: details.sprites.front_default) {
            avatarImageView.load(url: url)
        }
    }
}
