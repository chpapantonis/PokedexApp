//
//  ApiService.swift
//  Pokedex
//
//  Created by Christos Papantonis on 19/10/20.
//

import Foundation
import Combine

struct APIClient {

    func run<T: Decodable>(_ request: URLRequest) -> AnyPublisher<T, Error> {
        return URLSession.shared.dataTaskPublisher(for: request)
            .tryMap { data, response -> Data in
                guard let httpResponse = response as? HTTPURLResponse else {
                    throw NetworkError.HttpError.generic
                }
                let code = httpResponse.statusCode
                guard code == 200 else { throw NetworkError.ResponseCodeError(fromRawValue: code) }
                return data
            }
            .decode(type: T.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}



enum API {
    static let apiClient = APIClient()
    static let baseUrl = URL(string: "https://pokeapi.co/api/v2/")!
}

// 2
enum APIPath: String {
    case pokemons = "pokemon"
}

extension API {

    static func request<T: Decodable>(_ path: APIPath, type: T.Type = T.self, params: [String: String]? = nil) -> AnyPublisher<T, Error> {

        guard var components = URLComponents(url: baseUrl.appendingPathComponent(path.rawValue), resolvingAgainstBaseURL: true) else {
            fatalError("Couldn't create URLComponents")
        }

        components.queryItems = params?.map { URLQueryItem(name: $0, value: $1) }
        let request = URLRequest(url: components.url!)

        return apiClient.run(request)
            .eraseToAnyPublisher()
    }
}
