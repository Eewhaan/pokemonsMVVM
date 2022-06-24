//
//  PokemonsTVDataSource.swift
//  pokemons
//
//  Created by Ivan Pavic on 22.6.22..
//

import UIKit

class PokemonsTableDataSource<CELL: UITableViewCell, T> : NSObject, UITableViewDataSource {
    
    private let cellId: String!
    private var items: [T]!
    var configureCell: (CELL, T) -> () = {_,_ in }
    
    init(cellId: String, items: [T], configureCell: @escaping (CELL, T) -> ()) {
        self.cellId = cellId
        self.items = items
        self.configureCell = configureCell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as? CELL else {
            return UITableViewCell()
        }
        let item = items[indexPath.row]
        self.configureCell(cell, item)
        return cell
    }
    

}
