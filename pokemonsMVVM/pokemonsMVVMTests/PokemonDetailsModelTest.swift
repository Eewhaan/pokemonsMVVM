//
//  PokemonDetailsModelTest.swift
//  pokemonsMVVMTests
//
//  Created by Ivan Pavic on 28.6.22..
//

import XCTest
@testable import pokemonsMVVM

class PokemonDetailsModelTest: XCTestCase {
    
    func testFetchPokemonDetails() {
        let expectation = expectation(description: "Waiting for getData call to complete.")
        var result: Result<PokemonDetails, APIError>?
        let selectedPokemonName = "wigglytuff"
        let selectedPokemonURL = "https://pokeapi.co/api/v2/pokemon/\(selectedPokemonName)"
        
        DataService.shared.getData(perPage: nil, offset: nil, urlString: selectedPokemonURL) { (response: Result<PokemonDetails, APIError>) in
            result = response
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 2) { error in
            XCTAssertNil(error)
            switch result {
            case .success(let pokemon):
                XCTAssertEqual(pokemon.name, selectedPokemonName)
                XCTAssertEqual(pokemon.abilities.count, 3)
                XCTAssertNotNil(pokemon.sprites.front_default)
                XCTAssertEqual(pokemon.base_experience, 218)
            case .failure, .none:
                XCTFail()
            }
        }
    }
}
