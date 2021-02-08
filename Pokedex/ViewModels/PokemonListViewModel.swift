//
//  PokemonListViewModel.swift
//  Pokedex
//
//  Created by Christos Papantonis on 18/10/20.
//

import Foundation
import Combine

class PokemonListViewModel: ObservableObject {
    let buttonPublisher: some Publisher = PassthroughSubject<Void,Never>()
//    private let buttonToken: AnyCancellable

    init() {

    }
}
