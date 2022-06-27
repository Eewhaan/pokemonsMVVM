//
//  PokemonDetailController.swift
//  pokemonsMVVM
//
//  Created by Ivan Pavic on 22.6.22..
//

import UIKit
import SnapKit

class PokemonDetailsController: UIViewController, UITableViewDelegate {

    private var pokemonDetailsViewModel: PokemonDetailsViewModel!
    private var pokemonDetailsDataSource: PokemonDetailsDataSource<PokemonDetails>!
    var tableForPokemonDetails: TableForPokemonDetails!
    var selectedPokemon: String?
    private var rowHeight: CGFloat = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        if selectedPokemon != nil {
            callPokemonDetailsVMForUIUpdate()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return Dimensions.avatarCellRowHeight
        case 1..<3:
            return Dimensions.infoCellRowHeight
        case 3:
            return rowHeight
        default:
            return 0
        }
    }
    
    func callPokemonDetailsVMForUIUpdate() {
        self.pokemonDetailsViewModel = PokemonDetailsViewModel()
        self.pokemonDetailsViewModel.selectedPokemonURL = selectedPokemon
        self.pokemonDetailsViewModel.bindPokemonDetailToController = {
            self.updateTableData()
        }
    }
    
    func updateTableData() {
        self.pokemonDetailsDataSource = PokemonDetailsDataSource(details: self.pokemonDetailsViewModel.pokemonDetails, configureAvatarCell: { cell, details in
            cell.loadSetup(details: details)
        },configureInfoCell: { cell, details, index in
            cell.loadSetup(details: details, index: index)
        }, configureAbilitiesCell: { cell, details in
            cell.loadSetup(abilities: details.abilities)
        })
        
        DispatchQueue.main.async { [weak self] in
            self?.tableForPokemonDetails.dataSource = self?.pokemonDetailsDataSource
            self?.calculateRowHeight()
            self?.tableForPokemonDetails.layoutIfNeeded()
            self?.tableForPokemonDetails.reloadData()
        }
    }
    
    func configureViews() {
        self.tableForPokemonDetails = TableForPokemonDetails()
        self.view.addSubview(tableForPokemonDetails)
        self.tableForPokemonDetails.setup(delegate: self)
        self.tableForPokemonDetails.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.leading.equalTo(view.safeAreaLayoutGuide.snp.leading)
            make.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing)
        }
    }
    
    func calculateRowHeight() {
        let abilityCount = pokemonDetailsViewModel.pokemonDetails.abilities.count
        let multiplier = CGFloat((abilityCount + abilityCount % 2)/2)
        rowHeight = multiplier * Dimensions.collectionViewRowHeight
        
    }
}
