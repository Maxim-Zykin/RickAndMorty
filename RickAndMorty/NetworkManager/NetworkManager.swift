//
//  NetworkManager.swift
//  RickAndMorty
//
//  Created by Максим Зыкин on 17.08.2023.
//

import Foundation

final class NetworkManager<T: Decodable> {
    
    static func fetchData(urlJSON: String, completion: @escaping (Result<T, NetworkError>) -> Void) {
        guard let url = URL(string: urlJSON) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "Error")
                return
            }
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let category = try decoder.decode(T.self, from: data)
                    completion(.success(category))
                    print(category)
            } catch let error {
                print("Error--", error)
            }
        }.resume()
    }
}

enum NetworkError: Error {
    case invalidResponse
    case invalidData
    case decodingError(err: String)
    case error(err: String)
}
