//
//  PokemonsTests.swift
//  pokemonsMVVMTests
//
//  Created by Ivan Pavic on 28.6.22..
//

import XCTest
@testable import pokemonsMVVM

class PokemonsViewModelTests: XCTestCase {
    
    func testFetchPokemons() {
        let expectation = expectation(description: "Waiting for getData call to complete.")
        var result: Result<Pokemons, APIError>?
        let perPage: Int = 30
        let offset = 150
        let name = "mew"
        
        DataService.shared.getData(perPage: perPage, offset: offset, urlString: URLS.pokemonsURL) { (response: Result<Pokemons, APIError>) in
            result = response
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 2) { error in
            XCTAssertNil(error)
            switch result {
            case .success(let pokemons):
                XCTAssertEqual(pokemons.results.count, perPage)
                XCTAssertEqual(pokemons.results.first?.name, name)
            case .failure, .none:
                XCTFail()
            }
        }
    }
    
}
