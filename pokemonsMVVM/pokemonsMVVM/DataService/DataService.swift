//
//  DataService.swift
//  pokemonsMVVM
//
//  Created by Ivan Pavic on 22.6.22..
//

import Foundation

class DataService {
    
    static let shared = DataService()
    
    private init() {}
    
    
    func getData<T: Codable>(perPage: Int?, offset: Int?, urlString: String, _ completion: @escaping ((Result<T, APIError>)) -> Void) {
        var components = URLComponents(string: urlString)
        if let perPage = perPage, let offset = offset {
            components?.queryItems = [
                URLQueryItem(name: "limit", value: "\(perPage)"),
                URLQueryItem(name: "offset", value: "\(offset)")
            ]
        }
        guard let url = components?.url else {
            print("Error creating url")
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard error == nil else {
                print("Eror:\(String(describing: error?.localizedDescription))")
                return
            }
            guard let data = data else {
                print("Error: unable to get data")
                return
            }
            do {
                let decodedData = try JSONDecoder().decode(T.self, from: data)
                completion(.success(decodedData))
            } catch let error {
                print (error)
                return
            }
        }.resume()
    }
    
    func postRequest<T: Codable>(urlString: String, params: [String: Any], type: T.Type, _ completion: @escaping ((Result<T, APIError>)) -> Void) {
        guard let url = URL(string: urlString) else {
            print("Unable to create URL")
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")

        do {
            let jsonData = try JSONSerialization.data(withJSONObject: params, options: .prettyPrinted)
            URLSession.shared.uploadTask(with: request, from: jsonData) { data, response, error in
                guard let data = data, error == nil else {
                    print(error?.localizedDescription as Any)
                    return
                }
                guard let response = response as? HTTPURLResponse, (200..<299) ~= response.statusCode else {
                    print ("Error calling POST Method")
                    print(String(describing: response))
                    completion(.failure(.failure))
                    return
                }
                do {
                    let mappedResponse = try JSONDecoder().decode(T.self, from: data)
                    completion(.success(mappedResponse))
                } catch let error {
                    print(error)
                    completion(.failure(.failure))
                }
            }.resume()
            
        } catch let error {
            print(error)
            return
        }
    }
    
    func decodeData<T: Codable>(type: T.Type, key: String) -> T? {
        let defaults = UserDefaults.standard
        if let savedData = defaults.object(forKey: key) as? Data {
            let decoder = JSONDecoder()
            do {
                let userData = try decoder.decode(T.self, from: savedData)
                return userData
            } catch {
                print("Unable to decode token")
                return nil
            }
        }
        
        return nil
    }

}
