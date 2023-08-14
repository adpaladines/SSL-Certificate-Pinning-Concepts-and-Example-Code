//
//  DigimonListCell.swift
//  MVVMAPICallSwiftUI
//
//  Created by Andres D. Paladines on 7/18/23.
//

import SwiftUI

struct DigimonListCell: View {
    
    @State var digimon: Digimon
    
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: digimon.img)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 64, height: 64)
            } placeholder: {
                ProgressView()
                    .frame(width: 64, height: 64)
            }
            Text(digimon.name)
        }
    }
}

struct DigimonListCell_Previews: PreviewProvider {
    
    
    static var previews: some View {
        let digimon = Digimon(name: "koromon", img: "https://digimon.shadowsmith.com/img/koromon.jpg", level: "In Training")
        DigimonListCell(digimon: digimon)
    }
}
