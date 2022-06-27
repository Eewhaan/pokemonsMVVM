//
//  LogInButton.swift
//  pokemonsMVVM
//
//  Created by Ivan Pavic on 27.6.22..
//

import UIKit

class LogInButton: UIButton {
    
    func configure() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.setTitle(TitlesAndStrings.logInButton, for: .normal)
        self.layer.backgroundColor = UIColor.systemCyan.cgColor
        self.layer.cornerRadius = 10
        self.layer.borderColor = UIColor.separator.cgColor
        self.titleLabel?.font = UIFont(name: Fonts.boldFont, size: Dimensions.basicFontSize)
        self.tintColor = UIColor.white
    }
}
