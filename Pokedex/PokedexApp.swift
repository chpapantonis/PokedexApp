//
//  PokedexApp.swift
//  Pokedex
//
//  Created by Christos Papantonis on 16/10/20.
//

import SwiftUI

@main
struct PokedexApp: App {
    @Environment(\.scenePhase) private var scenePhase
    var body: some Scene {
        WindowGroup {
            PokedexList(viewModel: PokemonListViewModel())
        }
        .onChange(of: scenePhase) { (newScenePhase) in
            switch newScenePhase {
            case .active:
                print("scene is now active!")
            case .inactive:
                print("scene is now inactive!")
            case .background:
                print("scene is now in the background!")
            @unknown default:
                print("Apple must have added something new!")
            }
        }
    }
}
