//
//  LoginViewModelTest.swift
//  pokemonsMVVMTests
//
//  Created by Ivan Pavic on 28.6.22..
//

import XCTest
@testable import pokemonsMVVM

class LoginViewModelTest: XCTestCase {
    
    func testAuthenticate() {
        let email = "sanja.djuricic@itengine.rs"
        let password = "admin123"
        let parameters = [TitlesAndStrings.email: email, TitlesAndStrings.password: password]
        let expectation = expectation(description: "Waiting for postData call to finish.")
        var result: Result<LoginData, APIError>?
        
        DataService.shared.postRequest(urlString: URLS.loginURL, params: parameters, type: LoginData.self) { response in
            result = response
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 2) { error in
            XCTAssertNil(error)
            switch result {
            case .success(let data):
                XCTAssertEqual(data.data.email, email)
                XCTAssertNotNil(data.data.token)
            case .failure(let error):
                XCTAssertNotNil(error)
            default:
                XCTFail()
            }
        }
    }
}
