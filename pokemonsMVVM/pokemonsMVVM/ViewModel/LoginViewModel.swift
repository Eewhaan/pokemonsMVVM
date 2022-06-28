//
//  LoginViewModel.swift
//  pokemonsMVVM
//
//  Created by Ivan Pavic on 24.6.22..
//

import UIKit

class LoginViewModel: NSObject {
    
    private (set) var user: LoginData! {
        didSet {
            self.bindLoginVMToController()
        }
    }
    private (set) var error: APIError! {
        didSet {
            self.bindLoginVMToController()
        }
    }
    var bindLoginVMToController: (()->()) = {}
    override init() {
        super.init()
        
    }
    
    func authenticate(parameters: [String: String]) {
        DataService.shared.postRequest(urlString: URLS.loginURL, params: parameters, type: LoginData.self) { result in
            switch result {
            case .success(let user):
                self.user = user
            case .failure(let error):
                self.error = error
            }
        }
    }
}
