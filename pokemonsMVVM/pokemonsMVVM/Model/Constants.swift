//
//  Constants.swift
//  pokemonsMVVM
//
//  Created by Ivan Pavic on 22.6.22..
//

import Foundation

import UIKit


struct URLS {
    static let loginURL = "http://161.97.149.194:5000/api/account/navigator/sign-in"
    static let pokemonsURL = "https://pokeapi.co/api/v2/pokemon"
}

struct Fonts {
    static let basicFont = "Futura"
    static let boldFont = "Futura Bold"
}

struct TitlesAndStrings {
    static let pokemonsVCTitle = "Pokemons"
    static let nameLabel = "Name"
    static let baseXpLabel = "Base Experience"
    static let usernamePlaceholder = "Enter Username"
    static let passwordPlaceholder = "Enter Password"
    static let defaultsKey = "LoggedUser"
    static let alertTitle = "Failed to log in"
    static let alertMessage = "Incorrect password or username"
    static let alertActionTitle = "Try again"
    static let email = "email"
    static let password = "password"
    static let logInButton = "Log In"
    static let logOutButton = "Log Out"
    static let abilities = "Abilities"
}

struct Identifiers {
    static let pokemonCell = "PokemonCell"
    static let infoCell = "InfoCell"
    static let avatarCell = "AvatarCell"
    static let abilitiesCell = "AbilitiesCell"
    static let collectionViewCell = "AbilitiesCVCell"
}

struct Dimensions {
    static let pokemonsVCRowHeight: CGFloat = 60
    static let infoCellRowHeight: CGFloat = 50
    static let avatarCellRowHeight: CGFloat = 170
    static let collectionViewCellHeight: CGFloat = 60
    static let collectionViewRowHeight: CGFloat = 95
    static let textFieldHeight: CGFloat = 50
    static let logInButtonHeight: CGFloat = 60
    static let logInButtonWidth: CGFloat = 100
    static let basicFontSize: CGFloat = 17
    static let detailFontSize: CGFloat = 16
}

struct OffsetsAndInsets {
    static let loginButtonBottom: CGFloat = 50
    static let loginButtonTop: CGFloat = 10
    static let passwordTFTop: CGFloat = 5
    static let passwordTFLeading: CGFloat = 30
    static let passwordTFTrailing: CGFloat = 30
    static let pokemonsLabelTopInset: CGFloat = 4
    static let pokemonsLabelBottomAndLeadingInset: CGFloat = 8
    static let infoCellLeadingAndTrailing: CGFloat = 10
    static let infoCellTitleLabelMultiplier: CGFloat = 0.5
    static let infoCellDetailLabelMultiplier: CGFloat = 0.4
    static let abilityLabelMultiplier = 0.5
    static let collectionViewMultiplier = 0.7
    static let abilitiesTopAndBottom: CGFloat = 4
    static let abilitiesLeadingAndTrailing: CGFloat = 8
    static let divider: CGFloat = 2.1
    static let avatarCellTopAndBottom: CGFloat = 8
    static let avatarCellLeading: CGFloat = 70
}

struct BorderAndCorners {
    static let avatarCellCornerRadius: CGFloat = 45
    static let avatarCellBorder: CGFloat = 2
    static let buttonCornerRadius: CGFloat = 10
    static let pokemonsDetailCornerRadius: CGFloat = 5
    static let abilitiesCVCornerRadius: CGFloat = 10

}

struct Colors {
    static let detailBackgroundColor = UIColor.systemCyan.cgColor
    static let detailBorderColor = UIColor.systemCyan.cgColor
    static let detailTextColor = UIColor.white
    static let textFieldBackground = UIColor.systemGray6.cgColor
    static let avatarCellBackground = UIColor.secondarySystemBackground.cgColor
}

struct PokemonsVCConstants {
    static let startingUpdateIndex = -1
}

struct PokemonsViewModelConstants {
    static let offsetIncreaseAmount = 20
    static let numberOfPokemonsPerPage = 20
}

struct PokemonDetailsVCConstants {
    static let numberOfRows = 4
}
