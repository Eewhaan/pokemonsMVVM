//
//  UserNameTextField.swift
//  pokemonsMVVM
//
//  Created by Ivan Pavic on 27.6.22..
//

import UIKit

class LogInTextField: UITextField {
    
    let padding = UIEdgeInsets(top: 2, left: 20, bottom: 2, right: 20)

    func configure(placeHolder: String, delegate: LoginViewController) {
        self.delegate = delegate
        self.translatesAutoresizingMaskIntoConstraints = false
        self.autocapitalizationType = .none
        self.placeholder = placeHolder
        self.font = UIFont(name: Fonts.basicFont, size: Dimensions.basicFontSize)
        self.adjustsFontSizeToFitWidth = true
        self.layer.borderWidth = 1
        self.layer.cornerRadius = 10
        self.layer.borderColor = Colors.detailBorderColor
        self.layer.backgroundColor = Colors.textFieldBackground
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

}
