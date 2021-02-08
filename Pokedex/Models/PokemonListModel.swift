//
//  PokemonListModel.swift
//  Pokedex
//
//  Created by Christos Papantonis on 19/10/20.
//

import Foundation

struct PokemonListResponse: Codable {
    let previous: URL?
    let next: URL?
    let count: UInt
    let results: [PokemonWrapper]?
}

struct PokemonWrapper: Codable, Identifiable {
    let id = UUID()
    let url: URL?
    let name: String?

    enum CodingKeys: String, CodingKey {
        case name
        case url
    }
}
