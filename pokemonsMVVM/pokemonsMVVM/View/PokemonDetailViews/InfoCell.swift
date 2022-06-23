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
    
    private func setupViews() {
        detailLabel = UILabel()
        detailLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(detailLabel)
        
        titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(titleLabel)
        
        titleLabel.snp.makeConstraints{ make in
            make.top.bottom.equalToSuperview()
            make.leading.equalToSuperview().inset(8)
            make.width.equalToSuperview().multipliedBy(0.5)
        }
        detailLabel.snp.makeConstraints { make in
            make.centerX.equalTo(titleLabel.snp.centerX)
            make.height.equalTo(titleLabel.snp.height)
            make.trailing.equalToSuperview().inset(-8)
            make.width.equalToSuperview().multipliedBy(0.4)
        }
    }
    
    func configure() {
        self.titleLabel.font = UIFont(name: InfoCellConstants.titleFont, size: InfoCellConstants.fontSize)
        self.titleLabel.textAlignment = .left
        self.detailLabel.font = UIFont(name: InfoCellConstants.detailFont, size: InfoCellConstants.fontSize)
        self.detailLabel.textAlignment = .center
    }
}
