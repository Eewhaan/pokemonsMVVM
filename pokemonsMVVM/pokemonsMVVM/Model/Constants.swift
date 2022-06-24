//
//  Constants.swift
//  pokemonsMVVM
//
//  Created by Ivan Pavic on 22.6.22..
//

import Foundation

import UIKit


struct PokemonsVCConstants {
    static let startingUpdateIndex = -1
    static let title = "Pokemons"
    static let tableRowHeight: CGFloat = 60
    static let cellId = "PokemonCell"
    static let detailVCId = "Detail"
}

struct PokemonsViewModelConstants {
    static let offsetIncreaseAmount = 20
    static let numberOfPokemonsPerPage = 20
}

struct PokemonsCellConstants {
    static let font = "Futura"
    static let nameFontSize: CGFloat = 17
    static let detailFontSize: CGFloat = 16
    static let detailTextColor = UIColor.white
    static let detailCornerRadius: CGFloat = 2
    static let detailBackgroundColor = UIColor.systemCyan.cgColor
    static let labelTopInset: CGFloat = 4
    static let labelBottomAndLeadingInset: CGFloat = 8
}

struct PokemonDetailsVCConstants {
    static let numberOfRows = 4
}

struct InfoCellConstants {
    static let cellId = "InfoCell"
    static let titleFont = "Futura"
    static let detailFont = "Futura Bold"
    static let fontSize: CGFloat = 17
    static let nameString = "Name"
    static let baseXpString = "Base Experience"
    static let rowHeight: CGFloat = 50
    static let leadingAndTrailingInset: CGFloat = 10
    static let titleLabelMultiplier = 0.5
    static let detailLabelMultiplier = 0.4
}

struct AvatarCellConstants {
    static let cellId = "AvatarCell"
    static let topAndBottomInset: CGFloat = 8
    static let leadingInset: CGFloat = 70
    static let rowHeight: CGFloat = 170
    static let cornerRadius: CGFloat = 45
    static let backgroundColor = UIColor.secondarySystemBackground.cgColor
    static let borderColor = UIColor.systemCyan.cgColor
    static let borderWidth: CGFloat  = 2
}

struct AbilitiesCellConstants {
    static let tableViewCellId = "AbilitiesCell"
    static let collectionViewRowHeight: CGFloat = 95
    static let collectionViewCellId = "AbilitiesCVCell"
    static let cvCellBackgroundColor = UIColor.systemCyan.cgColor
    static let cvCellCornerRadius: CGFloat = 5
    static let cvCellTextColor = UIColor.white
    static let font = UIFont(name: "Futura", size: 17)
    static let topAndBottomInset: CGFloat = 2
    static let leadingAndTrailingInset: CGFloat = 10
    static let abilityLabelText = "Abilities"
    static let collectionViewCellHeight: CGFloat = 60
    static let divider: CGFloat = 2.1
    static let abilityLabelMultiplier = 0.5
    static let collectionViewMultiplier = 0.7

}
