//
//  RickAndMortyAPI.swift
//  RickAndMorty
//
//  Created by Natália Arantes on 03/08/20.
//  Copyright © 2020 Natália Arantes. All rights reserved.
//

import Foundation

enum RickAndMortyError: Error {
    case parsingError
    case apiError

    var localizedDescription: String {
        switch self {
        case .apiError:
            return "Error consulting API"

        case .parsingError:
            return "Unknown error found"
        }
    }
}

class RickAndMortyAPI: APIInterface {

    var baseURL: URL? = URL(string: "https://rickandmortyapi.com/api")

    func send<T:Decodable>(apiRequest: APIRequest, callback: @escaping (Result<T, Error>) -> Void) {
        let request = apiRequest.request(with: self.baseURL!)

        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let data = data,
                let httpResponse = response as? HTTPURLResponse,
                httpResponse.statusCode == 200 {

                do {
                    let model: T = try JSONDecoder().decode(T.self, from: data)
                    DispatchQueue.main.async {
                        callback(.success(model))
                    }
                } catch let error {
                    print(error)
                    DispatchQueue.main.async {
                        callback(.failure(RickAndMortyError.parsingError))
                    }
                }
            } else {
                DispatchQueue.main.async {
                    callback(.failure(RickAndMortyError.apiError))
                }
            }

        }

        task.resume()
    }
}
