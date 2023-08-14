//
//  MockRepository.swift
//  MVVMAPICallSwiftUI
//
//  Created by Andres D. Paladines on 8/10/23.
//

import Foundation
@testable import MVVMAPICallSwiftUI

class MockDigimonRepository {

    var useCase: TestUseCasesEnum
    var networkManager: NetworkAbleProtocol

    private var error: NetworkError?
    private var digimonList: [Digimon]?

    init(networkManager: NetworkAbleProtocol, useCase: TestUseCasesEnum) {
        self.networkManager = networkManager
        self.useCase = useCase
    }

}

extension MockDigimonRepository: PokemonRepositoryAction {

    func getListOfDigimons() async throws -> [Digimon] {
        do {
            if let error = self.error {
                throw error
            }
            if let error = getErrorFrom(useCase: useCase) {
                throw error
            }
            return digimonList ?? []

        }catch let error {
            throw error
        }
    }

    func setDigimonsList(_ list: [Digimon]) {
        self.digimonList = list
    }

    func setError(error: NetworkError) {
        self.error = error
    }

    func getErrorFrom(useCase: TestUseCasesEnum) -> NetworkError? {
        switch useCase {
        case .digimonIncorrectData:
            return .parsingError
        case .digimonList, .none, .empyList:
            return nil
        case .noData:
            return .responseError
        }
    }

}
