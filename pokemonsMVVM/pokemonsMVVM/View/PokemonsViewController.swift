//
//  ViewController.swift
//  pokemonsMVVM
//
//  Created by Ivan Pavic on 22.6.22..
//

import UIKit
import SnapKit

class PokemonsViewController: UIViewController, UITableViewDelegate {
    
    private var pokemonsViewModel: PokemonsViewModel!
    private var pokemonsTableDataSource: PokemonsTableDataSource<PokemonsCell, Pokemon>!
    private var updateIndex = PokemonsVCConstants.startingUpdateIndex
    var pokemonsTableView: PokemonsTableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = PokemonsVCConstants.title
        callPokemonVMForUIUpdate()
        configureViews()
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == updateIndex {
            self.pokemonsViewModel.fetchData()
        }
    }
    
    func callPokemonVMForUIUpdate() {
        self.pokemonsViewModel = PokemonsViewModel()
        self.pokemonsViewModel.bindPokemonsVMToController = {
            self.updateTableData()
            self.updateIndex += PokemonsViewModelConstants.offsetIncreaseAmount
        }
    }
    
    func updateTableData() {
        self.pokemonsTableDataSource = PokemonsTableDataSource(cellId: PokemonsVCConstants.cellId, items: self.pokemonsViewModel.pokemonsData, configureCell: { cell, pokemon in
            cell.nameLabel.text = pokemon.name.capitalized
            cell.detailLabel.text = pokemon.name.capitalized
            cell.loadSetup()
        })
        
        DispatchQueue.main.async { [weak self] in
            self?.pokemonsTableView.dataSource = self?.pokemonsTableDataSource
            self?.pokemonsTableView.reloadData()
        }
    }
    
    func configureViews() {
        self.pokemonsTableView = PokemonsTableView()
        self.view.addSubview(pokemonsTableView)
        self.pokemonsTableView.setupTable(delegate: self)
        self.pokemonsTableView.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.leading.equalTo(view.safeAreaLayoutGuide.snp.leading)
            make.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing)
        }
    }
}

