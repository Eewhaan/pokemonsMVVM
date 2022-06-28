//
//  LoginVCExt.swift
//  pokemonsMVVM
//
//  Created by Ivan Pavic on 27.6.22..
//

import Foundation
import UIKit


extension LoginViewController {
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
