//
//  ContentView.swift
//  Pokedex
//
//  Created by Christos Papantonis on 16/10/20.
//

import SwiftUI
import Combine

struct PokedexList: View {

    @ObservedObject var viewModel: PokemonListViewModel

    let columns = Array(repeating: GridItem(.flexible()), count: 2)

    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns, alignment: .center, spacing: 16, pinnedViews: [PinnedScrollableViews.sectionHeaders]) {
                    ForEach (0..<100) { _ in
                        PokemonCell(backgroundColor: .red, name: "Charmader", image: "charma", type: "Fire")
                    }

                }
            }
            .navigationTitle("Pokedex")
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            PokedexList(viewModel: PokemonListViewModel())
        }
    }
}
