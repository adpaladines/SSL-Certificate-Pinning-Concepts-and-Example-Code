//
//  FakeDigimonRepository.swift
//  MVVMAPICallSwiftUI
//
//  Created by Andres D. Paladines on 8/10/23.
//

import Foundation
@testable import MVVMAPICallSwiftUI

class FakeDigimonRepository {

    let useCase : TestUseCasesEnum
    var networkManager: NetworkAbleProtocol

    init(networkManager: NetworkAbleProtocol, useCase: TestUseCasesEnum) {
        self.networkManager = networkManager
        self.useCase = useCase
    }
}

extension FakeDigimonRepository: PokemonRepositoryAction {

    func getListOfDigimons() async throws -> [Digimon] {
        do {
            let pokemonRequest = DigimonRequest(path: useCase.rawValue)

            let data = try await networkManager.getDataFromApi(urlRequest: pokemonRequest)
            let digimonList = try JSONDecoder().decode([Digimon].self, from: data)
            return digimonList
        }catch let error {
            throw error
        }
    }

}
