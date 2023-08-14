//
//  PokemonDetailsView.swift
//  MVVMAPICallSwiftUI
//
//  Created by Andres D. Paladines on 7/18/23.
//

import SwiftUI

struct PokemonDetailsView: View {
    @State var digimon: Digimon
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: digimon.img)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
//                    .frame(width: 64, height: 64)
            } placeholder: {
                ProgressView()
//                    .frame(width: 64, height: 64)
            }
            Text(digimon.name).font(.title)
        }
        
    }
}

struct PokemonDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        let digimon = Digimon(name: "koromon", img: "https://digimon.shadowsmith.com/img/koromon.jpg", level: "In Training")
        PokemonDetailsView(digimon: digimon)
    }
}
