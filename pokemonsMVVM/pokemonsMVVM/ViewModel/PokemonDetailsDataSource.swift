//
//  PokemonDetailDataSource.swift
//  pokemonsMVVM
//
//  Created by Ivan Pavic on 23.6.22..
//

import UIKit

class PokemonDetailsDataSource<T>: NSObject, UITableViewDataSource {
    
    private let details: T!
    var configureAvatarCell: (AvatarCell,T) -> () = {_,_ in}
    var configureInfoCell: (InfoCell, T, Int) -> () = {_,_,_ in}
    var configureAbilitiesCell: (AbilitiesCell, T) -> () = {_,_ in}
    
    init(details: T, configureAvatarCell: @escaping (AvatarCell, T) -> (),configureInfoCell: @escaping (InfoCell, T, Int) -> (),configureAbilitiesCell: @escaping (AbilitiesCell, T) -> ()) {
        self.details = details
        self.configureAvatarCell = configureAvatarCell
        self.configureInfoCell = configureInfoCell
        self.configureAbilitiesCell = configureAbilitiesCell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return PokemonDetailsVCConstants.numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        switch indexPath.row {
        case 0:
            guard let avatarCell = tableView.dequeueReusableCell(withIdentifier: AvatarCellConstants.cellId, for: indexPath) as? AvatarCell else { return cell }
            self.configureAvatarCell(avatarCell, details)
            cell = avatarCell
        case 1..<3:
            guard let infoCell = tableView.dequeueReusableCell(withIdentifier: InfoCellConstants.cellId, for: indexPath) as? InfoCell else { return cell }
            let index = indexPath.row
            self.configureInfoCell(infoCell, details, index)
            cell = infoCell
        case 3:
            guard let abilitiesCell = tableView.dequeueReusableCell(withIdentifier: AbilitiesCellConstants.tableViewCellId, for: indexPath) as? AbilitiesCell else { return cell }
            self.configureAbilitiesCell(abilitiesCell, details)
            cell = abilitiesCell
        default:
            break
        }
        return cell
    }

}
