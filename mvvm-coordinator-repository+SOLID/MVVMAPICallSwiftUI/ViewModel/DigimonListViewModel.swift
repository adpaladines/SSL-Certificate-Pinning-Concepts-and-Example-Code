//
//  DigimonListViewModel.swift
//  MVVMAPICallSwiftUI
//
//  Created by Andres D. Paladines on 7/18/23.
//

import Foundation

@MainActor //it is similar to work with DispatchQueue.main.async
class DigimonListViewModel: ObservableObject {
    
    @Published var digimonList: [Digimon] = []
    @Published var customError: NetworkError?
    @Published private(set) var viewStates: ViewStates = .loading
    
    var pokemonRepository: PokemonRepositoryAction
    
    init(pokemonRepository: PokemonRepositoryAction) {
        self.pokemonRepository = pokemonRepository
    }
    
    func getDigimonList() async  {
        viewStates = .loading

        do {
            let list = try await pokemonRepository.getListOfDigimons()
            self.digimonList = list
            guard self.digimonList.isEmpty else {
                viewStates = .loaded
                return
            }
            viewStates = .emptyView
        }catch let error {
            viewStates = .errorState
            switch error {
            case is DecodingError:
                customError = NetworkError.parsingError
            case is URLError:
                customError = .invalidUrlError
            case NetworkError.dataNotFoundError:
                customError = NetworkError.dataNotFoundError
            case NetworkError.responseError:
                customError = NetworkError.responseError
//            case NSUserCancelledError:
//                print("NSUserCancelledError")
//                customError = .dataNotFoundError
            case is CancellationError:
                customError = .dataNotFoundError
                print("CancellationError")
            default:
                customError = .dataNotFoundError
            }
            print(error.localizedDescription)
        }
    }
    
}


class ViewmodelDuo: DigimonListViewModel {
    
}
