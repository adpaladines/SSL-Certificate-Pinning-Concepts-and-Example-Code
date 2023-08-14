//
//  Coordinator.swift
//  MVVMAPICallSwiftUI
//
//  Created by Andres D. Paladines on 8/2/23.
//

import Foundation
import SwiftUI

@MainActor
class Coordinator: ObservableObject {

    @Published var path = NavigationPath()

    var digimon: Digimon?

    func goToPokemonList() {
        path.append(MyPage.list)
    }

    func goToPokemonDetailsScreen(digimon: Digimon) {
        self.digimon = digimon
        path.append(MyPage.detailsScreen)
    }

    @ViewBuilder
    func getPage(_ page: MyPage) -> some View {
        switch page {
        case .list:
            PokemonListView()
        case .detailsScreen:
            PokemonDetailsView(digimon: self.digimon ?? Digimon(name: "No digimon selected", img: "N/A", level: "N/A"))
        case .location:
            Text("This will be the location Map")
        }
    }
}


enum MyPage: String, CaseIterable, Identifiable {

    case list
    case detailsScreen
    case location

    var id: String {
        self.rawValue
    }
}
