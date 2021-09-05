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
    let spacing: CGFloat = 16
    let columns: [GridItem]

    init (viewModel: PokemonListViewModel) {
        columns = Array(repeating: GridItem(spacing: spacing, alignment: nil), count: 2)
        self.viewModel = viewModel
    }

    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns, alignment: .center, spacing: spacing, pinnedViews: [PinnedScrollableViews.sectionHeaders]) {
                    ForEach (0..<100, id: \.self) { _ in
                        PokemonCell(backgroundColor: .red, name: "Charmader", image: "charma", type: "Fire")
                    }
                }
            }
            .padding(.horizontal, spacing)
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
