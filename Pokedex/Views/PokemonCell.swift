//
//  PokemonCell.swift
//  Pokedex
//
//  Created by Christos Papantonis on 8/2/21.
//

import SwiftUI

struct PokemonCell: View {
    @State var backgroundColor: Color
    @State var name: String
    @State var image: String
    @State var type: String

    var body: some View {
        VStack {
            Text(name)
                .font(.headline)
                .foregroundColor(.white)
                .padding(.top, 4)
                .padding(.trailing)

            HStack {
                Text(type)
                    .font(.subheadline)
                    .bold()
                    .foregroundColor(.white)
                    .padding(.horizontal, 16)
                    .padding(.vertical, 8)
                    .overlay (
                        RoundedRectangle (cornerRadius: 20)
                            .fill(Color.white.opacity(0.2))
                    )
                    .frame(width: 100, height: 24)

                Image(image)
                    .resizable()
                    .frame(width: 80, height: 80)
                    .padding(.bottom, 4)
            }
        }
        .background(backgroundColor)
        .cornerRadius(12)
    }
}

struct PokemonCell_Previews: PreviewProvider {
    static var previews: some View {
        PokemonCell(backgroundColor: .red, name: "Charmander", image: "charma", type: "Fire")
    }
}
