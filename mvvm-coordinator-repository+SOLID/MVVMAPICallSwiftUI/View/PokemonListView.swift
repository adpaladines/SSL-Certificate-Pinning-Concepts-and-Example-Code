//
//  ContentView.swift
//  MVVMAPICallSwiftUI
//
//  Created by Andres D. Paladines on 7/18/23.
//

import SwiftUI

struct PokemonListView: View {
    
    @StateObject var digimonViewModel = DigimonListViewModel(
        pokemonRepository: DigimonRepository(
            networkManager: NetworkManager()
        )
    )
    
    //In case of gettin data from CoreData, it can be interchangeable
//    @StateObject var digimonViewModel2 = DigimonListViewModel(
//        pokemonRepository: DigimonCoreDataRepository()
//    )
    
    @EnvironmentObject var coordinator: Coordinator

    @State var searchText: String = ""
    @State var hasErropr: Bool = false

    var body: some View {

        NavigationStack(path: $coordinator.path) {
            VStack {
                switch digimonViewModel.viewStates {
                case .loading:
                    loadingView()
                case .errorState:
                    showErrorView()
                case .loaded:
                    showListUI()
                case .emptyView:
                    Text("No digimons found!")
                }
            }
            .task {
                await getDigimons()
            }
            .refreshable {
                await getDigimons()
            }
            .searchable(text: $searchText)
            .alert(isPresented: $hasErropr) {
                showErrorAlert()
            }
            .navigationTitle("Digimon List")
        }
    }
    
     
    @ViewBuilder
    func showListUI() -> some View {
        List(digimonViewModel.digimonList) { digimon in
            Button {
                coordinator.goToPokemonDetailsScreen(digimon: digimon)
             } label: {
                DigimonListCell(digimon: digimon)
            }
        }
    }
    
    @ViewBuilder
    func loadingView() -> some View {
        HStack {
            ProgressView()
                .frame(width: 36, height: 36, alignment: .center)
            Text("Loading Digimons...")
                .frame(height: 36, alignment: .center)
        }
    }
    
    @ViewBuilder
    func showErrorView() -> some View {
        HStack {
            Image(systemName: "exclamationmark.triangle")
            Text("Error: \(digimonViewModel.customError?.localizedDescription ?? "Something went wrong.")")
        }
    }
    
    
    func showErrorAlert() -> Alert {
        Alert(
            title: Text("Something went wrong"),
            message: Text(digimonViewModel.customError?.localizedDescription ?? ""),
            dismissButton: .default(Text("Ok"))
        )
    }
    
    func getDigimons() async {
//        if digimonViewModel.digimonList.count == 0 {
            await digimonViewModel.getDigimonList()
//        }
        
        if digimonViewModel.customError != nil {
            hasErropr = true
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
//        let vm = DigimonListViewModel(networkManager: NetworkManager())
//        PokemonListView(digimonViewModel: vm)
        PokemonListView()
            .environmentObject(Coordinator())
    }
}
